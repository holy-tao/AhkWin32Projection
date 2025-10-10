#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DS_SITE_COST_INFO structure is used with the DsQuerySitesByCost function to contain communication cost data.
 * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/ns-ntdsapi-ds_site_cost_info
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class DS_SITE_COST_INFO extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * 
     * @type {Integer}
     */
    errorCode {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * If the <b>errorCode</b> member contains <b>ERROR_SUCCESS</b>, this member contains the communication cost value of the site. If the <b>errorCode</b> member contains <b>ERROR_DS_OBJ_NOT_FOUND</b>, this contents of this member is undefined.
     * @type {Integer}
     */
    cost {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
