#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct ODS_FLAGS {
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
    static ODS_SELECTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ODS_GRAYED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ODS_DISABLED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ODS_CHECKED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static ODS_FOCUS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static ODS_DEFAULT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static ODS_COMBOBOXEDIT => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static ODS_HOTLIGHT => 64

    /**
     * @type {Integer (UInt32)}
     */
    static ODS_INACTIVE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static ODS_NOACCEL => 256

    /**
     * @type {Integer (UInt32)}
     */
    static ODS_NOFOCUSRECT => 512
}
