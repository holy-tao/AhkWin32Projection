#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Handle.ahk
/**
 * @namespace Windows.Win32.UI.Input.XboxController
 * @version v4.0.30319
 */
class XboxController {

;@region Constants

    /**
     * @type {String}
     */
    static XINPUT_DLL_A => "xinput1_4.dll"

    /**
     * @type {String}
     */
    static XINPUT_DLL_W => "xinput1_4.dll"

    /**
     * @type {String}
     */
    static XINPUT_DLL => "xinput1_4.dll"

    /**
     * @type {Integer (UInt32)}
     */
    static XUSER_MAX_COUNT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static XUSER_INDEX_ANY => 255
;@endregion Constants

;@region Methods
    /**
     * Retrieves the current state of the specified controller.
     * @param {Integer} dwUserIndex Index of the user's controller. Can be a value from 0 to 3. For information about how this value is determined and how the value maps to indicators on the controller, see <a href="https://docs.microsoft.com/windows/desktop/xinput/getting-started-with-xinput">Multiple Controllers</a>.
     * @param {Pointer<XINPUT_STATE>} pState Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/xinput/ns-xinput-xinput_state">XINPUT_STATE</a> structure that receives the current state of the controller.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * 
     * If the controller is not connected, the return value is <b>ERROR_DEVICE_NOT_CONNECTED</b>.
     * 
     * 
     * If the function fails, the return value is an error code defined in Winerror.h. The function does not use <b>SetLastError</b> to set the calling thread's last-error code.
     * @see https://docs.microsoft.com/windows/win32/api//xinput/nf-xinput-xinputgetstate
     */
    static XInputGetState(dwUserIndex, pState) {
        result := DllCall("xinput1_4.dll\XInputGetState", "uint", dwUserIndex, "ptr", pState, "uint")
        return result
    }

    /**
     * Sends data to a connected controller. This function is used to activate the vibration function of a controller.
     * @param {Integer} dwUserIndex Index of the user's controller. Can be a value from 0 to 3. For information about how this value is determined and how the value maps to indicators on the controller, see <a href="https://docs.microsoft.com/windows/desktop/xinput/getting-started-with-xinput">Multiple Controllers</a>.
     * @param {Pointer<XINPUT_VIBRATION>} pVibration Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/xinput/ns-xinput-xinput_vibration">XINPUT_VIBRATION</a> structure containing the vibration information to send to the controller.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the controller is not connected, the return value is <b>ERROR_DEVICE_NOT_CONNECTED</b>.
     * 
     * If the function fails, the return value is an error code defined in WinError.h. The function does not use <i>SetLastError</i> to set the calling thread's last-error code.
     * @see https://docs.microsoft.com/windows/win32/api//xinput/nf-xinput-xinputsetstate
     */
    static XInputSetState(dwUserIndex, pVibration) {
        result := DllCall("xinput1_4.dll\XInputSetState", "uint", dwUserIndex, "ptr", pVibration, "uint")
        return result
    }

    /**
     * Retrieves the capabilities and features of a connected controller.
     * @param {Integer} dwUserIndex Index of the user's controller. Can be a value in the range 0–3. For information about how this value is determined and how the value maps to indicators on the controller, see <a href="https://docs.microsoft.com/windows/desktop/xinput/getting-started-with-xinput">Multiple Controllers</a>.
     * @param {Integer} dwFlags Input flags that identify the controller type. If this value is 0, then the capabilities of all controllers connected to the system are returned. Currently, only one value is supported:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><b>XINPUT_FLAG_GAMEPAD</b></td>
     * <td>Limit query to devices of Xbox 360 Controller type.</td>
     * </tr>
     * </table>
     *  
     * 
     * Any value of <i>dwflags</i> other than the above or 0 is illegal and will result in an error break when debugging.
     * @param {Pointer<XINPUT_CAPABILITIES>} pCapabilities Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/xinput/ns-xinput-xinput_capabilities">XINPUT_CAPABILITIES</a> structure that receives the controller capabilities.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * 
     * If the controller is not connected, the return value is <b>ERROR_DEVICE_NOT_CONNECTED</b>.
     * 
     * 
     * If the function fails, the return value is an error code defined in WinError.h. The function does not use <i>SetLastError</i> to set the calling thread's last-error code.
     * @see https://docs.microsoft.com/windows/win32/api//xinput/nf-xinput-xinputgetcapabilities
     */
    static XInputGetCapabilities(dwUserIndex, dwFlags, pCapabilities) {
        result := DllCall("xinput1_4.dll\XInputGetCapabilities", "uint", dwUserIndex, "uint", dwFlags, "ptr", pCapabilities, "uint")
        return result
    }

