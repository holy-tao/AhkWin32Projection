#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\KERB_ADDRESS_TYPE.ahk" { KERB_ADDRESS_TYPE }

/**
 * Specifies the data for the binding cache entry.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-kerb_binding_cache_entry_data
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct KERB_BINDING_CACHE_ENTRY_DATA {
    #StructPack 8

    /**
     * The time elapsed to find the domain controller to bind to.
     */
    DiscoveryTime : Int64

    /**
     * The 	name of the realm for which to obtain a binding handle.
     */
    RealmName : LSA_UNICODE_STRING

    /**
     * The address of the Key Distribution Center (KDC) of the server to  which you want to bind.
     */
    KdcAddress : LSA_UNICODE_STRING

    AddressType : KERB_ADDRESS_TYPE

    /**
     * The domain controller flags that the caller provides. These flags are needed to pass to the <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsgetdcnamea">DsGetDcName</a> function.
     */
    Flags : UInt32

    /**
     * The domain controller flags. These flags are returned from the <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsgetdcnamea">DsGetDcName</a> function.
     */
    DcFlags : UInt32

    /**
     * Flags that provide more information about the binding cache.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="KERB_NO_DC_FLAGS"></a><a id="kerb_no_dc_flags"></a><dl>
     * <dt><b>KERB_NO_DC_FLAGS</b></dt>
     * <dt>0x10000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No flags are found for the binding cache.
     * 
     * </td>
     * </tr>
     * </table>
     */
    CacheFlags : UInt32

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> that specifies the name of the KDC.
     */
    KdcName : LSA_UNICODE_STRING

}
