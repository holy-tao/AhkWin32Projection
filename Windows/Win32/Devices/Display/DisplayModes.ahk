#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\POINTL.ahk
#Include ..\..\Graphics\Gdi\DEVMODEW.ahk
#Include .\DisplayMode.ahk

/**
 * The DisplayModes structure contains a list of display modes.
 * @see https://learn.microsoft.com/windows/win32/api/cloneviewhelper/ns-cloneviewhelper-displaymodes
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class DisplayModes extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The number of display modes in the array that the <b>displayMode</b> member specifies.
     * @type {Integer}
     */
    numDisplayModes {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/cloneviewhelper/ns-cloneviewhelper-displaymode">DisplayMode</a> structures that describe characteristics of display devices.
     * @type {Array<DisplayMode>}
     */
    displayMode{
        get {
            if(!this.HasProp("__displayModeProxyArray"))
                this.__displayModeProxyArray := Win32FixedArray(this.ptr + 8, 1, DisplayMode, "")
            return this.__displayModeProxyArray
        }
    }
}
