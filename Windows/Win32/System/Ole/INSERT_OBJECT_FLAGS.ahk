#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ole
 */
export default struct INSERT_OBJECT_FLAGS {
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
    static IOF_SHOWHELP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IOF_SELECTCREATENEW => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IOF_SELECTCREATEFROMFILE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IOF_CHECKLINK => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IOF_CHECKDISPLAYASICON => 16

    /**
     * @type {Integer (UInt32)}
     */
    static IOF_CREATENEWOBJECT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static IOF_CREATEFILEOBJECT => 64

    /**
     * @type {Integer (UInt32)}
     */
    static IOF_CREATELINKOBJECT => 128

    /**
     * @type {Integer (UInt32)}
     */
    static IOF_DISABLELINK => 256

    /**
     * @type {Integer (UInt32)}
     */
    static IOF_VERIFYSERVERSEXIST => 512

    /**
     * @type {Integer (UInt32)}
     */
    static IOF_DISABLEDISPLAYASICON => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static IOF_HIDECHANGEICON => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static IOF_SHOWINSERTCONTROL => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static IOF_SELECTCREATECONTROL => 8192
}
