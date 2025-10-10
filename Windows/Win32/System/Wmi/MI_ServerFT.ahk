#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * A support structure used in the MI_Server structure. Use the functions with the name prefix &quot;MI_Server_&quot; to manipulate these structures.
 * @see https://docs.microsoft.com/windows/win32/api//mi/ns-mi-mi_serverft
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_ServerFT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Gets the value of the <b>MI_VERSION</b> macro used when compiling the server.
     * @type {Pointer}
     */
    GetVersion {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Gets the system name for the server.
     * @type {Pointer}
     */
    GetSystemName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
