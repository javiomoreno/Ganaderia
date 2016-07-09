<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "suelos".
 *
 * @property string $sueliden
 * @property string $suelnomb
 * @property string $sueldesc
 * @property string $sueltipo
 * @property string $suelcons
 * @property string $suelcomp
 *
 * @property PastosTierras[] $pastosTierras
 * @property TierrasGanados[] $tierrasGanados
 */
class Suelos extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'suelos';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['suelnomb', 'sueltipo'], 'string', 'max' => 50],
            [['sueldesc'], 'string', 'max' => 250],
            [['suelcons', 'suelcomp'], 'string', 'max' => 100],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'sueliden' => 'Sueliden',
            'suelnomb' => 'Suelnomb',
            'sueldesc' => 'Sueldesc',
            'sueltipo' => 'Sueltipo',
            'suelcons' => 'Suelcons',
            'suelcomp' => 'Suelcomp',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPastosTierras()
    {
        return $this->hasMany(PastosTierras::className(), ['Suelos_sueliden' => 'sueliden']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTierrasGanados()
    {
        return $this->hasMany(TierrasGanados::className(), ['Suelos_sueliden' => 'sueliden']);
    }
}
