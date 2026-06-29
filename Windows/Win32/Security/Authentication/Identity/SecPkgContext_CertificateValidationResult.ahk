#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\HRESULT.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class SecPkgContext_CertificateValidationResult extends Win32Struct {
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dwChainErrorStatus {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {HRESULT}
     */
    hrVerifyChainStatus {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
