#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct EPcxGeoLocation {
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
    static eGeoLocRear => 1

    /**
     * @type {Integer (Int32)}
     */
    static eGeoLocFront => 2

    /**
     * @type {Integer (Int32)}
     */
    static eGeoLocLeft => 3

    /**
     * @type {Integer (Int32)}
     */
    static eGeoLocRight => 4

    /**
     * @type {Integer (Int32)}
     */
    static eGeoLocTop => 5

    /**
     * @type {Integer (Int32)}
     */
    static eGeoLocBottom => 6

    /**
     * @type {Integer (Int32)}
     */
    static eGeoLocRearPanel => 7

    /**
     * @type {Integer (Int32)}
     */
    static eGeoLocRiser => 8

    /**
     * @type {Integer (Int32)}
     */
    static eGeoLocInsideMobileLid => 9

    /**
     * @type {Integer (Int32)}
     */
    static eGeoLocDrivebay => 10

    /**
     * @type {Integer (Int32)}
     */
    static eGeoLocHDMI => 11

    /**
     * @type {Integer (Int32)}
     */
    static eGeoLocOutsideMobileLid => 12

    /**
     * @type {Integer (Int32)}
     */
    static eGeoLocATAPI => 13

    /**
     * @type {Integer (Int32)}
     */
    static eGeoLocNotApplicable => 14

    /**
     * @type {Integer (Int32)}
     */
    static eGeoLocReserved6 => 15

    /**
     * @type {Integer (Int32)}
     */
    static EPcxGeoLocation_enum_count => 16
}
