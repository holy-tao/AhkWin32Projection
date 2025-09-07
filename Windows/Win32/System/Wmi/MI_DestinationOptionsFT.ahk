#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * A support structure used in the MI_DestinationOptions structure. Use the functions with the name prefix &quot;MI_DestinationOptions_&quot; to manipulate these structures.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_destinationoptionsft
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_DestinationOptionsFT extends Win32Struct
{
    static sizeof => 120

    static packingSize => 8

    /**
     * Deletes the destination options created by using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_application_newdestinationoptions">MI_Application_NewDestinationOptions</a>. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_destinationoptions_delete">MI_DestinationOptions_Delete</a>.
     * @type {Pointer}
     */
    Delete {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Sets a custom string option. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_destinationoptions_setstring">MI_DestinationOptions_SetString</a>.
     * @type {Pointer}
     */
    SetString {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Sets a custom numeric option value. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_destinationoptions_setnumber">MI_DestinationOptions_SetNumber</a>.
     * @type {Pointer}
     */
    SetNumber {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Used internally.
     * @type {Pointer}
     */
    AddCredentials {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Gets a previously added custom string option. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_destinationoptions_getstring">MI_DestinationOptions_GetString</a>.
     * @type {Pointer}
     */
    GetString {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Gets a previously added custom number option. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_destinationoptions_getnumber">MI_DestinationOptions_GetNumber</a>.
     * @type {Pointer}
     */
    GetNumber {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Gets the number of options previously added. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_destinationoptions_getoptioncount">MI_DestinationOptions_GetOptionCount</a>.
     * @type {Pointer}
     */
    GetOptionCount {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Gets a previously added option value based on the specified index. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_destinationoptions_getoptionat">MI_DestinationOptions_GetOptionAt</a>.
     * @type {Pointer}
     */
    GetOptionAt {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Gets a previously added option value based on the option name. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_destinationoptions_getoption">MI_DestinationOptions_GetOption</a>.
     * @type {Pointer}
     */
    GetOption {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Gets the number of previously added credentials. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_destinationoptions_getcredentialscount">MI_DestinationOptions_GetCredentialsCount</a>.
     * @type {Pointer}
     */
    GetCredentialsCount {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Get the credentials at the specified index. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_destinationoptions_getcredentialsat">MI_DestinationOptions_GetCredentialsAt</a>.
     * @type {Pointer}
     */
    GetCredentialsAt {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * Gets a credentials password based on a specified index. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_destinationoptions_getcredentialspasswordat">MI_DestinationOptions_GetCredentialsPasswordAt</a>.
     * @type {Pointer}
     */
    GetCredentialsPasswordAt {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * Creates a copy of a <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_destinationoptions">MI_DestinationOptions</a> structure. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_destinationoptions_clone">MI_DestinationOptions_Clone</a>.
     * @type {Pointer}
     */
    Clone {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * TBD
     * @type {Pointer}
     */
    SetInterval {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * TBD
     * @type {Pointer}
     */
    GetInterval {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }
}
