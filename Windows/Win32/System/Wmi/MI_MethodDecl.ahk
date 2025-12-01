#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a CIM method.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_methoddecl
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_MethodDecl extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * Flags:
     * 
     * <a id="MI_FLAG_METHOD"></a>
     * <a id="mi_flag_method"></a>
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Hash code: <c>(name[0] &lt;&lt; 16) | (name[len-1] &lt;&lt; 8) | len</c>
     * @type {Integer}
     */
    code {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The method name.
     * @type {Pointer<Integer>}
     */
    name {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The qualifiers of the method.
     * @type {Pointer<Pointer<MI_Qualifier>>}
     */
    qualifiers {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The number of qualifiers.
     * @type {Integer}
     */
    numQualifiers {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The parameters of the method.
     * @type {Pointer<Pointer<MI_ParameterDecl>>}
     */
    parameters {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * The number of parameters.
     * @type {Integer}
     */
    numParameters {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * The size of the structure.
     * @type {Integer}
     */
    size {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * The post result type of this method.
     * @type {Integer}
     */
    returnType {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * The ancestor class that first defined a method with this name.
     * @type {Pointer<Integer>}
     */
    origin {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * The ancestor class that last defined a method with this name.
     * @type {Pointer<Integer>}
     */
    propagator {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * The schema this class belongs to.
     * @type {Pointer<MI_SchemaDecl>}
     */
    schema {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * The extrinsic function that implements this method.
     * @type {Pointer<MI_MethodDecl_Invoke>}
     */
    function {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }
}
