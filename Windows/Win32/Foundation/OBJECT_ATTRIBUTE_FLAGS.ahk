#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Foundation
 */
export default struct OBJECT_ATTRIBUTE_FLAGS {
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
    static OBJ_INHERIT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static OBJ_PERMANENT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static OBJ_EXCLUSIVE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static OBJ_CASE_INSENSITIVE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static OBJ_OPENIF => 128

    /**
     * @type {Integer (UInt32)}
     */
    static OBJ_OPENLINK => 256

    /**
     * @type {Integer (UInt32)}
     */
    static OBJ_KERNEL_HANDLE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static OBJ_FORCE_ACCESS_CHECK => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static OBJ_IGNORE_IMPERSONATED_DEVICEMAP => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static OBJ_DONT_REPARSE => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static OBJ_VALID_ATTRIBUTES => 8178
}
