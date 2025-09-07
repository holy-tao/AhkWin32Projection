#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * A support structure used in the MI_OperationOptions structure. Use the functions with the name prefix &quot;MI_OperationOptions_&quot; to manipulate these structures.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_operationoptionsft
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_OperationOptionsFT extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

    /**
     * Deletes an option and its associated memory. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_operationoptions_delete">MI_OperationOptions_Delete</a>.
     * @type {Pointer}
     */
    Delete {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Sets a custom string option. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_operationoptions_setstring">MI_OperationOptions_SetString</a>.
     * @type {Pointer}
     */
    SetString {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Sets a custom number option value. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_operationoptions_setnumber">MI_OperationOptions_SetNumber</a>.
     * @type {Pointer}
     */
    SetNumber {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Sets a custom option for the operation. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_operationoptions_setcustomoption">MI_OperationOptions_SetCustomOption</a>.
     * @type {Pointer}
     */
    SetCustomOption {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Gets a custom string option. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_operationoptions_getstring">MI_OperationOptions_GetString</a>.
     * @type {Pointer}
     */
    GetString {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Gets a previously added custom number option. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_operationoptions_getnumber">MI_OperationOptions_GetNumber</a>.
     * @type {Pointer}
     */
    GetNumber {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Gets the number of options previously added. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_operationoptions_getoptioncount">MI_OperationOptions_GetOptionCount</a>.
     * @type {Pointer}
     */
    GetOptionCount {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Gets a previously added option value based on the specified index. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_operationoptions_getoptionat">MI_OperationOptions_GetOptionAt</a>.
     * @type {Pointer}
     */
    GetOptionAt {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Gets a previously added option value based on the option name. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_operationoptions_getoption">MI_OperationOptions_GetOption</a>.
     * @type {Pointer}
     */
    GetOption {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_operationoptions_getenabledchannels">MI_OperationOptions_GetEnabledChannels</a>.
     * @type {Pointer}
     */
    GetEnabledChannels {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Creates a copy of a <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_operationoptions">MI_OperationOptions</a> structure. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_operationoptions_clone">MI_OperationOptions_Clone</a>.
     * @type {Pointer}
     */
    Clone {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * TBD
     * @type {Pointer}
     */
    SetInterval {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * TBD
     * @type {Pointer}
     */
    GetInterval {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }
}
