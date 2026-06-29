#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MI_Sint32A.ahk" { MI_Sint32A }
#Import ".\MI_Array.ahk" { MI_Array }
#Import ".\MI_InstanceA.ahk" { MI_InstanceA }
#Import ".\MI_Sint8A.ahk" { MI_Sint8A }
#Import ".\MI_DatetimeA.ahk" { MI_DatetimeA }
#Import ".\MI_Timestamp.ahk" { MI_Timestamp }
#Import ".\MI_Sint16A.ahk" { MI_Sint16A }
#Import ".\MI_BooleanA.ahk" { MI_BooleanA }
#Import ".\MI_Instance.ahk" { MI_Instance }
#Import ".\MI_Uint16A.ahk" { MI_Uint16A }
#Import ".\MI_Interval.ahk" { MI_Interval }
#Import ".\MI_Char16A.ahk" { MI_Char16A }
#Import ".\MI_Uint32A.ahk" { MI_Uint32A }
#Import ".\MI_Sint64A.ahk" { MI_Sint64A }
#Import ".\MI_Datetime.ahk" { MI_Datetime }
#Import ".\MI_Uint64A.ahk" { MI_Uint64A }
#Import ".\MI_Real64A.ahk" { MI_Real64A }
#Import ".\MI_StringA.ahk" { MI_StringA }
#Import ".\MI_ReferenceA.ahk" { MI_ReferenceA }
#Import ".\MI_Uint8A.ahk" { MI_Uint8A }
#Import ".\MI_Real32A.ahk" { MI_Real32A }

/**
 * A union of all CIM data types.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_value
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_Value {
    #StructPack 8

    boolean : Int8

    static __New() {
        DefineProp(this.Prototype, 'uint8', { type: Int8, offset: 0 })
        DefineProp(this.Prototype, 'sint8', { type: Int8, offset: 0 })
        DefineProp(this.Prototype, 'uint16', { type: UInt16, offset: 0 })
        DefineProp(this.Prototype, 'sint16', { type: Int16, offset: 0 })
        DefineProp(this.Prototype, 'uint32', { type: UInt32, offset: 0 })
        DefineProp(this.Prototype, 'sint32', { type: Int32, offset: 0 })
        DefineProp(this.Prototype, 'uint64', { type: Int64, offset: 0 })
        DefineProp(this.Prototype, 'sint64', { type: Int64, offset: 0 })
        DefineProp(this.Prototype, 'real32', { type: Float32, offset: 0 })
        DefineProp(this.Prototype, 'real64', { type: Float64, offset: 0 })
        DefineProp(this.Prototype, 'char16', { type: UInt16, offset: 0 })
        DefineProp(this.Prototype, 'datetime', { type: MI_Datetime, offset: 0 })
        DefineProp(this.Prototype, 'string', { type: IntPtr, offset: 0 })
        DefineProp(this.Prototype, 'instance', { type: MI_Instance.Ptr, offset: 0 })
        DefineProp(this.Prototype, 'reference', { type: MI_Instance.Ptr, offset: 0 })
        DefineProp(this.Prototype, 'booleana', { type: MI_BooleanA, offset: 0 })
        DefineProp(this.Prototype, 'uint8a', { type: MI_Uint8A, offset: 0 })
        DefineProp(this.Prototype, 'sint8a', { type: MI_Sint8A, offset: 0 })
        DefineProp(this.Prototype, 'uint16a', { type: MI_Uint16A, offset: 0 })
        DefineProp(this.Prototype, 'sint16a', { type: MI_Sint16A, offset: 0 })
        DefineProp(this.Prototype, 'uint32a', { type: MI_Uint32A, offset: 0 })
        DefineProp(this.Prototype, 'sint32a', { type: MI_Sint32A, offset: 0 })
        DefineProp(this.Prototype, 'uint64a', { type: MI_Uint64A, offset: 0 })
        DefineProp(this.Prototype, 'sint64a', { type: MI_Sint64A, offset: 0 })
        DefineProp(this.Prototype, 'real32a', { type: MI_Real32A, offset: 0 })
        DefineProp(this.Prototype, 'real64a', { type: MI_Real64A, offset: 0 })
        DefineProp(this.Prototype, 'char16a', { type: MI_Char16A, offset: 0 })
        DefineProp(this.Prototype, 'datetimea', { type: MI_DatetimeA, offset: 0 })
        DefineProp(this.Prototype, 'stringa', { type: MI_StringA, offset: 0 })
        DefineProp(this.Prototype, 'referencea', { type: MI_ReferenceA, offset: 0 })
        DefineProp(this.Prototype, 'instancea', { type: MI_InstanceA, offset: 0 })
        DefineProp(this.Prototype, 'array', { type: MI_Array, offset: 0 })
        this.DeleteProp("__New")
    }
}
