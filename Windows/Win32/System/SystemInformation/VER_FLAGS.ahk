#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemInformation
 */
export default struct VER_FLAGS {
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
    static VER_MINORVERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static VER_MAJORVERSION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static VER_BUILDNUMBER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static VER_PLATFORMID => 8

    /**
     * @type {Integer (UInt32)}
     */
    static VER_SERVICEPACKMINOR => 16

    /**
     * @type {Integer (UInt32)}
     */
    static VER_SERVICEPACKMAJOR => 32

    /**
     * @type {Integer (UInt32)}
     */
    static VER_SUITENAME => 64

    /**
     * @type {Integer (UInt32)}
     */
    static VER_PRODUCT_TYPE => 128
}
