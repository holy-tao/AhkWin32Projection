#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct HLID_INFO {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static HLID_INVALID => 0

    /**
     * @type {Integer (UInt32)}
     */
    static HLID_PREVIOUS => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static HLID_NEXT => 4294967294

    /**
     * @type {Integer (UInt32)}
     */
    static HLID_CURRENT => 4294967293

    /**
     * @type {Integer (UInt32)}
     */
    static HLID_STACKBOTTOM => 4294967292

    /**
     * @type {Integer (UInt32)}
     */
    static HLID_STACKTOP => 4294967291
}
