#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\FW_DYNAMIC_KEYWORD_ADDRESS0.ahk

/**
 * Holds the data returned to the client when the **Enumeration** APIs are called.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/netfw/ns-netfw-fw_dynamic_keyword_address_data0
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class FW_DYNAMIC_KEYWORD_ADDRESS_DATA0 extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Type: **[FW_DYNAMIC_KEYWORD_ADDRESS0](ns-netfw-fw_dynamic_keyword_address0.md)**
     * 
     * A dynamic keyword address (the dynamic keyword address object).
     * @type {FW_DYNAMIC_KEYWORD_ADDRESS0}
     */
    dynamicKeywordAddress{
        get {
            if(!this.HasProp("__dynamicKeywordAddress"))
                this.__dynamicKeywordAddress := FW_DYNAMIC_KEYWORD_ADDRESS0(this.ptr + 0)
            return this.__dynamicKeywordAddress
        }
    }

    /**
     * Type: **[FW_DYNAMIC_KEYWORD_ADDRESS0](ns-netfw-fw_dynamic_keyword_address0.md)\***
     * 
     * A pointer to the next dynamic keyword address object in a linked list.
     * @type {Pointer<FW_DYNAMIC_KEYWORD_ADDRESS_DATA0>}
     */
    next {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Type: **[WORD](/windows/win32/api/guiddef/ns-guiddef-guid)**
     * 
     * The schema version of the object. This is used by the [**FWFreeDynamicKeywordAddressData0**](/windows/win32/api/netfw/nc-netfw-pfn_fwfreedynamickeywordaddressdata0) API.
     * @type {Integer}
     */
    schemaVersion {
        get => NumGet(this, 40, "ushort")
        set => NumPut("ushort", value, this, 40)
    }

    /**
     * Type: **[FW_DYNAMIC_KEYWORD_ORIGIN_TYPE](ne-netfw-fw_dynamic_keyword_origin_type.md)**
     * 
     * Indicates the origin of this object. It can be either **FW_DYNAMIC_KEYWORD_ORIGIN_LOCAL**, which represents a locally created object, or **FW_DYNAMIC_KEYWORD_ORIGIN_MDM**, which represents an MDM managed object.
     * @type {Integer}
     */
    originType {
        get => NumGet(this, 44, "int")
        set => NumPut("int", value, this, 44)
    }
}
