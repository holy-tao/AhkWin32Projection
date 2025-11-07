#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Describes the current state of the Xbox 360 Controller.
 * @remarks
 * 
 * This structure is used by the <a href="https://docs.microsoft.com/windows/desktop/api/xinput/ns-xinput-xinput_state">XINPUT_STATE</a> structure when polling for changes in the state of the controller.
 * 
 * 
 * 
 * The specific mapping of button to game function varies depending on the game type.
 * 
 * 
 * 
 * The constant XINPUT_GAMEPAD_TRIGGER_THRESHOLD may be used as the value which <i>bLeftTrigger</i> and <i>bRightTrigger</i> must be greater than to register as pressed. This is optional, but often desirable. Xbox 360 Controller buttons do not manifest crosstalk.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//xinput/ns-xinput-xinput_gamepad
 * @namespace Windows.Win32.UI.Input.XboxController
 * @version v4.0.30319
 */
class XINPUT_GAMEPAD extends Win32Struct
{
    static sizeof => 12

    static packingSize => 2

    /**
     * Bitmask of the device digital buttons, as follows. A set bit indicates that the corresponding button is pressed. 
     *         
     * 
     * <table>
     * <tr>
     * <th>Device button</th>
     * <th>Bitmask</th>
     * </tr>
     * <tr>
     * <td>XINPUT_GAMEPAD_DPAD_UP</td>
     * <td> 0x0001</td>
     * </tr>
     * <tr>
     * <td>XINPUT_GAMEPAD_DPAD_DOWN</td>
     * <td>        0x0002</td>
     * </tr>
     * <tr>
     * <td>XINPUT_GAMEPAD_DPAD_LEFT</td>
     * <td>       0x0004</td>
     * </tr>
     * <tr>
     * <td>XINPUT_GAMEPAD_DPAD_RIGHT</td>
     * <td>      0x0008</td>
     * </tr>
     * <tr>
     * <td>XINPUT_GAMEPAD_START</td>
     * <td>          0x0010</td>
     * </tr>
     * <tr>
     * <td>XINPUT_GAMEPAD_BACK</td>
     * <td>             0x0020</td>
     * </tr>
     * <tr>
     * <td>XINPUT_GAMEPAD_LEFT_THUMB</td>
     * <td>       0x0040</td>
     * </tr>
     * <tr>
     * <td>XINPUT_GAMEPAD_RIGHT_THUMB</td>
     * <td>      0x0080</td>
     * </tr>
     * <tr>
     * <td>XINPUT_GAMEPAD_LEFT_SHOULDER</td>
     * <td>    0x0100</td>
     * </tr>
     * <tr>
     * <td>XINPUT_GAMEPAD_RIGHT_SHOULDER</td>
     * <td>   0x0200</td>
     * </tr>
     * <tr>
     * <td>XINPUT_GAMEPAD_A</td>
     * <td>                0x1000</td>
     * </tr>
     * <tr>
     * <td>XINPUT_GAMEPAD_B</td>
     * <td>                0x2000</td>
     * </tr>
     * <tr>
     * <td>XINPUT_GAMEPAD_X</td>
     * <td>                0x4000</td>
     * </tr>
     * <tr>
     * <td>XINPUT_GAMEPAD_Y</td>
     * <td>                0x8000</td>
     * </tr>
     * </table>
     *  
     * 
     * Bits that are set but not defined above are reserved, and their state is undefined.
     * @type {Integer}
     */
    wButtons {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * The current value of the left trigger analog control. The value is between 0 and 255.
     * @type {Integer}
     */
    bLeftTrigger {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * The current value of the right trigger analog control. The value is between 0 and 255.
     * @type {Integer}
     */
    bRightTrigger {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * Left thumbstick x-axis value. Each of the thumbstick axis members is a signed value between -32768 and 32767 describing the position of the thumbstick. A value of 0 is centered. Negative values signify down or to the left. Positive values signify up or to the right. The constants XINPUT_GAMEPAD_LEFT_THUMB_DEADZONE or XINPUT_GAMEPAD_RIGHT_THUMB_DEADZONE can be used as a positive and negative value to filter a thumbstick input.
     * @type {Integer}
     */
    sThumbLX {
        get => NumGet(this, 4, "short")
        set => NumPut("short", value, this, 4)
    }

    /**
     * Left thumbstick y-axis value. The value is between -32768 and 32767.
     * @type {Integer}
     */
    sThumbLY {
        get => NumGet(this, 6, "short")
        set => NumPut("short", value, this, 6)
    }

    /**
     * Right thumbstick x-axis value. The value is between -32768 and 32767.
     * @type {Integer}
     */
    sThumbRX {
        get => NumGet(this, 8, "short")
        set => NumPut("short", value, this, 8)
    }

    /**
     * Right thumbstick y-axis value. The value is between -32768 and 32767.
     * @type {Integer}
     */
    sThumbRY {
        get => NumGet(this, 10, "short")
        set => NumPut("short", value, this, 10)
    }
}
