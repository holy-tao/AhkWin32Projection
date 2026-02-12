#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the cryptogram generation algorithm for a cryptogram placement step.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogramalgorithm
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class SmartCardCryptogramAlgorithm extends Win32Enum{

    /**
     * Do not use any algorithm.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Use the cipher block chaining message authentication code (CBC-MAC) algorithm.
     * @type {Integer (Int32)}
     */
    static CbcMac => 1

    /**
     * Use the CVC3-UMD algorithm.
     * @type {Integer (Int32)}
     */
    static Cvc3Umd => 2

    /**
     * Use the decimalized MSD algorithm.
     * @type {Integer (Int32)}
     */
    static DecimalizedMsd => 3

    /**
     * Use the CVC3-MD algorithm.
     * @type {Integer (Int32)}
     */
    static Cvc3MD => 4

    /**
     * Use the SHA-1 algorithm.
     * @type {Integer (Int32)}
     */
    static Sha1 => 5

    /**
     * Use the signed dynamic application data algorithm.
     * @type {Integer (Int32)}
     */
    static SignedDynamicApplicationData => 6

    /**
     * Use the Public-Key Cryptography Standards 1 (PKCS) RSA algorithm.
     * @type {Integer (Int32)}
     */
    static RsaPkcs1 => 7

    /**
     * Use the SHA-256 HMAC algorithm.
     * @type {Integer (Int32)}
     */
    static Sha256Hmac => 8
}
