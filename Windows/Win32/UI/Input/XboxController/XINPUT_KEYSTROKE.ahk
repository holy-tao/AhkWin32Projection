#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Specifies keystroke data returned by XInputGetKeystroke.
 * @remarks
 * Future devices may return HID codes and virtual key values that are not supported on current devices, and are currently undefined. Applications should ignore these unexpected values.
 * 
 * 
 * 
 * A <i>virtual-key</i> code is a byte value that represents a particular physical key on the keyboard, not the character or characters (possibly none) that the key can be mapped to based on keyboard state. The keyboard state at the time a virtual key is pressed modifies the character reported. For example, VK_4 might represent a "4" or a "$", depending on the state of the SHIFT key.
 * 
 * 
 * 
 * A reported keyboard event includes the virtual key that caused the event, whether the key was pressed or released (or is repeating), and the state of the keyboard at the time of the event. The keyboard state includes information about whether any CTRL, ALT, or SHIFT keys are down.
 * 
 * 
 * 
 * If the keyboard event represents an Unicode character (for example, pressing the "A" key), the <i>Unicode</i> member will contain that character. Otherwise, <i>Unicode</i> will contain the value zero.
 * 
 * 
 * 
 * The valid virtual-key (VK_xxx) codes are defined in XInput.h. In addition to codes that indicate key presses, the following codes indicate controller input.
 * 
 * 
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td>VK_PAD_A</td>
 * <td><b>A</b>  button </td>
 * </tr>
 * <tr>
 * <td>VK_PAD_B</td>
 * <td><b>B</b> button </td>
 * </tr>
 * <tr>
 * <td>VK_PAD_X</td>
 * <td><b>X</b> button </td>
 * </tr>
 * <tr>
 * <td>VK_PAD_Y</td>
 * <td><b>Y</b> button </td>
 * </tr>
 * <tr>
 * <td>VK_PAD_RSHOULDER</td>
 * <td>Right shoulder button </td>
 * </tr>
 * <tr>
 * <td>VK_PAD_LSHOULDER</td>
 * <td>Left shoulder button </td>
 * </tr>
 * <tr>
 * <td>VK_PAD_LTRIGGER</td>
 * <td>Left trigger </td>
 * </tr>
 * <tr>
 * <td>VK_PAD_RTRIGGER</td>
 * <td>Right trigger </td>
 * </tr>
 * <tr>
 * <td>VK_PAD_DPAD_UP</td>
 * <td>Directional pad up </td>
 * </tr>
 * <tr>
 * <td>VK_PAD_DPAD_DOWN</td>
 * <td>Directional pad down </td>
 * </tr>
 * <tr>
 * <td>VK_PAD_DPAD_LEFT</td>
 * <td>Directional pad left </td>
 * </tr>
 * <tr>
 * <td>VK_PAD_DPAD_RIGHT</td>
 * <td>Directional pad right </td>
 * </tr>
 * <tr>
 * <td>VK_PAD_START</td>
 * <td><b>START</b> button </td>
 * </tr>
 * <tr>
 * <td>VK_PAD_BACK</td>
 * <td><b>BACK</b> button </td>
 * </tr>
 * <tr>
 * <td>VK_PAD_LTHUMB_PRESS</td>
 * <td>Left thumbstick click </td>
 * </tr>
 * <tr>
 * <td>VK_PAD_RTHUMB_PRESS</td>
 * <td>Right thumbstick click </td>
 * </tr>
 * <tr>
 * <td>VK_PAD_LTHUMB_UP</td>
 * <td>Left thumbstick up </td>
 * </tr>
 * <tr>
 * <td>VK_PAD_LTHUMB_DOWN</td>
 * <td>Left thumbstick down </td>
 * </tr>
 * <tr>
 * <td>VK_PAD_LTHUMB_RIGHT</td>
 * <td>Left thumbstick right </td>
 * </tr>
 * <tr>
 * <td>VK_PAD_LTHUMB_LEFT</td>
 * <td>Left thumbstick left </td>
 * </tr>
 * <tr>
 * <td>VK_PAD_LTHUMB_UPLEFT</td>
 * <td>Left thumbstick up and left </td>
 * </tr>
 * <tr>
 * <td>VK_PAD_LTHUMB_UPRIGHT</td>
 * <td>Left thumbstick up and right </td>
 * </tr>
 * <tr>
 * <td>VK_PAD_LTHUMB_DOWNRIGHT</td>
 * <td>Left thumbstick down and right </td>
 * </tr>
 * <tr>
 * <td>VK_PAD_LTHUMB_DOWNLEFT</td>
 * <td>Left thumbstick down and left </td>
 * </tr>
 * <tr>
 * <td>VK_PAD_RTHUMB_UP</td>
 * <td>Right thumbstick up </td>
 * </tr>
 * <tr>
 * <td>VK_PAD_RTHUMB_DOWN</td>
 * <td>Right thumbstick down </td>
 * </tr>
 * <tr>
 * <td>VK_PAD_RTHUMB_RIGHT</td>
 * <td>Right thumbstick right </td>
 * </tr>
 * <tr>
 * <td>VK_PAD_RTHUMB_LEFT</td>
 * <td>Right thumbstick left </td>
 * </tr>
 * <tr>
 * <td>VK_PAD_RTHUMB_UPLEFT</td>
 * <td>Right thumbstick up and left </td>
 * </tr>
 * <tr>
 * <td>VK_PAD_RTHUMB_UPRIGHT</td>
 * <td>Right thumbstick up and right </td>
 * </tr>
 * <tr>
 * <td>VK_PAD_RTHUMB_DOWNRIGHT</td>
 * <td>Right thumbstick down and right </td>
 * </tr>
 * <tr>
 * <td>VK_PAD_RTHUMB_DOWNLEFT</td>
 * <td>Right thumbstick down and left </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/xinput/ns-xinput-xinput_keystroke
 * @namespace Windows.Win32.UI.Input.XboxController
 * @version v4.0.30319
 */
class XINPUT_KEYSTROKE extends Win32Struct
{
    static sizeof => 8

    static packingSize => 2

    /**
     * Virtual-key code of the key, button, or stick movement. See XInput.h for a list of valid virtual-key (VK_xxx) codes. Also, see Remarks.
     * @type {Integer}
     */
    VirtualKey {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * This member is unused and the value is zero.
     * @type {Integer}
     */
    Unicode {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * Flags that indicate the keyboard state at the time of the input event. This member can be any combination of the following flags:        
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>XINPUT_KEYSTROKE_KEYDOWN</td>
     * <td>The key was pressed. </td>
     * </tr>
     * <tr>
     * <td>XINPUT_KEYSTROKE_KEYUP</td>
     * <td>The key was released. </td>
     * </tr>
     * <tr>
     * <td>XINPUT_KEYSTROKE_REPEAT</td>
     * <td>A repeat of a held key. </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * Index of the signed-in gamer associated with the device. Can be a value in the range 0–3.
     * @type {Integer}
     */
    UserIndex {
        get => NumGet(this, 6, "char")
        set => NumPut("char", value, this, 6)
    }

    /**
     * HID code corresponding to the input. If there is no corresponding HID code, this value is zero.
     * @type {Integer}
     */
    HidCode {
        get => NumGet(this, 7, "char")
        set => NumPut("char", value, this, 7)
    }
}
