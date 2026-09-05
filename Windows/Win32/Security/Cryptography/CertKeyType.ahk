#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class CertKeyType extends Win32Enum {

    /**
     * Native name: KeyTypeOther
     * @type {Integer (UInt32)}
     */
    static Other => 0

    /**
     * Native name: KeyTypeVirtualSmartCard
     * @type {Integer (UInt32)}
     */
    static VirtualSmartCard => 1

    /**
     * Native name: KeyTypePhysicalSmartCard
     * @type {Integer (UInt32)}
     */
    static PhysicalSmartCard => 2

    /**
     * Native name: KeyTypePassport
     * @type {Integer (UInt32)}
     */
    static Passport => 3

    /**
     * Native name: KeyTypePassportRemote
     * @type {Integer (UInt32)}
     */
    static PassportRemote => 4

    /**
     * Native name: KeyTypePassportSmartCard
     * @type {Integer (UInt32)}
     */
    static PassportSmartCard => 5

    /**
     * Native name: KeyTypeHardware
     * @type {Integer (UInt32)}
     */
    static Hardware => 6

    /**
     * Native name: KeyTypeSoftware
     * @type {Integer (UInt32)}
     */
    static Software => 7

    /**
     * Native name: KeyTypeSelfSigned
     * @type {Integer (UInt32)}
     */
    static SelfSigned => 8
}