    /**
     * Sets the reporting state of XInput.
     * @remarks
     * 
     * This function is meant to be called when an application gains or loses focus (such as via <a href="https://docs.microsoft.com/windows/desktop/winmsg/wm-activateapp">WM_ACTIVATEAPP</a>). Using this function, you will not have to change the XInput query loop in your application as neutral data will always be reported if XInput is disabled.
     * 
     * 
     * In a controller that supports vibration effects:
     * 
     * <ul>
     * <li>Passing <b>FALSE</b> will stop any vibration effects currently playing. In this state, calls to <a href="https://docs.microsoft.com/windows/desktop/api/xinput/nf-xinput-xinputsetstate">XInputSetState</a> will be registered, but not passed to the device.</li>
     * <li>Passing <b>TRUE</b> will pass the last vibration request (even if it is 0) sent to <a href="https://docs.microsoft.com/windows/desktop/api/xinput/nf-xinput-xinputsetstate">XInputSetState</a> to the device.</li>
     * </ul>
     * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
     * Windows 8 (XInput 1.4), DirectX SDK (XInput 1.3)
     * 
     * 
     * @param {BOOL} enable If enable is <b>FALSE</b>, XInput will only send neutral data in response to <a href="https://docs.microsoft.com/windows/desktop/api/xinput/nf-xinput-xinputgetstate">XInputGetState</a> (all buttons up, axes centered, and triggers at 0). <a href="https://docs.microsoft.com/windows/desktop/api/xinput/nf-xinput-xinputsetstate">XInputSetState</a> calls will be registered but not sent to the device. Sending any value other than <b>FALSE </b>will restore reading and writing functionality to normal.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//xinput/nf-xinput-xinputenable
     */
    static XInputEnable(enable) {
        DllCall("xinput1_4.dll\XInputEnable", "int", enable)
    }

    /**
     * Retrieves the sound rendering and sound capture audio device IDs that are associated with the headset connected to the specified controller.
     * @param {Integer} dwUserIndex Index of the gamer associated with the device.
     * @param {PWSTR} pRenderDeviceId Windows Core Audio device ID string for render (speakers).
     * @param {Pointer<UInt32>} pRenderCount Size, in wide-chars, of the render device ID string buffer.
     * @param {PWSTR} pCaptureDeviceId Windows Core Audio device ID string for capture (microphone).
     * @param {Pointer<UInt32>} pCaptureCount Size, in wide-chars, of capture device ID string buffer.
     * @returns {Integer} If the function successfully retrieves the device IDs for render and capture, the return code is <b>ERROR_SUCCESS</b>.
     * 
     * 
     * If there is no headset connected to the controller, the function will also retrieve <b>ERROR_SUCCESS</b> with <b>NULL</b> as the values for <i>pRenderDeviceId</i> and <i>pCaptureDeviceId</i>.
     * 
     * 
     * If the controller port device is not physically connected, the function will return <b>ERROR_DEVICE_NOT_CONNECTED</b>.
     * 
     * 
     * If the function fails, it will return a valid Win32 error code.
     * @see https://docs.microsoft.com/windows/win32/api//xinput/nf-xinput-xinputgetaudiodeviceids
     */
    static XInputGetAudioDeviceIds(dwUserIndex, pRenderDeviceId, pRenderCount, pCaptureDeviceId, pCaptureCount) {
        pRenderDeviceId := pRenderDeviceId is String ? StrPtr(pRenderDeviceId) : pRenderDeviceId
        pCaptureDeviceId := pCaptureDeviceId is String ? StrPtr(pCaptureDeviceId) : pCaptureDeviceId

        result := DllCall("xinput1_4.dll\XInputGetAudioDeviceIds", "uint", dwUserIndex, "ptr", pRenderDeviceId, "uint*", pRenderCount, "ptr", pCaptureDeviceId, "uint*", pCaptureCount, "uint")
        return result
    }

    /**
     * Retrieves the battery type and charge status of a wireless controller.
     * @param {Integer} dwUserIndex Index of the signed-in gamer associated with the device. Can be a value in the range 0–XUSER_MAX_COUNT − 1.
     * @param {Integer} devType Specifies which device associated with this user index should be queried. Must be <b>BATTERY_DEVTYPE_GAMEPAD</b> or <b>BATTERY_DEVTYPE_HEADSET</b>.
     * @param {Pointer<XINPUT_BATTERY_INFORMATION>} pBatteryInformation Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/xinput/ns-xinput-xinput_battery_information">XINPUT_BATTERY_INFORMATION</a> structure that receives the battery information.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * @see https://docs.microsoft.com/windows/win32/api//xinput/nf-xinput-xinputgetbatteryinformation
     */
    static XInputGetBatteryInformation(dwUserIndex, devType, pBatteryInformation) {
        result := DllCall("xinput1_4.dll\XInputGetBatteryInformation", "uint", dwUserIndex, "char", devType, "ptr", pBatteryInformation, "uint")
        return result
    }

    /**
     * Retrieves a gamepad input event.
     * @param {Integer} dwUserIndex [in] Index of the signed-in gamer associated with the device. Can be a value in the range 0–XUSER_MAX_COUNT − 1, or XUSER_INDEX_ANY to fetch the next available input event from any user.
     * @param {Pointer<XINPUT_KEYSTROKE>} pKeystroke [out] Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/xinput/ns-xinput-xinput_keystroke">XINPUT_KEYSTROKE</a> structure that receives an input event.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * 
     * If no new keys have been pressed, the return value is <b>ERROR_EMPTY</b>.
     * 
     * 
     * If the controller is not connected or the user has not activated it, the return value is <b>ERROR_DEVICE_NOT_CONNECTED</b>. See the Remarks section below.
     * 
     * If the function fails, the return value is an error code defined in Winerror.h. The function does not use <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-setlasterror">SetLastError</a> to set the calling thread's last-error code.
     * @see https://docs.microsoft.com/windows/win32/api//xinput/nf-xinput-xinputgetkeystroke
     */
    static XInputGetKeystroke(dwUserIndex, pKeystroke) {
        static dwReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("xinput1_4.dll\XInputGetKeystroke", "uint", dwUserIndex, "uint", dwReserved, "ptr", pKeystroke, "uint")
        return result
    }

;@endregion Methods
}
