#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\JOYREGHWSETTINGS.ahk
#Include .\JOYPOS.ahk
#Include .\JOYRANGE.ahk
#Include .\JOYREGHWVALUES.ahk
#Include .\JOYREGHWCONFIG.ahk

/**
 * The DIJOYCONFIG structure contains information about a joystick's configuration.
 * @remarks
 * 
  * WDM gameports can be found during enumeration by calling <a href="https://docs.microsoft.com/windows/desktop/api/dinputd/nf-dinputd-idirectinputjoyconfig8-gettypeinfo">IDirectInputJoyConfig8::GetTypeInfo</a> method for an enumerated joystick, then studying the flags present in the <b>dwFlags</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dinputd/ns-dinputd-dijoytypeinfo">DIJOYTYPEINFO</a> structure. If the JOY_HWS_ISGAMEPORTBUS flag is set, the currently enumerated object is an available WDM gameport.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dinputd/ns-dinputd-dijoyconfig
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @version v4.0.30319
 */
class DIJOYCONFIG extends Win32Struct
{
    static sizeof => 1176

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
     * Specifies the instance GUID for the joystick.
     * @type {Pointer<Guid>}
     */
    guidInstance {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Joystick hardware configuration.
     * @type {JOYREGHWCONFIG}
     */
    hwc{
        get {
            if(!this.HasProp("__hwc"))
                this.__hwc := JOYREGHWCONFIG(16, this)
            return this.__hwc
        }
    }

    /**
     * Specifies the global gain setting. This value is applied to all force feedback effects as a "master volume control".
     * @type {Integer}
     */
    dwGain {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }

    /**
     * The joystick type for the joystick. It must be one of the values enumerated by <a href="https://docs.microsoft.com/windows/desktop/api/dinputd/nf-dinputd-idirectinputjoyconfig8-enumtypes">IDirectInputJoyConfig8::EnumTypes</a>.
     * @type {String}
     */
    wszType {
        get => StrGet(this.ptr + 140, 255, "UTF-16")
        set => StrPut(value, this.ptr + 140, 255, "UTF-16")
    }

    /**
     * The callout driver for the joystick.
     * @type {String}
     */
    wszCallout {
        get => StrGet(this.ptr + 652, 255, "UTF-16")
        set => StrPut(value, this.ptr + 652, 255, "UTF-16")
    }

    /**
     * Specifies a GUID that identifies the gameport being used for this joystick.
     * @type {Pointer<Guid>}
     */
    guidGameport {
        get => NumGet(this, 1168, "ptr")
        set => NumPut("ptr", value, this, 1168)
    }
}
