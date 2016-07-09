<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "pastos_tierras".
 *
 * @property string $patiiden
 * @property string $Suelos_sueliden
 * @property string $Pastos_pastiden
 *
 * @property Pastos $pastosPastiden
 * @property Suelos $suelosSueliden
 */
class PastosTierras extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'pastos_tierras';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['Suelos_sueliden', 'Pastos_pastiden'], 'required'],
            [['Suelos_sueliden', 'Pastos_pastiden'], 'integer'],
            [['Pastos_pastiden'], 'exist', 'skipOnError' => true, 'targetClass' => Pastos::className(), 'targetAttribute' => ['Pastos_pastiden' => 'pastiden']],
            [['Suelos_sueliden'], 'exist', 'skipOnError' => true, 'targetClass' => Suelos::className(), 'targetAttribute' => ['Suelos_sueliden' => 'sueliden']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'patiiden' => 'Patiiden',
            'Suelos_sueliden' => 'Suelos Sueliden',
            'Pastos_pastiden' => 'Pastos Pastiden',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPastosPastiden()
    {
        return $this->hasOne(Pastos::className(), ['pastiden' => 'Pastos_pastiden']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSuelosSueliden()
    {
        return $this->hasOne(Suelos::className(), ['sueliden' => 'Suelos_sueliden']);
    }
}
