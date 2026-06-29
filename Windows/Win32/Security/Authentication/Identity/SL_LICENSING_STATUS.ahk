#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\SLLICENSINGSTATUS.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\HRESULT.ahk

/**
 * Represents the licensing status. (SL_LICENSING_STATUS)
 * @see https://learn.microsoft.com/windows/win32/api/slpublic/ns-slpublic-sl_licensing_status
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class SL_LICENSING_STATUS extends Win32Struct {
    static sizeof => 40

    static packingSize => 8

    /**
     * Type: <b>SLID</b>
     * 
     * The SKU ID.
     * @type {Guid}
     */
    SkuId {
        get {
            if(!this.HasProp("__SkuId"))
                this.__SkuId := Guid(0, this)
            return this.__SkuId
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/slpublic/ne-slpublic-sllicensingstatus">SLLICENSINGSTATUS</a></b>
     * 
     * The licensing status.
     * @type {SLLICENSINGSTATUS}
     */
    eStatus {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The grace time in minutes.
     * @type {Integer}
     */
    dwGraceTime {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The predefined grace days in the license.
     * @type {Integer}
     */
    dwTotalGraceDays {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b>HRESULT</b>
     * 
     * The error of unlicensed status.
     * @type {HRESULT}
     */
    hrReason {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * Type: <b>UINT64</b>
     * 
     * The validity expiration day.
     * @type {Integer}
     */
    qwValidityExpiration {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
