#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct CHANGER_ELEMENT_STATUS_FLAGS {
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
    static ELEMENT_STATUS_ACCESS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static ELEMENT_STATUS_AVOLTAG => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static ELEMENT_STATUS_EXCEPT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ELEMENT_STATUS_EXENAB => 16

    /**
     * @type {Integer (UInt32)}
     */
    static ELEMENT_STATUS_FULL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ELEMENT_STATUS_ID_VALID => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static ELEMENT_STATUS_IMPEXP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ELEMENT_STATUS_INENAB => 32

    /**
     * @type {Integer (UInt32)}
     */
    static ELEMENT_STATUS_INVERT => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static ELEMENT_STATUS_LUN_VALID => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static ELEMENT_STATUS_NOT_BUS => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static ELEMENT_STATUS_PVOLTAG => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static ELEMENT_STATUS_SVALID => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static ELEMENT_STATUS_PRODUCT_DATA => 64
}
