#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Security\SID.ahk" { SID }
#Import ".\FWP_TOKEN_INFORMATION.ahk" { FWP_TOKEN_INFORMATION }
#Import ".\FWP_V6_ADDR_AND_MASK.ahk" { FWP_V6_ADDR_AND_MASK }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\FWP_BYTE_ARRAY6.ahk" { FWP_BYTE_ARRAY6 }
#Import ".\FWP_BYTE_BLOB.ahk" { FWP_BYTE_BLOB }
#Import ".\FWP_DATA_TYPE.ahk" { FWP_DATA_TYPE }
#Import ".\FWP_BYTE_ARRAY16.ahk" { FWP_BYTE_ARRAY16 }
#Import ".\FWP_V4_ADDR_AND_MASK.ahk" { FWP_V4_ADDR_AND_MASK }
#Import ".\FWP_RANGE0.ahk" { FWP_RANGE0 }

/**
 * Contains values that are used in filter conditions when testing for matching filters.
 * @remarks
 * The data type of 
 * **FWP_CONDITION_VALUE0** must be compatible with the data type of the
 * [FWP_VALUE0](ns-fwptypes-fwp_value0.md) to which it is being compared. However, this does not mean the data types
 * necessarily need to be the same. For example, an FWP_V4_ADDR_MASK can be
 * compared to an FWP_UINT32 containing an IPv4 address. See [FWP_MATCH_TYPE](ne-fwptypes-fwp_match_type.md) for detailed information about **FWP_CONDITION_VALUE0** and **FWP_VALUE0** compatibility rules.
 * 
 * **FWP_CONDITION_VALUE0** is a specific implementation of FWP_CONDITION_VALUE. See [WFP Version-Independent Names and Targeting Specific Versions of Windows](/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows)  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/fwptypes/ns-fwptypes-fwp_condition_value0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWP_CONDITION_VALUE0 {
    #StructPack 8

    /**
     * Specifies the data type of the condition value.
     * 
     * See [FWP_DATA_TYPE](ne-fwptypes-fwp_data_type.md) for more information.
     */
    type : FWP_DATA_TYPE

    uint8 : Int8

    static __New() {
        DefineProp(this.Prototype, 'uint16', { type: UInt16, offset: 8 })
        DefineProp(this.Prototype, 'uint32', { type: UInt32, offset: 8 })
        DefineProp(this.Prototype, 'uint64', { type: IntPtr, offset: 8 })
        DefineProp(this.Prototype, 'int8', { type: Int8, offset: 8 })
        DefineProp(this.Prototype, 'int16', { type: Int16, offset: 8 })
        DefineProp(this.Prototype, 'int32', { type: Int32, offset: 8 })
        DefineProp(this.Prototype, 'int64', { type: IntPtr, offset: 8 })
        DefineProp(this.Prototype, 'float32', { type: Float32, offset: 8 })
        DefineProp(this.Prototype, 'double64', { type: IntPtr, offset: 8 })
        DefineProp(this.Prototype, 'byteArray16', { type: FWP_BYTE_ARRAY16.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'byteBlob', { type: FWP_BYTE_BLOB.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'sid', { type: SID.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'sd', { type: FWP_BYTE_BLOB.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'tokenInformation', { type: FWP_TOKEN_INFORMATION.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'tokenAccessInformation', { type: FWP_BYTE_BLOB.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'unicodeString', { type: PWSTR, offset: 8 })
        DefineProp(this.Prototype, 'byteArray6', { type: FWP_BYTE_ARRAY6.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'v4AddrMask', { type: FWP_V4_ADDR_AND_MASK.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'v6AddrMask', { type: FWP_V6_ADDR_AND_MASK.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'rangeValue', { type: FWP_RANGE0.Ptr, offset: 8 })
        this.DeleteProp("__New")
    }
}
