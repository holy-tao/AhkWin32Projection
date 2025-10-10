#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\XINPUT_GAMEPAD.ahk

/**
 * Represents the state of a controller.
 * @remarks
 * 
  * The <i>dwPacketNumber</i> member is incremented only if the status of the controller has changed since the controller was last polled.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//xinput/ns-xinput-xinput_state
 * @namespace Windows.Win32.UI.Input.XboxController
 * @version v4.0.30319
 */
class XINPUT_STATE extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * State packet number. The packet number indicates whether there have been any changes in the state of the controller. If the <i>dwPacketNumber</i> member is the same in sequentially returned <b>XINPUT_STATE</b> structures, the controller state has not changed.
     * @type {Integer}
     */
    dwPacketNumber {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/xinput/ns-xinput-xinput_gamepad">XINPUT_GAMEPAD</a> structure containing the current state of an Xbox 360 Controller.
     * @type {XINPUT_GAMEPAD}
     */
    Gamepad{
        get {
            if(!this.HasProp("__Gamepad"))
                this.__Gamepad := XINPUT_GAMEPAD(this.ptr + 8)
            return this.__Gamepad
        }
    }
}
