#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * The MMCBUTTON structure contains values used in creating buttons on a toolbar. This structure is similar to the TBBUTTON structure discussed in the Platform Software Development Kit (SDK) topics related to common controls.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/ns-mmc-mmcbutton
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class MMCBUTTON extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * A value that specifies the zero-based index of a button image.
     * @type {Integer}
     */
    nBitmap {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * A value that specifies the command identifier returned when a button is clicked. This can be any integer value the user wants. Only the low word of the <b>int</b> is used.
     * @type {Integer}
     */
    idCommand {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * 
     * @type {Integer}
     */
    fsState {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * 
     * @type {Integer}
     */
    fsType {
        get => NumGet(this, 9, "char")
        set => NumPut("char", value, this, 9)
    }

    /**
     * A pointer to the text associated with a particular instance of the 
     * <b>MMCBUTTON</b> structure.
     * @type {PWSTR}
     */
    lpButtonText{
        get {
            if(!this.HasProp("__lpButtonText"))
                this.__lpButtonText := PWSTR(this.ptr + 16)
            return this.__lpButtonText
        }
    }

    /**
     * A pointer to the text for a particular tooltip.
     * @type {PWSTR}
     */
    lpTooltipText{
        get {
            if(!this.HasProp("__lpTooltipText"))
                this.__lpTooltipText := PWSTR(this.ptr + 24)
            return this.__lpTooltipText
        }
    }
}
