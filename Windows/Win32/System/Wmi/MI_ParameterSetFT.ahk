#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * A support structure used in the MI_ParameterSet structure. Use the functions with the name prefix MI_ParameterSet_ to manipulate these structures.
 * @see https://docs.microsoft.com/windows/win32/api//mi/ns-mi-mi_parametersetft
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_ParameterSetFT extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Gets the method return type and qualifier set for a specified parameter set. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_parameterset_getmethodreturntype">MI_ParameterSet_GetMethodReturnType</a>.
     * @type {Pointer}
     */
    GetMethodReturnType {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Gets the number of parameters in a parameter set. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_parameterset_getparametercount">MI_ParameterSet_GetParameterCount</a>.
     * @type {Pointer}
     */
    GetParameterCount {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Gets a method's parameter information at the specified index. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_parameterset_getparameterat">MI_ParameterSet_GetParameterAt</a>.
     * @type {Pointer}
     */
    GetParameterAt {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Gets a method's parameter information based on a parameter name. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_parameterset_getparameter">MI_ParameterSet_GetParameter</a>.
     * @type {Pointer}
     */
    GetParameter {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
