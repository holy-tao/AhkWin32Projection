#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains properties that are common to the MI_PropertyDeclMI_ParameterDecland MI_MethodDecl structures.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_featuredecl
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_FeatureDecl extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Flags.
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Hash code: <c>(name[0] &lt;&lt; 16) | (name[len-1] &lt;&lt; 8) | len </c>
     * @type {Integer}
     */
    code {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Name of this feature.
     * @type {Pointer<UInt16>}
     */
    name {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Describes metadata for classes, properties, methods, and parameters.
     * @type {Pointer<MI_Qualifier>}
     */
    qualifiers {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Length of <b>qualifiers</b> array.
     * @type {Integer}
     */
    numQualifiers {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
