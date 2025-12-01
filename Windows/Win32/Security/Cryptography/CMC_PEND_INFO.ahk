#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * A possible member of a CMC_STATUS_INFO structure.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cmc_pend_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CMC_PEND_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/SecGloss/b-gly">BLOB</a> that contains the pending request information.
     * @type {CRYPT_INTEGER_BLOB}
     */
    PendToken{
        get {
            if(!this.HasProp("__PendToken"))
                this.__PendToken := CRYPT_INTEGER_BLOB(0, this)
            return this.__PendToken
        }
    }

    /**
     * <b>FILETIME</b> containing the request.
     * @type {FILETIME}
     */
    PendTime{
        get {
            if(!this.HasProp("__PendTime"))
                this.__PendTime := FILETIME(16, this)
            return this.__PendTime
        }
    }
}
