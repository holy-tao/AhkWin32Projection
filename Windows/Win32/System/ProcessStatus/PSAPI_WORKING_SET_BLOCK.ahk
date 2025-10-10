#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains working set information for a page.
 * @see https://docs.microsoft.com/windows/win32/api//psapi/ns-psapi-psapi_working_set_block
 * @namespace Windows.Win32.System.ProcessStatus
 * @version v4.0.30319
 */
class PSAPI_WORKING_SET_BLOCK extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The working set information. See the description of the structure  members for information about the layout of this variable.
     * @type {Pointer}
     */
    Flags {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer}
     */
    Anonymous {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
