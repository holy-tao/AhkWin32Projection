#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Represents the licensing status. (SL_LICENSING_STATUS)
 * @see https://learn.microsoft.com/windows/win32/api/slpublic/ns-slpublic-sl_licensing_status
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SL_LICENSING_STATUS extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: <b>SLID</b>
     * 
     * The SKU ID.
     * @type {Pointer<Guid>}
     */
    SkuId {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/slpublic/ne-slpublic-sllicensingstatus">SLLICENSINGSTATUS</a></b>
     * 
     * The licensing status.
     * @type {Integer}
     */
    eStatus {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The grace time in minutes.
     * @type {Integer}
     */
    dwGraceTime {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The predefined grace days in the license.
     * @type {Integer}
     */
    dwTotalGraceDays {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b>HRESULT</b>
     * 
     * The error of unlicensed status.
     * @type {Integer}
     */
    hrReason {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * Type: <b>UINT64</b>
     * 
     * The validity expiration day.
     * @type {Integer}
     */
    qwValidityExpiration {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
