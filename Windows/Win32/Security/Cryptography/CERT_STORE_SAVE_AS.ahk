#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The certificate store can be saved as a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">PKCS #7</a> signed message that does not include additional properties. The <i>dwEncodingType</i> parameter specifies the message encoding type.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/nf-wincrypt-certsavestore
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_STORE_SAVE_AS extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_STORE_SAVE_AS_PKCS7 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_STORE_SAVE_AS_STORE => 1
}
