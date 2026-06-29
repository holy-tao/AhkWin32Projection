#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct BDA_DigitalSignalStandard {
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
    static Bda_DigitalStandard_None => 0

    /**
     * @type {Integer (Int32)}
     */
    static Bda_DigitalStandard_DVB_T => 1

    /**
     * @type {Integer (Int32)}
     */
    static Bda_DigitalStandard_DVB_S => 2

    /**
     * @type {Integer (Int32)}
     */
    static Bda_DigitalStandard_DVB_C => 4

    /**
     * @type {Integer (Int32)}
     */
    static Bda_DigitalStandard_ATSC => 8

    /**
     * @type {Integer (Int32)}
     */
    static Bda_DigitalStandard_ISDB_T => 16

    /**
     * @type {Integer (Int32)}
     */
    static Bda_DigitalStandard_ISDB_S => 32

    /**
     * @type {Integer (Int32)}
     */
    static Bda_DigitalStandard_ISDB_C => 64
}
