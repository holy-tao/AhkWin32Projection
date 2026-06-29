#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Security\SID.ahk" { SID }
#Import ".\FWP_TOKEN_INFORMATION.ahk" { FWP_TOKEN_INFORMATION }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\FWP_BYTE_ARRAY6.ahk" { FWP_BYTE_ARRAY6 }
#Import ".\FWP_BYTE_BLOB.ahk" { FWP_BYTE_BLOB }
#Import ".\FWP_DATA_TYPE.ahk" { FWP_DATA_TYPE }
#Import ".\FWP_BYTE_ARRAY16.ahk" { FWP_BYTE_ARRAY16 }

/**
 * Defines a data value that can be one of a number of different data types.
 * @remarks
 * For the unnamed union, switch_type(FWP_DATA_TYPE), switch_is(type).
 * 
 * This is primarily used to supply incoming values to the
 * filter engine.
 * 
 * When IP addresses are stored in FWP_UINT32 format or when IP port is stored in FWP_UINT16 format, they are stored in host-order not network-order. 
 * 
 * <b>FWP_VALUE0</b> is a specific implementation of FWP_VALUE. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a> for more information.
 * @see https://learn.microsoft.com/windows/win32/api/fwptypes/ns-fwptypes-fwp_value0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWP_VALUE0 {
    #StructPack 8

    /**
     * The type of data for this value. 
     * 
     * See [FWP_DATA_TYPE](/windows/desktop/api/fwptypes/ne-fwptypes-fwp_data_type) for more information.
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
        this.DeleteProp("__New")
    }
}
