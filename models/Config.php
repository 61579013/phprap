<?php
namespace app\models;

use Yii;

/**
 * This is the model class for table "doc_config".
 *
 * @property int $id
 * @property string $type 配置类型
 * @property string $content 配置内容
 * @property string $created_at
 * @property string $updated_at
 */
class Config extends Model
{
    /**
     * 绑定数据表
     */
    public static function tableName()
    {
        return '{{%config}}';
    }

    /**
     * 验证规则
     */
    public function rules()
    {
        return [
            [['type', 'content'], 'required'],
            [['content'], 'string'],
            [['created_at', 'updated_at'], 'safe'],
            [['type'], 'string', 'max' => 10],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'type' => 'Type',
            'content' => 'Content',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
        ];
    }

    /**
     * 获取不存在字段
     * @param string $name
     * @return mixed
     */
    public function __get($name)
    {
        if (!$this->hasAttribute($name)) {
            $config = json_decode($this->content);
            return $config->$name;
        }
        return parent::__get($name);
    }

}
