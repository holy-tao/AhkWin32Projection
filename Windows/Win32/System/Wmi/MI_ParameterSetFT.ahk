#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * A support structure used in the MI_ParameterSet structure. Use the functions with the name prefix MI_ParameterSet_ to manipulate these structures.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_parametersetft
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_ParameterSetFT {
    #StructPack 8

    /**
     * Gets the method return type and qualifier set for a specified parameter set. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_parameterset_getmethodreturntype">MI_ParameterSet_GetMethodReturnType</a>.
     */
    GetMethodReturnType : IntPtr

    /**
     * Gets the number of parameters in a parameter set. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_parameterset_getparametercount">MI_ParameterSet_GetParameterCount</a>.
     */
    GetParameterCount : IntPtr

    /**
     * Gets a method's parameter information at the specified index. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_parameterset_getparameterat">MI_ParameterSet_GetParameterAt</a>.
     */
    GetParameterAt : IntPtr

    /**
     * Gets a method's parameter information based on a parameter name. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_parameterset_getparameter">MI_ParameterSet_GetParameter</a>.
     */
    GetParameter : IntPtr

}
