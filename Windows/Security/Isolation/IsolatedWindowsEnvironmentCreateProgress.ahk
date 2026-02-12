#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * **Deprecated.** Queries for progress of the creation of an Isolated Windows Environment
 * @remarks
 * > [!WARNING]
 * > This is a deprecated API.
 * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentcreateprogress
 * @namespace Windows.Security.Isolation
 * @version WindowsRuntime 1.4
 */
class IsolatedWindowsEnvironmentCreateProgress extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * [IsolatedWindowsEnvironmentProgressState](isolatedwindowsenvironmentprogressstate.md)
     * @type {Integer}
     */
    State {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * UINT32 for percent completion for Isolated Windows Environment creation
     * @type {Integer}
     */
    PercentComplete {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
