#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\EVT_HANDLE.ahk" { EVT_HANDLE }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\..\Security\PSID.ahk" { PSID }
#Import "..\..\Foundation\SYSTEMTIME.ahk" { SYSTEMTIME }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Contains event data or property values.
 * @see https://learn.microsoft.com/windows/win32/api/winevt/ns-winevt-evt_variant
 * @namespace Windows.Win32.System.EventLog
 */
export default struct EVT_VARIANT {
    #StructPack 8

    BooleanVal : BOOL

    /**
     * The number of elements in the array of values. Use <b>Count</b> if the <b>Type</b> member has the <b>EVT_VARIANT_TYPE_ARRAY</b> flag set.
     */
    Count : UInt32

    /**
     * A flag that specifies the data type of the variant. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ne-winevt-evt_variant_type">EVT_VARIANT_TYPE</a> enumeration.
     * 
     * The variant contains an array of values, if the <b>EVT_VARIANT_TYPE_ARRAY</b> flag is set. The members that end in "Arr" contain arrays of values. For example, you would use the <b>StringArr</b> member to access the variant data if the type is EvtVarTypeString and the <b>EVT_VARIANT_TYPE_ARRAY</b> flag is set.
     * 
     * You can use the <a href="https://docs.microsoft.com/windows/desktop/WES/windows-event-log-constants">EVT_VARIANT_TYPE_MASK</a> constant to mask out the array bit to determine the variant's type.
     */
    Type : UInt32

    static __New() {
        DefineProp(this.Prototype, 'SByteVal', { type: Int8, offset: 0 })
        DefineProp(this.Prototype, 'Int16Val', { type: Int16, offset: 0 })
        DefineProp(this.Prototype, 'Int32Val', { type: Int32, offset: 0 })
        DefineProp(this.Prototype, 'Int64Val', { type: Int64, offset: 0 })
        DefineProp(this.Prototype, 'ByteVal', { type: Int8, offset: 0 })
        DefineProp(this.Prototype, 'UInt16Val', { type: UInt16, offset: 0 })
        DefineProp(this.Prototype, 'UInt32Val', { type: UInt32, offset: 0 })
        DefineProp(this.Prototype, 'UInt64Val', { type: Int64, offset: 0 })
        DefineProp(this.Prototype, 'SingleVal', { type: Float32, offset: 0 })
        DefineProp(this.Prototype, 'DoubleVal', { type: Float64, offset: 0 })
        DefineProp(this.Prototype, 'FileTimeVal', { type: Int64, offset: 0 })
        DefineProp(this.Prototype, 'SysTimeVal', { type: SYSTEMTIME.Ptr, offset: 0 })
        DefineProp(this.Prototype, 'GuidVal', { type: Guid.Ptr, offset: 0 })
        DefineProp(this.Prototype, 'StringVal', { type: PWSTR, offset: 0 })
        DefineProp(this.Prototype, 'AnsiStringVal', { type: PSTR, offset: 0 })
        DefineProp(this.Prototype, 'BinaryVal', { type: IntPtr, offset: 0 })
        DefineProp(this.Prototype, 'SidVal', { type: PSID, offset: 0 })
        DefineProp(this.Prototype, 'SizeTVal', { type: IntPtr, offset: 0 })
        DefineProp(this.Prototype, 'BooleanArr', { type: BOOL.Ptr, offset: 0 })
        DefineProp(this.Prototype, 'SByteArr', { type: IntPtr, offset: 0 })
        DefineProp(this.Prototype, 'Int16Arr', { type: IntPtr, offset: 0 })
        DefineProp(this.Prototype, 'Int32Arr', { type: IntPtr, offset: 0 })
        DefineProp(this.Prototype, 'Int64Arr', { type: IntPtr, offset: 0 })
        DefineProp(this.Prototype, 'ByteArr', { type: IntPtr, offset: 0 })
        DefineProp(this.Prototype, 'UInt16Arr', { type: IntPtr, offset: 0 })
        DefineProp(this.Prototype, 'UInt32Arr', { type: IntPtr, offset: 0 })
        DefineProp(this.Prototype, 'UInt64Arr', { type: IntPtr, offset: 0 })
        DefineProp(this.Prototype, 'SingleArr', { type: IntPtr, offset: 0 })
        DefineProp(this.Prototype, 'DoubleArr', { type: IntPtr, offset: 0 })
        DefineProp(this.Prototype, 'FileTimeArr', { type: FILETIME.Ptr, offset: 0 })
        DefineProp(this.Prototype, 'SysTimeArr', { type: SYSTEMTIME.Ptr, offset: 0 })
        DefineProp(this.Prototype, 'GuidArr', { type: Guid.Ptr, offset: 0 })
        DefineProp(this.Prototype, 'StringArr', { type: PWSTR.Ptr, offset: 0 })
        DefineProp(this.Prototype, 'AnsiStringArr', { type: PSTR.Ptr, offset: 0 })
        DefineProp(this.Prototype, 'SidArr', { type: PSID.Ptr, offset: 0 })
        DefineProp(this.Prototype, 'SizeTArr', { type: IntPtr, offset: 0 })
        DefineProp(this.Prototype, 'EvtHandleVal', { type: EVT_HANDLE, offset: 0 })
        DefineProp(this.Prototype, 'XmlVal', { type: PWSTR, offset: 0 })
        DefineProp(this.Prototype, 'XmlValArr', { type: PWSTR.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }
}
