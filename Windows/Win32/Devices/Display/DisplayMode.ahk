#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\POINTL.ahk
#Include ..\..\Graphics\Gdi\DEVMODEW.ahk

/**
 * The DisplayMode structure describes a display device.
 * @see https://learn.microsoft.com/windows/win32/api/cloneviewhelper/ns-cloneviewhelper-displaymode
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class DisplayMode extends Win32Struct
{
    static sizeof => 284

    static packingSize => 4

    /**
     * A single wide-character string that contains the name of the display device.
     * @type {String}
     */
    DeviceName {
        get => StrGet(this.ptr + 0, 31, "UTF-16")
        set => StrPut(value, this.ptr + 0, 31, "UTF-16")
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-devmodew">DEVMODEW</a> structure that contains characteristics of the display device.
     * @type {DEVMODEW}
     */
    devMode{
        get {
            if(!this.HasProp("__devMode"))
                this.__devMode := DEVMODEW(64, this)
            return this.__devMode
        }
    }
}
