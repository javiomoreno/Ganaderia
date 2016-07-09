<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "pastos".
 *
 * @property string $pastiden
 * @property string $pastnomb
 * @property string $pastdesc
 * @property string $pastespe
 *
 * @property GanadosPastos[] $ganadosPastos
 * @property PastosTierras[] $pastosTierras
 */
class Pastos extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'pastos';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['pastnomb'], 'string', 'max' => 50],
            [['pastdesc'], 'string', 'max' => 200],
            [['pastespe'], 'string', 'max' => 100],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'pastiden' => 'Pastiden',
            'pastnomb' => 'Pastnomb',
            'pastdesc' => 'Pastdesc',
            'pastespe' => 'Pastespe',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getGanadosPastos()
    {
        return $this->hasMany(GanadosPastos::className(), ['Pastos_pastiden' => 'pastiden']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPastosTierras()
    {
        return $this->hasMany(PastosTierras::className(), ['Pastos_pastiden' => 'pastiden']);
    }
}
