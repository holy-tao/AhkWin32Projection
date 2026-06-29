#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security
 */
export default struct SECURITY_AUTO_INHERIT_FLAGS {
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
    static SEF_AVOID_OWNER_CHECK => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SEF_AVOID_OWNER_RESTRICTION => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static SEF_AVOID_PRIVILEGE_CHECK => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SEF_DACL_AUTO_INHERIT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SEF_DEFAULT_DESCRIPTOR_FOR_OBJECT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SEF_DEFAULT_GROUP_FROM_PARENT => 64

    /**
     * @type {Integer (UInt32)}
     */
    static SEF_DEFAULT_OWNER_FROM_PARENT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SEF_MACL_NO_EXECUTE_UP => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static SEF_MACL_NO_READ_UP => 512

    /**
     * @type {Integer (UInt32)}
     */
    static SEF_MACL_NO_WRITE_UP => 256

    /**
     * @type {Integer (UInt32)}
     */
    static SEF_SACL_AUTO_INHERIT => 2
}
