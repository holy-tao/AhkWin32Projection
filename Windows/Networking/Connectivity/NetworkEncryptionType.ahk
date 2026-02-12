#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines values that indicate the type of encryption used for authentication.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.networkencryptiontype
 * @namespace Windows.Networking.Connectivity
 * @version WindowsRuntime 1.4
 */
class NetworkEncryptionType extends Win32Enum{

    /**
     * No encryption enabled.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Encryption method unknown.
     * @type {Integer (Int32)}
     */
    static Unknown => 1

    /**
     * Specifies a WEP cipher algorithm with a cipher key of any length.
     * @type {Integer (Int32)}
     */
    static Wep => 2

    /**
     * Specifies a Wired Equivalent Privacy (WEP) algorithm, which is the RC4-based algorithm that is specified in the IEEE 802.11-1999 standard. This enumerator specifies the WEP cipher algorithm with a 40-bit cipher key.
     * @type {Integer (Int32)}
     */
    static Wep40 => 3

    /**
     * Specifies a WEP cipher algorithm with a 104-bit cipher key.
     * @type {Integer (Int32)}
     */
    static Wep104 => 4

    /**
     * Specifies a Temporal Key Integrity Protocol (TKIP) algorithm, which is the RC4-based cipher suite that is based on the algorithms that are defined in the WPA specification and IEEE 802.11i-2004 standard. This cipher also uses the Michael Message Integrity Code (MIC) algorithm for forgery protection.
     * @type {Integer (Int32)}
     */
    static Tkip => 5

    /**
     * Specifies an AES-CCMP algorithm, as specified in the IEEE 802.11i-2004 standard and RFC 3610. Advanced Encryption Standard (AES) is the encryption algorithm defined in FIPS PUB 197.
     * @type {Integer (Int32)}
     */
    static Ccmp => 6

    /**
     * Specifies a Wifi Protected Access (WPA) Use Group Key cipher suite. For more information about the Use Group Key cipher suite, refer to Clause 7.3.2.25.1 of the IEEE 802.11i-2004 standard.
     * @type {Integer (Int32)}
     */
    static WpaUseGroup => 7

    /**
     * Specifies a Robust Security Network (RSN) Use Group Key cipher suite. For more information about the Use Group Key cipher suite, refer to Clause 7.3.2.25.1 of the IEEE 802.11i-2004 standard.
     * @type {Integer (Int32)}
     */
    static RsnUseGroup => 8

    /**
     * Specifies an encryption type defined by an independent hardware vendor (IHV).
     * @type {Integer (Int32)}
     */
    static Ihv => 9

    /**
     * Specifies an AES-GCMP algorithm, as specified in the IEEE 802.11-2016 standard, with a 128-bit key. Advanced Encryption Standard (AES) is the encryption algorithm defined in FIPS PUB 197.
     * @type {Integer (Int32)}
     */
    static Gcmp => 10

    /**
     * Specifies an AES-GCMP algorithm, as specified in the IEEE 802.11-2016 standard, with a 256-bit key. Advanced Encryption Standard (AES) is the encryption algorithm defined in FIPS PUB 197.
     * @type {Integer (Int32)}
     */
    static Gcmp256 => 11
}
