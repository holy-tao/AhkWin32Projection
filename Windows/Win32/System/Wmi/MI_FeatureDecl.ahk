#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MI_Qualifier.ahk" { MI_Qualifier }

/**
 * Contains properties that are common to the MI_PropertyDeclMI_ParameterDecland MI_MethodDecl structures.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_featuredecl
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_FeatureDecl {
    #StructPack 8

    /**
     * Flags.
     */
    flags : UInt32

    /**
     * Hash code: <c>(name[0] &lt;&lt; 16) | (name[len-1] &lt;&lt; 8) | len </c>
     */
    code : UInt32

    /**
     * Name of this feature.
     */
    name : IntPtr

    /**
     * Describes metadata for classes, properties, methods, and parameters.
     */
    qualifiers : IntPtr

    /**
     * Length of <b>qualifiers</b> array.
     */
    numQualifiers : UInt32

}
