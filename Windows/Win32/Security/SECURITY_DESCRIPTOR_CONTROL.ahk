#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Security
 * @version v4.0.30319
 */
class SECURITY_DESCRIPTOR_CONTROL{

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
