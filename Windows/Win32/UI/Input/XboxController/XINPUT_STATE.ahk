#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\XINPUT_GAMEPAD.ahk" { XINPUT_GAMEPAD }
#Import ".\XINPUT_GAMEPAD_BUTTON_FLAGS.ahk" { XINPUT_GAMEPAD_BUTTON_FLAGS }

/**
 * Represents the state of a controller.
 * @remarks
 * The <i>dwPacketNumber</i> member is incremented only if the status of the controller has changed since the controller was last polled.
 * @see https://learn.microsoft.com/windows/win32/api/xinput/ns-xinput-xinput_state
 * @namespace Windows.Win32.UI.Input.XboxController
 */
export default struct XINPUT_STATE {
    #StructPack 4

    /**
     * State packet number. The packet number indicates whether there have been any changes in the state of the controller. If the <i>dwPacketNumber</i> member is the same in sequentially returned <b>XINPUT_STATE</b> structures, the controller state has not changed.
     */
    dwPacketNumber : UInt32

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/xinput/ns-xinput-xinput_gamepad">XINPUT_GAMEPAD</a> structure containing the current state of an Xbox 360 Controller.
     */
    Gamepad : XINPUT_GAMEPAD

}
