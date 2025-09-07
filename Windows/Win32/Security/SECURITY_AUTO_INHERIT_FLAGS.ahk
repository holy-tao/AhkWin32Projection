#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Security
 * @version v4.0.30319
 */
class SECURITY_AUTO_INHERIT_FLAGS{

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
