#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DS_SITE_COST_INFO structure is used with the DsQuerySitesByCost function to contain communication cost data.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/ns-ntdsapi-ds_site_cost_info
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct DS_SITE_COST_INFO {
    #StructPack 4

    errorCode : UInt32

    /**
     * If the <b>errorCode</b> member contains <b>ERROR_SUCCESS</b>, this member contains the communication cost value of the site. If the <b>errorCode</b> member contains <b>ERROR_DS_OBJ_NOT_FOUND</b>, this contents of this member is undefined.
     */
    cost : UInt32

}
