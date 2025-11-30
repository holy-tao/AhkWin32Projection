#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class SECRET_PURPOSE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static AuthenticationPin => 0

    /**
     * @type {Integer (Int32)}
     */
    static DigitalSignaturePin => 1

    /**
     * @type {Integer (Int32)}
     */
    static EncryptionPin => 2

    /**
     * @type {Integer (Int32)}
     */
    static NonRepudiationPin => 3

    /**
     * @type {Integer (Int32)}
     */
    static AdministratorPin => 4

    /**
     * @type {Integer (Int32)}
     */
    static PrimaryCardPin => 5

    /**
     * @type {Integer (Int32)}
     */
    static UnblockOnlyPin => 6
}
