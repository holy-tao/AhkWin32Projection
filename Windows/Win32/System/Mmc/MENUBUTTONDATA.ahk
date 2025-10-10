#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The MENUBUTTONDATA structure contains values used to create buttons on a toolbar.
 * @see https://docs.microsoft.com/windows/win32/api//mmc/ns-mmc-menubuttondata
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class MENUBUTTONDATA extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * A value that specifies a user-supplied value that uniquely identifies the menu button.
     * @type {Integer}
     */
    idCommand {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * A value that specifies the horizontal position, in pixels, at which the snap-in's context menu is displayed.
     * @type {Integer}
     */
    x {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * A value that specifies the vertical position, in pixels, at which the snap-in's context menu is displayed.
     * @type {Integer}
     */
    y {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
