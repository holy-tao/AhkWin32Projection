#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CERT_LOGOTYPE_OPTION.ahk
#Include .\CERT_LOGOTYPE_DATA.ahk
#Include .\CERT_LOGOTYPE_REFERENCE.ahk

/**
 * Contains information about logotype data.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_logotype_info
 * @namespace Windows.Win32.Security.Cryptography
 */
class CERT_LOGOTYPE_INFO extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {CERT_LOGOTYPE_OPTION}
     */
    dwLogotypeInfoChoice {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<CERT_LOGOTYPE_DATA>}
     */
    pLogotypeDirectInfo {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<CERT_LOGOTYPE_REFERENCE>}
     */
    pLogotypeIndirectInfo {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
