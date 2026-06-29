#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct LicenseEventBlockReason {
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
    static LIC_BadLicense => 0

    /**
     * @type {Integer (Int32)}
     */
    static LIC_NeedIndiv => 1

    /**
     * @type {Integer (Int32)}
     */
    static LIC_Expired => 2

    /**
     * @type {Integer (Int32)}
     */
    static LIC_NeedActivation => 3

    /**
     * @type {Integer (Int32)}
     */
    static LIC_ExtenderBlocked => 4
}
