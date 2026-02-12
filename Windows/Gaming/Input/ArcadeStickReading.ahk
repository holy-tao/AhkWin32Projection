#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * The current state of the arcade stick.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.arcadestickreading
 * @namespace Windows.Gaming.Input
 * @version WindowsRuntime 1.4
 */
class ArcadeStickReading extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Time when the state was retrieved from the arcade stick.
     * @type {Integer}
     */
    Timestamp {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The state of the arcade stick's buttons.
     * @type {Integer}
     */
    Buttons {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
