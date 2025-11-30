#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CertKeyType extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static KeyTypeOther => 0

    /**
     * @type {Integer (UInt32)}
     */
    static KeyTypeVirtualSmartCard => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KeyTypePhysicalSmartCard => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KeyTypePassport => 3

    /**
     * @type {Integer (UInt32)}
     */
    static KeyTypePassportRemote => 4

    /**
     * @type {Integer (UInt32)}
     */
    static KeyTypePassportSmartCard => 5

    /**
     * @type {Integer (UInt32)}
     */
    static KeyTypeHardware => 6

    /**
     * @type {Integer (UInt32)}
     */
    static KeyTypeSoftware => 7

    /**
     * @type {Integer (UInt32)}
     */
    static KeyTypeSelfSigned => 8
}
