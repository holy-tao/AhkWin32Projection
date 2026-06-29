#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FW_DYNAMIC_KEYWORD_ADDRESS0.ahk" { FW_DYNAMIC_KEYWORD_ADDRESS0 }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\FW_DYNAMIC_KEYWORD_ORIGIN_TYPE.ahk" { FW_DYNAMIC_KEYWORD_ORIGIN_TYPE }

/**
 * Holds the data returned to the client when the **Enumeration** APIs are called.
 * @see https://learn.microsoft.com/windows/win32/api/netfw/ns-netfw-fw_dynamic_keyword_address_data0
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
export default struct FW_DYNAMIC_KEYWORD_ADDRESS_DATA0 {
    #StructPack 8

    /**
     * Type: **[FW_DYNAMIC_KEYWORD_ADDRESS0](ns-netfw-fw_dynamic_keyword_address0.md)**
     * 
     * A dynamic keyword address (the dynamic keyword address object).
     */
    dynamicKeywordAddress : FW_DYNAMIC_KEYWORD_ADDRESS0

    /**
     * Type: **[FW_DYNAMIC_KEYWORD_ADDRESS0](ns-netfw-fw_dynamic_keyword_address0.md)\***
     * 
     * A pointer to the next dynamic keyword address object in a linked list.
     */
    next : FW_DYNAMIC_KEYWORD_ADDRESS_DATA0.Ptr

    /**
     * Type: **[WORD](/windows/win32/api/guiddef/ns-guiddef-guid)**
     * 
     * The schema version of the object. This is used by the [**FWFreeDynamicKeywordAddressData0**](/windows/win32/api/netfw/nc-netfw-pfn_fwfreedynamickeywordaddressdata0) API.
     */
    schemaVersion : UInt16

    /**
     * Type: **[FW_DYNAMIC_KEYWORD_ORIGIN_TYPE](ne-netfw-fw_dynamic_keyword_origin_type.md)**
     * 
     * Indicates the origin of this object. It can be either **FW_DYNAMIC_KEYWORD_ORIGIN_LOCAL**, which represents a locally created object, or **FW_DYNAMIC_KEYWORD_ORIGIN_MDM**, which represents an MDM managed object.
     */
    originType : FW_DYNAMIC_KEYWORD_ORIGIN_TYPE

}
