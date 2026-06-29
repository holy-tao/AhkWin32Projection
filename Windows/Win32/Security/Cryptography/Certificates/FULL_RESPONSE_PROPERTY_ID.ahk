#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct FULL_RESPONSE_PROPERTY_ID {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static FR_PROP_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static FR_PROP_FULLRESPONSE => 1

    /**
     * @type {Integer (Int32)}
     */
    static FR_PROP_STATUSINFOCOUNT => 2

    /**
     * @type {Integer (Int32)}
     */
    static FR_PROP_BODYPARTSTRING => 3

    /**
     * @type {Integer (Int32)}
     */
    static FR_PROP_STATUS => 4

    /**
     * @type {Integer (Int32)}
     */
    static FR_PROP_STATUSSTRING => 5

    /**
     * @type {Integer (Int32)}
     */
    static FR_PROP_OTHERINFOCHOICE => 6

    /**
     * @type {Integer (Int32)}
     */
    static FR_PROP_FAILINFO => 7

    /**
     * @type {Integer (Int32)}
     */
    static FR_PROP_PENDINFOTOKEN => 8

    /**
     * @type {Integer (Int32)}
     */
    static FR_PROP_PENDINFOTIME => 9

    /**
     * @type {Integer (Int32)}
     */
    static FR_PROP_ISSUEDCERTIFICATEHASH => 10

    /**
     * @type {Integer (Int32)}
     */
    static FR_PROP_ISSUEDCERTIFICATE => 11

    /**
     * @type {Integer (Int32)}
     */
    static FR_PROP_ISSUEDCERTIFICATECHAIN => 12

    /**
     * @type {Integer (Int32)}
     */
    static FR_PROP_ISSUEDCERTIFICATECRLCHAIN => 13

    /**
     * @type {Integer (Int32)}
     */
    static FR_PROP_ENCRYPTEDKEYHASH => 14

    /**
     * @type {Integer (Int32)}
     */
    static FR_PROP_FULLRESPONSENOPKCS7 => 15

    /**
     * @type {Integer (Int32)}
     */
    static FR_PROP_CAEXCHANGECERTIFICATEHASH => 16

    /**
     * @type {Integer (Int32)}
     */
    static FR_PROP_CAEXCHANGECERTIFICATE => 17

    /**
     * @type {Integer (Int32)}
     */
    static FR_PROP_CAEXCHANGECERTIFICATECHAIN => 18

    /**
     * @type {Integer (Int32)}
     */
    static FR_PROP_CAEXCHANGECERTIFICATECRLCHAIN => 19

    /**
     * @type {Integer (Int32)}
     */
    static FR_PROP_ATTESTATIONCHALLENGE => 20

    /**
     * @type {Integer (Int32)}
     */
    static FR_PROP_ATTESTATIONPROVIDERNAME => 21
}
