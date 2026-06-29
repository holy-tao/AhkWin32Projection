#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security
 */
export default struct SECURITY_DESCRIPTOR_CONTROL {
    value : UInt16

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt16)}
     */
    static SE_OWNER_DEFAULTED => 1

    /**
     * @type {Integer (UInt16)}
     */
    static SE_GROUP_DEFAULTED => 2

    /**
     * @type {Integer (UInt16)}
     */
    static SE_DACL_PRESENT => 4

    /**
     * @type {Integer (UInt16)}
     */
    static SE_DACL_DEFAULTED => 8

    /**
     * @type {Integer (UInt16)}
     */
    static SE_SACL_PRESENT => 16

    /**
     * @type {Integer (UInt16)}
     */
    static SE_SACL_DEFAULTED => 32

    /**
     * @type {Integer (UInt16)}
     */
    static SE_DACL_AUTO_INHERIT_REQ => 256

    /**
     * @type {Integer (UInt16)}
     */
    static SE_SACL_AUTO_INHERIT_REQ => 512

    /**
     * @type {Integer (UInt16)}
     */
    static SE_DACL_AUTO_INHERITED => 1024

    /**
     * @type {Integer (UInt16)}
     */
    static SE_SACL_AUTO_INHERITED => 2048

    /**
     * @type {Integer (UInt16)}
     */
    static SE_DACL_PROTECTED => 4096

    /**
     * @type {Integer (UInt16)}
     */
    static SE_SACL_PROTECTED => 8192

    /**
     * @type {Integer (UInt16)}
     */
    static SE_RM_CONTROL_VALID => 16384

    /**
     * @type {Integer (UInt16)}
     */
    static SE_SELF_RELATIVE => 32768
}
