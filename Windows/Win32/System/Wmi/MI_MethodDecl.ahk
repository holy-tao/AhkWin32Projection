#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MI_ParameterDecl.ahk" { MI_ParameterDecl }
#Import ".\MI_SchemaDecl.ahk" { MI_SchemaDecl }
#Import ".\MI_Qualifier.ahk" { MI_Qualifier }

/**
 * Represents a CIM method.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_methoddecl
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_MethodDecl {
    #StructPack 8

    /**
     * Flags:
     * 
     * <a id="MI_FLAG_METHOD"></a>
     * <a id="mi_flag_method"></a>
     */
    flags : UInt32

    /**
     * Hash code: <c>(name[0] &lt;&lt; 16) | (name[len-1] &lt;&lt; 8) | len</c>
     */
    code : UInt32

    /**
     * The method name.
     */
    name : IntPtr

    /**
     * The qualifiers of the method.
     */
    qualifiers : IntPtr

    /**
     * The number of qualifiers.
     */
    numQualifiers : UInt32

    /**
     * The parameters of the method.
     */
    parameters : IntPtr

    /**
     * The number of parameters.
     */
    numParameters : UInt32

    /**
     * The size of the structure.
     */
    size : UInt32

    /**
     * The post result type of this method.
     */
    returnType : UInt32

    /**
     * The ancestor class that first defined a method with this name.
     */
    origin : IntPtr

    /**
     * The ancestor class that last defined a method with this name.
     */
    propagator : IntPtr

    /**
     * The schema this class belongs to.
     */
    schema : MI_SchemaDecl.Ptr

    /**
     * The extrinsic function that implements this method.
     */
    function : IntPtr

}
