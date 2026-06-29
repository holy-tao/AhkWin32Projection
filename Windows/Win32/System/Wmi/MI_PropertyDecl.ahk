#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MI_Qualifier.ahk" { MI_Qualifier }

/**
 * Represents a class property (element) in a class's declaration.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_propertydecl
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_PropertyDecl {
    #StructPack 8

    flags : UInt32

    /**
     * Hash code: (name[0] &lt;&lt; 16) | (name[len-1] &lt;&lt; 8) | len
     */
    code : UInt32

    /**
     * Name of this property.
     */
    name : IntPtr

    /**
     * Qualifier set for this property.
     */
    qualifiers : IntPtr

    /**
     * Number of qualifiers.
     */
    numQualifiers : UInt32

    /**
     * Type of  property.
     */
    type : UInt32

    /**
     * Name of reference class or embedded instance class name.
     */
    className : IntPtr

    /**
     * If property is a fixed length array, then this value will hold the length of the array.
     */
    subscript : UInt32

    /**
     * Offset of this property field from the start of the <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_instance">MI_Instance</a>.
     */
    offset : UInt32

    /**
     * Ancestor class that first defined a property with this name.
     */
    origin : IntPtr

    /**
     * Ancestor class that last defined a property with this name.
     */
    propagator : IntPtr

    /**
     * Default value of this property.
     */
    value : IntPtr

}
