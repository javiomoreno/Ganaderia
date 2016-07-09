<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "ganados".
 *
 * @property string $ganaiden
 * @property string $gananomb
 * @property string $ganadesc
 * @property string $ganaespe
 * @property string $ganapeso
 *
 * @property GanadosPastos[] $ganadosPastos
 * @property TierrasGanados[] $tierrasGanados
 */
class Ganados extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'ganados';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['gananomb', 'ganaespe', 'ganapeso'], 'string', 'max' => 50],
            [['ganadesc'], 'string', 'max' => 250],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'ganaiden' => 'Ganaiden',
            'gananomb' => 'Gananomb',
            'ganadesc' => 'Ganadesc',
            'ganaespe' => 'Ganaespe',
            'ganapeso' => 'Ganapeso',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getGanadosPastos()
    {
        return $this->hasMany(GanadosPastos::className(), ['Ganados_ganaiden' => 'ganaiden']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTierrasGanados()
    {
        return $this->hasMany(TierrasGanados::className(), ['Ganados_ganaiden' => 'ganaiden']);
    }
}
