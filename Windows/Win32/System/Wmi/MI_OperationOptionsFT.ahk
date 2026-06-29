#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * A support structure used in the MI_OperationOptions structure. Use the functions with the name prefix &quot;MI_OperationOptions_&quot; to manipulate these structures.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_operationoptionsft
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_OperationOptionsFT {
    #StructPack 8

    /**
     * Deletes an option and its associated memory. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_operationoptions_delete">MI_OperationOptions_Delete</a>.
     */
    Delete : IntPtr

    /**
     * Sets a custom string option. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_operationoptions_setstring">MI_OperationOptions_SetString</a>.
     */
    SetString : IntPtr

    /**
     * Sets a custom number option value. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_operationoptions_setnumber">MI_OperationOptions_SetNumber</a>.
     */
    SetNumber : IntPtr

    /**
     * Sets a custom option for the operation. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_operationoptions_setcustomoption">MI_OperationOptions_SetCustomOption</a>.
     */
    SetCustomOption : IntPtr

    /**
     * Gets a custom string option. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_operationoptions_getstring">MI_OperationOptions_GetString</a>.
     */
    GetString : IntPtr

    /**
     * Gets a previously added custom number option. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_operationoptions_getnumber">MI_OperationOptions_GetNumber</a>.
     */
    GetNumber : IntPtr

    /**
     * Gets the number of options previously added. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_operationoptions_getoptioncount">MI_OperationOptions_GetOptionCount</a>.
     */
    GetOptionCount : IntPtr

    /**
     * Gets a previously added option value based on the specified index. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_operationoptions_getoptionat">MI_OperationOptions_GetOptionAt</a>.
     */
    GetOptionAt : IntPtr

    /**
     * Gets a previously added option value based on the option name. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_operationoptions_getoption">MI_OperationOptions_GetOption</a>.
     */
    GetOption : IntPtr

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_operationoptions_getenabledchannels">MI_OperationOptions_GetEnabledChannels</a>.
     */
    GetEnabledChannels : IntPtr

    /**
     * Creates a copy of a <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_operationoptions">MI_OperationOptions</a> structure. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_operationoptions_clone">MI_OperationOptions_Clone</a>.
     */
    Clone : IntPtr

    /**
     * TBD
     */
    SetInterval : IntPtr

    /**
     * TBD
     */
    GetInterval : IntPtr

}
