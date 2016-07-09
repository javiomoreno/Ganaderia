<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "ganados_pastos".
 *
 * @property string $gapaiden
 * @property string $Ganados_ganaiden
 * @property string $Pastos_pastiden
 *
 * @property Pastos $pastosPastiden
 * @property Ganados $ganadosGanaiden
 */
class GanadosPastos extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'ganados_pastos';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['Ganados_ganaiden', 'Pastos_pastiden'], 'required'],
            [['Ganados_ganaiden', 'Pastos_pastiden'], 'integer'],
            [['Pastos_pastiden'], 'exist', 'skipOnError' => true, 'targetClass' => Pastos::className(), 'targetAttribute' => ['Pastos_pastiden' => 'pastiden']],
            [['Ganados_ganaiden'], 'exist', 'skipOnError' => true, 'targetClass' => Ganados::className(), 'targetAttribute' => ['Ganados_ganaiden' => 'ganaiden']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'gapaiden' => 'Gapaiden',
            'Ganados_ganaiden' => 'Ganados Ganaiden',
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
    public function getGanadosGanaiden()
    {
        return $this->hasOne(Ganados::className(), ['ganaiden' => 'Ganados_ganaiden']);
    }
}
