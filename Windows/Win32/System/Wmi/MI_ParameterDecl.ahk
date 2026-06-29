#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MI_Qualifier.ahk" { MI_Qualifier }

/**
 * Represents CIM method parameters.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_parameterdecl
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_ParameterDecl {
    #StructPack 8

    /**
     * flags
     */
    flags : UInt32

    /**
     * Hash code: (name[0] &lt;&lt; 16) | (name[len-1] &lt;&lt; 8) | len
     */
    code : UInt32

    /**
     * Name of this parameter.
     */
    name : IntPtr

    /**
     * Set of qualifiers for this parameter.
     */
    qualifiers : IntPtr

    /**
     * Number of parameter qualifiers.
     */
    numQualifiers : UInt32

    /**
     * Type of  parameter.
     */
    type : UInt32

    /**
     * Name of reference class or strongly typed embedded instance.
     */
    className : IntPtr

    /**
     * If the parameter is an array type of a fixed length, this value holds the subscript value.
     */
    subscript : UInt32

    /**
     * Offset from the start of the instance of where the value field of this parameter will exist.
     */
    offset : UInt32

}
