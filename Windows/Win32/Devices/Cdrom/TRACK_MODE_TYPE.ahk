#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Cdrom
 */
export default struct TRACK_MODE_TYPE {
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
    static YellowMode2 => 0

    /**
     * @type {Integer (Int32)}
     */
    static XAForm2 => 1

    /**
     * @type {Integer (Int32)}
     */
    static CDDA => 2

    /**
     * @type {Integer (Int32)}
     */
    static RawWithC2AndSubCode => 3

    /**
     * @type {Integer (Int32)}
     */
    static RawWithC2 => 4

    /**
     * @type {Integer (Int32)}
     */
    static RawWithSubCode => 5
}
