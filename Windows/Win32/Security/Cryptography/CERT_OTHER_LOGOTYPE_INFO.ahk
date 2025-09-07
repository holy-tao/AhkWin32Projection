#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include .\CERT_LOGOTYPE_INFO.ahk

/**
 * Contains information about logo types that are not predefined.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_other_logotype_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_OTHER_LOGOTYPE_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * 
     * @type {PSTR}
     */
    pszObjId{
        get {
            if(!this.HasProp("__pszObjId"))
                this.__pszObjId := PSTR(this.ptr + 0)
            return this.__pszObjId
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_logotype_info">CERT_LOGOTYPE_INFO</a> structure that contains the logo type information.
     * @type {CERT_LOGOTYPE_INFO}
     */
    LogotypeInfo{
        get {
            if(!this.HasProp("__LogotypeInfo"))
                this.__LogotypeInfo := CERT_LOGOTYPE_INFO(this.ptr + 8)
            return this.__LogotypeInfo
        }
    }
}
