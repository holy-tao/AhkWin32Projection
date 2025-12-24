#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\JOYREGHWSETTINGS.ahk

/**
 * The DIJOYTYPEINFO structure contains information about a joystick type.
 * @remarks
 * A "joystick type" describes how DirectInput should communicate with the device and how it should report device data. For example, "A Frobozz Industries SuperStick 5X is a three-axis, five-button joystick with the third axis reported as the first bit on the second port." 
 * 
 * DirectInput comes with the following predefined joystick types, all with axes in their default locations:
 * 
 * <ul>
 * <li>
 * Two-axis, two-button joystick. 
 * 
 * </li>
 * <li>
 * Two-button game pad. 
 * 
 * </li>
 * <li>
 * Two-button flight yoke. 
 * 
 * </li>
 * <li>
 * Two-button flight yoke with throttle. 
 * 
 * </li>
 * <li>
 * Three-axis, two-button joystick. 
 * 
 * </li>
 * <li>
 * Three-axis, four-button joystick. 
 * 
 * </li>
 * <li>
 * Four-button game pad. 
 * 
 * </li>
 * <li>
 * Four-button flight yoke. 
 * 
 * </li>
 * <li>
 * Four-button flight yoke with throttle. 
 * 
 * </li>
 * </ul>
 * If the joystick type has the JOY_HWS_ISGAMEPORTDRIVER flag set in the <b>dwFlags</b> member of the JOYHWSETTINGS structure, then the <b>wszCallout</b> member of the DIJOYTYPEINFO structure contains the name of a driver that can be used as a global driver. The joystick type should be shown on the list of global drivers and not shown on the list of joystick types that can be assigned. 
 * 
 * <b>New in DirectX 8.0</b>
 * 
 * The <b>dwFlags2</b> member was added to the DIJOYCONFIG structure. This member carries information that controls how DirectInput enumerates the device to applications. The <b>dwFlags2</b> member carries device type and subtype override flags in the low word, and device enumeration "hiding" flags in the high word. The device type and subtype override flags control how DirectInput portrays your device to applications that use DirectInput. These are the same flags that applications receive from DirectInput during device enumeration. For example, if your device is described in its firmware as a telephony device, it would not normally be enumerated to games because telephony devices aren't considered relevant to games. However, if you used DI8DEVTYPE_DEVICECTRL and DI8DEVTYPEDEVICECONTROL_COMMSSELECTION to describe this device, DirectInput overrides the data it retrieves from the firmware and enumerates the device to games.
 * 
 * The high word of <b>dwFlags2</b> can be set to contain flags that scope how DirectInput enumerates the device to DirectInput applications. For example, some devices declare multiple top-level HID collections. Such a device might declare that it can act as a keyboard, a mouse, and a joystick all in one. Generally, one or more of these top-level collections is merely a phantom device, which shouldn't be enumerated to games. For this device, the high word of <b>dwFlags2</b> could be set to a combination of the JOYTYPE_HIDEACTIVE, JOYTYPE_MOUSEHIDE, and JOYTYPE_KEYBHIDE flags. The JOYTYPE_HIDEACTIVE flag indicates that DirectInput should not enumerate the device by all its types. The JOYTYPE_MOUSEHIDE and JOYTYPE_KEYBHIDE flags also present in the high word indicate to DirectInput that enumeration of the phantom mouse and keyboard on the device should be suppressed. Note that applications can include the DIEDFL_INCLUDEHIDDEN (described in the Microsoft Windows SDK documentation) flag to enumerate devices, even if they are hidden.
 * @see https://learn.microsoft.com/windows/win32/api/dinputd/ns-dinputd-dijoytypeinfo
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @version v4.0.30319
 */
class DIJOYTYPEINFO extends Win32Struct
{
    static sizeof => 2088

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
     * Joystick hardware settings.
     * @type {JOYREGHWSETTINGS}
     */
    hws{
        get {
            if(!this.HasProp("__hws"))
                this.__hws := JOYREGHWSETTINGS(4, this)
            return this.__hws
        }
    }

    /**
     * Specifies a CLSID for the joystick type configuration object. Pass this CLSID to CoCreateInstance to create a configuration object. This field is zero if the type does not have custom configuration.
     * @type {Pointer<Guid>}
     */
    clsidConfig {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The display name for the joystick type. The display name is the name that should be used to display the name of the joystick type to the end user.
     * @type {String}
     */
    wszDisplayName {
        get => StrGet(this.ptr + 24, 255, "UTF-16")
        set => StrPut(value, this.ptr + 24, 255, "UTF-16")
    }

    /**
     * The device responsible for handling polling for devices of this type. This is a null string if the global polling callout is to be used.
     * @type {String}
     */
    wszCallout {
        get => StrGet(this.ptr + 536, 259, "UTF-16")
        set => StrPut(value, this.ptr + 536, 259, "UTF-16")
    }

    /**
     * The hardware ID for the joystick type. The hardware ID is used by Plug and Play on Windows 2000 and Windows 98 (DirectX 7.0 only) to find the drivers for the joystick.
     * @type {String}
     */
    wszHardwareId {
        get => StrGet(this.ptr + 1056, 255, "UTF-16")
        set => StrPut(value, this.ptr + 1056, 255, "UTF-16")
    }

    /**
     * Joystick type flags. This member can be set to a combination of the following flags.
     * @type {Integer}
     */
    dwFlags1 {
        get => NumGet(this, 1568, "uint")
        set => NumPut("uint", value, this, 1568)
    }

    /**
     * Combination of device filtering and device type/subtype override flags. Device-filtering flags should be placed in the high WORD of <b>dwFlags2</b>. Device type and subtype should be placed in the low and high WORDs of the member, respectively.
     * @type {Integer}
     */
    dwFlags2 {
        get => NumGet(this, 1572, "uint")
        set => NumPut("uint", value, this, 1572)
    }

    /**
     * 
     * @type {String}
     */
    wszMapFile {
        get => StrGet(this.ptr + 1576, 255, "UTF-16")
        set => StrPut(value, this.ptr + 1576, 255, "UTF-16")
    }
}
