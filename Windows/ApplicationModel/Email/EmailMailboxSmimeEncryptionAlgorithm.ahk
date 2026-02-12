#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the encryption algorithm used for an email.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxsmimeencryptionalgorithm
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class EmailMailboxSmimeEncryptionAlgorithm extends Win32Enum{

    /**
     * The encryption algorithm requirements are not specified.
     * @type {Integer (Int32)}
     */
    static Any => 0

    /**
     * Use the Triple Data Encryption Algorithm symmetric-key block cipher algorithm.
     * @type {Integer (Int32)}
     */
    static TripleDes => 1

    /**
     * Use the Data Encryption Standard symmetric key block cipher algorithm.
     * @type {Integer (Int32)}
     */
    static Des => 2

    /**
     * Use the RC2 128-bit block cipher encryption algorithm.
     * @type {Integer (Int32)}
     */
    static RC2128Bit => 3

    /**
     * Use the RC2 64-bit block cipher encryption algorithm.
     * @type {Integer (Int32)}
     */
    static RC264Bit => 4

    /**
     * Use the RC2 40-bit block cipher encryption algorithm.
     * @type {Integer (Int32)}
     */
    static RC240Bit => 5
}
