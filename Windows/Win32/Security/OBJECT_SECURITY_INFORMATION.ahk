#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Security
 * @version v4.0.30319
 */
class OBJECT_SECURITY_INFORMATION{

    /**
     * @type {Integer (UInt32)}
     */
    static ATTRIBUTE_SECURITY_INFORMATION => 32

    /**
     * @type {Integer (UInt32)}
     */
    static BACKUP_SECURITY_INFORMATION => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static DACL_SECURITY_INFORMATION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static GROUP_SECURITY_INFORMATION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LABEL_SECURITY_INFORMATION => 16

    /**
     * @type {Integer (UInt32)}
     */
    static OWNER_SECURITY_INFORMATION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PROTECTED_DACL_SECURITY_INFORMATION => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static PROTECTED_SACL_SECURITY_INFORMATION => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static SACL_SECURITY_INFORMATION => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SCOPE_SECURITY_INFORMATION => 64

    /**
     * @type {Integer (UInt32)}
     */
    static UNPROTECTED_DACL_SECURITY_INFORMATION => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static UNPROTECTED_SACL_SECURITY_INFORMATION => 268435456
}
