#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Represents the current state of the UI navigation controller.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.uinavigationreading
 * @namespace Windows.Gaming.Input
 * @version WindowsRuntime 1.4
 */
class UINavigationReading extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Time when the state was retrieved from the UI navigation controller.
     * @type {Integer}
     */
    Timestamp {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The state of the required UI navigation controller buttons.
     * @type {Integer}
     */
    RequiredButtons {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The state of the optional UI navigation controller buttons.
     * @type {Integer}
     */
    OptionalButtons {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
