<?php

namespace app\models;

use Yii;
use yii\db\ActiveRecord;
use yii\web\IdentityInterface;

/**
 * This is the model class for table "usuarios".
 *
 * @property string $usuaiden
 * @property string $TipoUsuarios_tiusiden
 * @property string $usuanomb
 * @property string $usuaapel
 * @property string $usuatele
 * @property string $usuadire
 * @property string $usuacorr
 * @property string $usuapass
 *
 * @property Reglasinferencias[] $reglasinferencias
 * @property Tipousuarios $tipoUsuariosTiusiden
 */
class Usuarios extends ActiveRecord implements IdentityInterface
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'usuarios';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['TipoUsuarios_tiusiden'], 'required'],
            [['TipoUsuarios_tiusiden'], 'integer'],
            [['usuanomb', 'usuaapel', 'usuatele'], 'string', 'max' => 50],
            [['usuadire'], 'string', 'max' => 200],
            [['usuacorr'], 'string', 'max' => 100],
            [['usuapass'], 'string', 'max' => 250],
            [['TipoUsuarios_tiusiden'], 'exist', 'skipOnError' => true, 'targetClass' => Tipousuarios::className(), 'targetAttribute' => ['TipoUsuarios_tiusiden' => 'tiusiden']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'usuaiden' => 'Usuaiden',
            'TipoUsuarios_tiusiden' => 'Tipo Usuarios Tiusiden',
            'usuanomb' => 'Usuanomb',
            'usuaapel' => 'Usuaapel',
            'usuatele' => 'Usuatele',
            'usuadire' => 'Usuadire',
            'usuacorr' => 'Usuacorr',
            'usuapass' => 'Usuapass',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getReglasinferencias()
    {
        return $this->hasMany(Reglasinferencias::className(), ['Usuarios_usuaiden' => 'usuaiden']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTipoUsuariosTiusiden()
    {
        return $this->hasOne(Tipousuarios::className(), ['tiusiden' => 'TipoUsuarios_tiusiden']);
    }

    public static function findIdentity($id)
    {
        return static::findOne(['usuaiden' => $id]);
    }

    /**
    * Finds user by username
    *
    * @param string $username
    * @return static|null
    */
    public static function findByUsername($username)
    {
        return static::findOne(['usuauser' => $username]);
    }
    /**
    * Finds user by username
    *
    * @param string $username
    * @return static|null
    */
    public static function findByEmail($usuaemai)
    {
        return static::findOne(['usuacorr' => $usuaemai]);
    }
    /**
    * @inheritdoc
    */
    public function getId()
    {
        return $this->getPrimaryKey();
    }
    /**
    * Validates password
    *
    * @param string $password password to validate
    * @return boolean if password provided is valid for current user
    */
    public function validatePassword($password)
    {
        if (base64_decode($this->usuapass) == $password) {
            return true;
        }
        return false;
    }
    /**
    * Generates password hash from password and sets it to the model
    *
    * @param string $password
    */
    public function setPassword($password)
    {
        $this->usuapass = base64_encode($password);
    }
    /**
    * Generates password hash from password and sets it to the model
    *
    * @return password Decodificado
    */
    public function getPassword()
    {
        return base64_decode($this->usuapass);
    }
    /**
    * @inheritdoc
    */
    public function getAuthKey()
    {
    }
    /**
    * @inheritdoc
    */
    public function validateAuthKey($authKey)
    {
    }
    /**
    * @inheritdoc
    */
    public static function findIdentityByAccessToken($token, $type = null)
    {
    }
}
