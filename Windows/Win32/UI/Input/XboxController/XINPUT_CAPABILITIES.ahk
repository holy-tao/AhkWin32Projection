#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\XINPUT_GAMEPAD.ahk
#Include .\XINPUT_VIBRATION.ahk

/**
 * Describes the capabilities of a connected controller. The XInputGetCapabilities function returns XINPUT_CAPABILITIES.
 * @remarks
 * <a href="https://docs.microsoft.com/windows/desktop/api/xinput/nf-xinput-xinputgetcapabilities">XInputGetCapabilities</a> returns <b>XINPUT_CAPABILITIES</b> to indicate the characteristics and available functionality of a specified controller.
  * 
  * 
  * 
  * 
  * <a href="https://docs.microsoft.com/windows/desktop/api/xinput/nf-xinput-xinputgetcapabilities">XInputGetCapabilities</a> sets the structure members to indicate which inputs the device supports. For binary state controls, such as digital buttons, the corresponding bit reflects whether or not the control is supported by the device. For proportional controls, such as thumbsticks, the value indicates the resolution for that control. Some number of the least significant bits may not be set, indicating that the control does not provide resolution to that level.
  * 
  * 
  * 
  * The <i>SubType</i> member indicates the specific subtype of controller present. Games may detect the controller subtype and tune their handling of controller input or output based on subtypes that are well suited to their game genre. For example, a car racing game might check for the presence of a wheel controller to provide finer control of the car being driven. However, titles must not disable or ignore a device based on its subtype. Subtypes not recognized by the game or for which the game is not specifically tuned should be treated as a standard Xbox 360 Controller (XINPUT_DEVSUBTYPE_GAMEPAD).
  * 
  * 
  * 
  * Older XUSB Windows drivers report incomplete capabilities information, particularly for wireless devices. The latest XUSB Windows driver provides full support for wired and wireless devices, and more complete and accurate capabilities flags.
 * @see https://learn.microsoft.com/windows/win32/api/xinput/ns-xinput-xinput_capabilities
 * @namespace Windows.Win32.UI.Input.XboxController
 * @version v4.0.30319
 */
class XINPUT_CAPABILITIES extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * 
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * Subtype of the game controller. See <a href="https://docs.microsoft.com/windows/desktop/xinput/xinput-and-controller-subtypes">XINPUT and Controller Subtypes</a> for a list of allowed subtypes.
     * 
     * <div class="alert"><b>Note</b>  For restrictions on the use of this subtype value, see Remarks. More subtypes may be added in the future.</div>
     * <div> </div>
     * @type {Integer}
     */
    SubType {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * Features of the controller.
     *        
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>XINPUT_CAPS_VOICE_SUPPORTED</td>
     * <td>Device has an integrated voice device.</td>
     * </tr>
     * <tr>
     * <td>XINPUT_CAPS_FFB_SUPPORTED</td>
     * <td>Device supports force feedback functionality. Note that these force-feedback features beyond rumble are not currently supported through XINPUT on Windows.</td>
     * </tr>
     * <tr>
     * <td>XINPUT_CAPS_WIRELESS</td>
     * <td>Device is wireless.</td>
     * </tr>
     * <tr>
     * <td>XINPUT_CAPS_PMD_SUPPORTED</td>
     * <td>Device supports plug-in modules. Note that plug-in modules like the text input device (TID)
     *            are not supported currently through XINPUT on Windows.</td>
     * </tr>
     * <tr>
     * <td>XINPUT_CAPS_NO_NAVIGATION</td>
     * <td>Device lacks menu navigation buttons (START, BACK, DPAD).</td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/xinput/ns-xinput-xinput_gamepad">XINPUT_GAMEPAD</a> structure that describes available controller features and control resolutions.
     * @type {XINPUT_GAMEPAD}
     */
    Gamepad{
        get {
            if(!this.HasProp("__Gamepad"))
                this.__Gamepad := XINPUT_GAMEPAD(this.ptr + 8)
            return this.__Gamepad
        }
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/xinput/ns-xinput-xinput_vibration">XINPUT_VIBRATION</a> structure that describes available vibration functionality and resolutions.
     * @type {XINPUT_VIBRATION}
     */
    Vibration{
        get {
            if(!this.HasProp("__Vibration"))
                this.__Vibration := XINPUT_VIBRATION(this.ptr + 20)
            return this.__Vibration
        }
    }
}
