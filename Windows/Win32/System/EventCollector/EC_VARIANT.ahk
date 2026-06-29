#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Contains event collector data (subscription data) or property values.
 * @see https://learn.microsoft.com/windows/win32/api/evcoll/ns-evcoll-ec_variant
 * @namespace Windows.Win32.System.EventCollector
 */
export default struct EC_VARIANT {
    #StructPack 8

    BooleanVal : BOOL

    /**
     * The number of elements (not length) in bytes. Used for arrays and binary or string types.
     */
    Count : UInt32

    /**
     * The type of the data in the structure. Use a value from the <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ne-evcoll-ec_variant_type">EC_VARIANT_TYPE</a> enumeration to specify the type. When the type is specified, you can use any of the union members to access the  actual value. For example, if the type is <b>EcVarTypeDateTime</b>, then the value is <b>DateTimeVal</b> in the <b>EC_VARIANT</b> structure.
     */
    Type : UInt32

    static __New() {
        DefineProp(this.Prototype, 'UInt32Val', { type: UInt32, offset: 0 })
        DefineProp(this.Prototype, 'DateTimeVal', { type: Int64, offset: 0 })
        DefineProp(this.Prototype, 'StringVal', { type: PWSTR, offset: 0 })
        DefineProp(this.Prototype, 'BinaryVal', { type: IntPtr, offset: 0 })
        DefineProp(this.Prototype, 'BooleanArr', { type: BOOL.Ptr, offset: 0 })
        DefineProp(this.Prototype, 'Int32Arr', { type: IntPtr, offset: 0 })
        DefineProp(this.Prototype, 'StringArr', { type: PWSTR.Ptr, offset: 0 })
        DefineProp(this.Prototype, 'PropertyHandleVal', { type: IntPtr, offset: 0 })
        this.DeleteProp("__New")
    }
}
