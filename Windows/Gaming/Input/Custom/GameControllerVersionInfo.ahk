#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information on the game controller version.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.custom.gamecontrollerversioninfo
 * @namespace Windows.Gaming.Input.Custom
 * @version WindowsRuntime 1.4
 */
class GameControllerVersionInfo extends Win32Struct
{
    static sizeof => 8

    static packingSize => 2

    /**
     * Major version number.
     * @type {Integer}
     */
    Major {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Minor version number.
     * @type {Integer}
     */
    Minor {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * Build number.
     * @type {Integer}
     */
    Build {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * Revison number.
     * @type {Integer}
     */
    Revision {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }
}
