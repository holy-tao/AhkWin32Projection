#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct MSIRUNMODE {
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
    static MSIRUNMODE_ADMIN => 0

    /**
     * @type {Integer (Int32)}
     */
    static MSIRUNMODE_ADVERTISE => 1

    /**
     * @type {Integer (Int32)}
     */
    static MSIRUNMODE_MAINTENANCE => 2

    /**
     * @type {Integer (Int32)}
     */
    static MSIRUNMODE_ROLLBACKENABLED => 3

    /**
     * @type {Integer (Int32)}
     */
    static MSIRUNMODE_LOGENABLED => 4

    /**
     * @type {Integer (Int32)}
     */
    static MSIRUNMODE_OPERATIONS => 5

    /**
     * @type {Integer (Int32)}
     */
    static MSIRUNMODE_REBOOTATEND => 6

    /**
     * @type {Integer (Int32)}
     */
    static MSIRUNMODE_REBOOTNOW => 7

    /**
     * @type {Integer (Int32)}
     */
    static MSIRUNMODE_CABINET => 8

    /**
     * @type {Integer (Int32)}
     */
    static MSIRUNMODE_SOURCESHORTNAMES => 9

    /**
     * @type {Integer (Int32)}
     */
    static MSIRUNMODE_TARGETSHORTNAMES => 10

    /**
     * @type {Integer (Int32)}
     */
    static MSIRUNMODE_RESERVED11 => 11

    /**
     * @type {Integer (Int32)}
     */
    static MSIRUNMODE_WINDOWS9X => 12

    /**
     * @type {Integer (Int32)}
     */
    static MSIRUNMODE_ZAWENABLED => 13

    /**
     * @type {Integer (Int32)}
     */
    static MSIRUNMODE_RESERVED14 => 14

    /**
     * @type {Integer (Int32)}
     */
    static MSIRUNMODE_RESERVED15 => 15

    /**
     * @type {Integer (Int32)}
     */
    static MSIRUNMODE_SCHEDULED => 16

    /**
     * @type {Integer (Int32)}
     */
    static MSIRUNMODE_ROLLBACK => 17

    /**
     * @type {Integer (Int32)}
     */
    static MSIRUNMODE_COMMIT => 18
}
