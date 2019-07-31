<?php

namespace app\models\account;

use app\models\Account;
use Yii;

class PasswordForm extends Account
{

    public $old_password;
    public $new_password;

    public function rules()
    {

        return [

            ['old_password', 'required', 'message' => '原始密码不能为空', 'on' => 'home'],
            ['old_password', 'validatePassword', 'on' => 'home'],

            ['new_password', 'required', 'message' => '登录密码不能为空'],

        ];
    }

    /**
     * 验证密码是否正确
     * @param $attribute
     */
    public function validatePassword($attribute)
    {
        $account = Account::findModel($this->id);

        if(!$account->id || !$account->validatePassword($this->old_password))
        {

            $this->addError($attribute, '原始密码验证失败');
        }
    }

    public function store()
    {

        if (!$this->validate()) {
            return false;
        }

        // 开启事务
        $transaction = Yii::$app->db->beginTransaction();

        $account = Account::findModel($this->id);

        $account->setPassword($this->new_password);
        $account->generateAuthKey();
        $account->updated_at = date('Y-m-d H:i:s');
        
        if(!$account->save())
        {
            $this->addError($account->getErrorLabel(), $account->getErrorMessage());
            $transaction->rollBack();
            return false;
        }

        // 事务提交
        $transaction->commit();

        // 重新登录
        if($this->scenario == 'home'){
            Yii::$app->user->logout();
        }
        
        return true;

    }

}