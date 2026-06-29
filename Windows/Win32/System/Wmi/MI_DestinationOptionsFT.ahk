#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * A support structure used in the MI_DestinationOptions structure. Use the functions with the name prefix &quot;MI_DestinationOptions_&quot; to manipulate these structures.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_destinationoptionsft
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_DestinationOptionsFT {
    #StructPack 8

    /**
     * Deletes the destination options created by using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_application_newdestinationoptions">MI_Application_NewDestinationOptions</a>. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_destinationoptions_delete">MI_DestinationOptions_Delete</a>.
     */
    Delete : IntPtr

    /**
     * Sets a custom string option. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_destinationoptions_setstring">MI_DestinationOptions_SetString</a>.
     */
    SetString : IntPtr

    /**
     * Sets a custom numeric option value. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_destinationoptions_setnumber">MI_DestinationOptions_SetNumber</a>.
     */
    SetNumber : IntPtr

    /**
     * Used internally.
     */
    AddCredentials : IntPtr

    /**
     * Gets a previously added custom string option. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_destinationoptions_getstring">MI_DestinationOptions_GetString</a>.
     */
    GetString : IntPtr

    /**
     * Gets a previously added custom number option. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_destinationoptions_getnumber">MI_DestinationOptions_GetNumber</a>.
     */
    GetNumber : IntPtr

    /**
     * Gets the number of options previously added. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_destinationoptions_getoptioncount">MI_DestinationOptions_GetOptionCount</a>.
     */
    GetOptionCount : IntPtr

    /**
     * Gets a previously added option value based on the specified index. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_destinationoptions_getoptionat">MI_DestinationOptions_GetOptionAt</a>.
     */
    GetOptionAt : IntPtr

    /**
     * Gets a previously added option value based on the option name. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_destinationoptions_getoption">MI_DestinationOptions_GetOption</a>.
     */
    GetOption : IntPtr

    /**
     * Gets the number of previously added credentials. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_destinationoptions_getcredentialscount">MI_DestinationOptions_GetCredentialsCount</a>.
     */
    GetCredentialsCount : IntPtr

    /**
     * Get the credentials at the specified index. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_destinationoptions_getcredentialsat">MI_DestinationOptions_GetCredentialsAt</a>.
     */
    GetCredentialsAt : IntPtr

    /**
     * Gets a credentials password based on a specified index. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_destinationoptions_getcredentialspasswordat">MI_DestinationOptions_GetCredentialsPasswordAt</a>.
     */
    GetCredentialsPasswordAt : IntPtr

    /**
     * Creates a copy of a <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_destinationoptions">MI_DestinationOptions</a> structure. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_destinationoptions_clone">MI_DestinationOptions_Clone</a>.
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
