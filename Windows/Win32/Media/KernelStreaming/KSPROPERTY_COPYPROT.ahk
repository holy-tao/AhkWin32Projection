#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSPROPERTY_COPYPROT {
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
    static KSPROPERTY_DVDCOPY_CHLG_KEY => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_DVDCOPY_DVD_KEY1 => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_DVDCOPY_DEC_KEY2 => 3

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_DVDCOPY_TITLE_KEY => 4

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_COPY_MACROVISION => 5

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_DVDCOPY_REGION => 6

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_DVDCOPY_SET_COPY_STATE => 7

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_DVDCOPY_DISC_KEY => 128
}
