#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\JOYPOS.ahk
#Include .\JOYRANGE.ahk
#Include .\JOYREGUSERVALUES.ahk

/**
 * The DIJOYUSERVALUES structure contains information about the user's joystick settings.
 * @see https://docs.microsoft.com/windows/win32/api//dinputd/ns-dinputd-dijoyuservalues
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @version v4.0.30319
 */
class DIJOYUSERVALUES extends Win32Struct
{
    static sizeof => 1136

    static packingSize => 8

    /**
     * Specifies the size of the structure in bytes. This member must be initialized before the structure is used.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Joystick user configuration. In addition to the fields contained in the mmddk.h header file, the previously unused <b>jrvRanges.jpCenter</b> field contains the user saturation levels for each axis. A control panel application sets the dead zone and saturation values based on the values set by the end-user during calibration or fine-tuning. Dead zone can be interpreted as "sensitivity in the center" and saturation can be interpreted as "sensitivity along the edges".
     * @type {JOYREGUSERVALUES}
     */
    ruv{
        get {
            if(!this.HasProp("__ruv"))
                this.__ruv := JOYREGUSERVALUES(this.ptr + 8)
            return this.__ruv
        }
    }

    /**
     * The global port driver.
     * @type {String}
     */
    wszGlobalDriver {
        get => StrGet(this.ptr + 112, 255, "UTF-16")
        set => StrPut(value, this.ptr + 112, 255, "UTF-16")
    }

    /**
     * Unused.
     * @type {String}
     */
    wszGameportEmulator {
        get => StrGet(this.ptr + 624, 255, "UTF-16")
        set => StrPut(value, this.ptr + 624, 255, "UTF-16")
    }
}
