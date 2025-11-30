#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_QUERY_ENCODING_TYPE extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static X509_ASN_ENCODING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PKCS_7_ASN_ENCODING => 65536
}
