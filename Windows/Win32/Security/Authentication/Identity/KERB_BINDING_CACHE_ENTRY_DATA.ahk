#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\LSA_UNICODE_STRING.ahk

/**
 * Specifies the data for the binding cache entry.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-kerb_binding_cache_entry_data
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class KERB_BINDING_CACHE_ENTRY_DATA extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * The time elapsed to find the domain controller to bind to.
     * @type {Integer}
     */
    DiscoveryTime {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The 	name of the realm for which to obtain a binding handle.
     * @type {LSA_UNICODE_STRING}
     */
    RealmName{
        get {
            if(!this.HasProp("__RealmName"))
                this.__RealmName := LSA_UNICODE_STRING(this.ptr + 8)
            return this.__RealmName
        }
    }

    /**
     * The address of the Key Distribution Center (KDC) of the server to  which you want to bind.
     * @type {LSA_UNICODE_STRING}
     */
    KdcAddress{
        get {
            if(!this.HasProp("__KdcAddress"))
                this.__KdcAddress := LSA_UNICODE_STRING(this.ptr + 24)
            return this.__KdcAddress
        }
    }

    /**
     * 
     * @type {Integer}
     */
    AddressType {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * The domain controller flags that the caller provides. These flags are needed to pass to the <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsgetdcnamea">DsGetDcName</a> function.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * The domain controller flags. These flags are returned from the <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsgetdcnamea">DsGetDcName</a> function.
     * @type {Integer}
     */
    DcFlags {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

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
     * @type {Integer}
     */
    CacheFlags {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> that specifies the name of the KDC.
     * @type {LSA_UNICODE_STRING}
     */
    KdcName{
        get {
            if(!this.HasProp("__KdcName"))
                this.__KdcName := LSA_UNICODE_STRING(this.ptr + 56)
            return this.__KdcName
        }
    }
}
