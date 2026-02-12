#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 * @version v4.0.30319
 */
class IGameInputReading extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGameInputReading
     * @type {Guid}
     */
    static IID => Guid("{2156947a-e1fa-4de0-a30b-d812931dbd8d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetInputKind", "GetSequenceNumber", "GetTimestamp", "GetDevice", "GetRawReport", "GetControllerAxisCount", "GetControllerAxisState", "GetControllerButtonCount", "GetControllerButtonState", "GetControllerSwitchCount", "GetControllerSwitchState", "GetKeyCount", "GetKeyState", "GetMouseState", "GetTouchCount", "GetTouchState", "GetMotionState", "GetArcadeStickState", "GetFlightStickState", "GetGamepadState", "GetRacingWheelState", "GetUiNavigationState"]

    /**
     * 
     * @returns {Integer} 
     */
    GetInputKind() {
        result := ComCall(3, this, "int")
        return result
    }

    /**
     * 
     * @param {Integer} inputKind 
     * @returns {Integer} 
     */
    GetSequenceNumber(inputKind) {
        result := ComCall(4, this, "int", inputKind, "uint")
        return result
    }

    /**
     * Retrieves the time stamp of a loaded image.
     * @remarks
     * The time stamp for an image is initially set by the linker, but it can be modified by operations such as rebasing. The value is represented in the number of seconds elapsed since midnight (00:00:00), January 1, 1970, Universal Coordinated Time, according to the system clock. The time stamp can be printed using the C run-time (CRT) function ctime.
     * 
     * All <a href="https://docs.microsoft.com/windows/desktop/Debug/dbghelp-functions">DbgHelp Functions</a>, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * @returns {Integer} If the function succeeds, the return value is the time stamp from the image.
     * 
     * If the function fails, the return value is zero. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/dbghelp/nf-dbghelp-gettimestampforloadedlibrary
     */
    GetTimestamp() {
        result := ComCall(5, this, "uint")
        return result
    }

    /**
     * The GetDeviceCaps function retrieves device-specific information for the specified device.
     * @remarks
     * When <i>nIndex</i> is SHADEBLENDCAPS:
     * 
     * <ul>
     * <li>For a printer, <b>GetDeviceCaps</b> returns whatever the printer reports.</li>
     * <li>For a display device, all blending operations are available; besides SB_NONE, the only return values are SB_CONST_ALPHA and SB_PIXEL_ALPHA, which indicate whether these operations are accelerated.</li>
     * </ul>
     * On a multiple monitor system, if <i>hdc</i> is the desktop, <b>GetDeviceCaps</b> returns the capabilities of the primary monitor. If you want info for other monitors, you must use the <a href="https://docs.microsoft.com/windows/desktop/gdi/multiple-display-monitors-reference">multi-monitor APIs</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-createdca">CreateDC</a> to get a HDC for the device context (DC) of a specific monitor.  
     * 
     * <div class="alert"><b>Note</b>  Display1 is typically the primary monitor, but not always.</div>
     * <div> </div>
     * <b>GetDeviceCaps</b> provides the following six indexes in place of printer escapes.
     * 
     * <table>
     * <tr>
     * <th>Index</th>
     * <th>Printer escape replaced</th>
     * </tr>
     * <tr>
     * <td>PHYSICALWIDTH</td>
     * <td>GETPHYSPAGESIZE</td>
     * </tr>
     * <tr>
     * <td>PHYSICALHEIGHT</td>
     * <td>GETPHYSPAGESIZE</td>
     * </tr>
     * <tr>
     * <td>PHYSICALOFFSETX</td>
     * <td>GETPRINTINGOFFSET</td>
     * </tr>
     * <tr>
     * <td>PHYSICALOFFSETY</td>
     * <td>GETPHYSICALOFFSET</td>
     * </tr>
     * <tr>
     * <td>SCALINGFACTORX</td>
     * <td>GETSCALINGFACTOR</td>
     * </tr>
     * <tr>
     * <td>SCALINGFACTORY</td>
     * <td>GETSCALINGFACTOR</td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  <b>GetDeviceCaps</b> reports info that the display driver provides. If the display driver declines to report any info, <b>GetDeviceCaps</b> calculates the info based on fixed calculations. If the display driver reports invalid info, <b>GetDeviceCaps</b> returns the invalid info. Also, if the display driver declines to report info, <b>GetDeviceCaps</b> might calculate incorrect info because it assumes either fixed DPI (96 DPI) or a fixed size (depending on the info that the display driver did and didn’t provide). Unfortunately, a display driver that is implemented to the Windows Display Driver Model (WDDM) (introduced in Windows Vista) causes GDI to not get the info, so <b>GetDeviceCaps</b> must always calculate the info.</div>
     * <div> </div>
     * @param {Pointer<IGameInputDevice>} device 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api//content/wingdi/nf-wingdi-getdevicecaps
     */
    GetDevice(device) {
        ComCall(6, this, "ptr*", device)
    }

    /**
     * 
     * @param {Pointer<IGameInputRawDeviceReport>} report 
     * @returns {Boolean} 
     */
    GetRawReport(report) {
        result := ComCall(7, this, "ptr*", report, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetControllerAxisCount() {
        result := ComCall(8, this, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} stateArrayCount 
     * @param {Pointer<Float>} stateArray 
     * @returns {Integer} 
     */
    GetControllerAxisState(stateArrayCount, stateArray) {
        stateArrayMarshal := stateArray is VarRef ? "float*" : "ptr"

        result := ComCall(9, this, "uint", stateArrayCount, stateArrayMarshal, stateArray, "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetControllerButtonCount() {
        result := ComCall(10, this, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} stateArrayCount 
     * @param {Pointer<Boolean>} stateArray 
     * @returns {Integer} 
     */
    GetControllerButtonState(stateArrayCount, stateArray) {
        stateArrayMarshal := stateArray is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, "uint", stateArrayCount, stateArrayMarshal, stateArray, "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetControllerSwitchCount() {
        result := ComCall(12, this, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} stateArrayCount 
     * @param {Pointer<Integer>} stateArray 
     * @returns {Integer} 
     */
    GetControllerSwitchState(stateArrayCount, stateArray) {
        stateArrayMarshal := stateArray is VarRef ? "int*" : "ptr"

        result := ComCall(13, this, "uint", stateArrayCount, stateArrayMarshal, stateArray, "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetKeyCount() {
        result := ComCall(14, this, "uint")
        return result
    }

    /**
     * Retrieves the status of the specified virtual key. The status specifies whether the key is up, down, or toggled (on, off�alternating each time the key is pressed).
     * @remarks
     * The key status returned from this function changes as a thread reads key messages from its message queue. The status does not reflect the interrupt-level state associated with the hardware. Use the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getasynckeystate">GetAsyncKeyState</a> function to retrieve that information.
     * 
     * An application calls <b>GetKeyState</b> in response to a keyboard-input message. This function retrieves the state of the key when the input message was generated.
     * 
     * To retrieve state information for all the virtual keys, use the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getkeyboardstate">GetKeyboardState</a> function.
     * 
     * An application can use the <a href="https://docs.microsoft.com/windows/desktop/inputdev/virtual-key-codes">virtual key code</a> constants <b>VK_SHIFT</b>, <b>VK_CONTROL</b>, and <b>VK_MENU</b> as values for the 
     *     <i>nVirtKey</i> parameter. This gives the status of the SHIFT, CTRL, or ALT keys without distinguishing between left and right. An application can also use the following virtual-key code constants as values for 
     *     <i>nVirtKey</i> to distinguish between the left and right instances of those keys:
     * 
     * <b>VK_LSHIFT</b>
     * <b>VK_RSHIFT</b>
     * <b>VK_LCONTROL</b>
     * <b>VK_RCONTROL</b>
     * <b>VK_LMENU</b>
     * <b>VK_RMENU</b>
     * These left- and right-distinguishing constants are available to an application only through the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getkeyboardstate">GetKeyboardState</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setkeyboardstate">SetKeyboardState</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getasynckeystate">GetAsyncKeyState</a>, <b>GetKeyState</b>, and <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-mapvirtualkeya">MapVirtualKey</a> functions.
     * @param {Integer} stateArrayCount 
     * @param {Pointer<GameInputKeyState>} stateArray 
     * @returns {Integer} Type: <b>SHORT</b>
     * 
     * The return value specifies the status of the specified virtual key, as follows:
     * 
     * <ul>
     * <li>If the high-order bit is 1, the key is down; otherwise, it is up.</li>
     * <li>If the low-order bit is 1, the key is toggled. A key, such as the CAPS LOCK key, is toggled if it is turned on. The key is off and untoggled if the low-order bit is 0. A toggle key's indicator light (if any) on the keyboard will be on when the key is toggled, and off when the key is untoggled.</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api//content/winuser/nf-winuser-getkeystate
     */
    GetKeyState(stateArrayCount, stateArray) {
        result := ComCall(15, this, "uint", stateArrayCount, "ptr", stateArray, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<GameInputMouseState>} state 
     * @returns {Boolean} 
     */
    GetMouseState(state) {
        result := ComCall(16, this, "ptr", state, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetTouchCount() {
        result := ComCall(17, this, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} stateArrayCount 
     * @param {Pointer<GameInputTouchState>} stateArray 
     * @returns {Integer} 
     */
    GetTouchState(stateArrayCount, stateArray) {
        result := ComCall(18, this, "uint", stateArrayCount, "ptr", stateArray, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<GameInputMotionState>} state 
     * @returns {Boolean} 
     */
    GetMotionState(state) {
        result := ComCall(19, this, "ptr", state, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GameInputArcadeStickState>} state 
     * @returns {Boolean} 
     */
    GetArcadeStickState(state) {
        result := ComCall(20, this, "ptr", state, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GameInputFlightStickState>} state 
     * @returns {Boolean} 
     */
    GetFlightStickState(state) {
        result := ComCall(21, this, "ptr", state, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GameInputGamepadState>} state 
     * @returns {Boolean} 
     */
    GetGamepadState(state) {
        result := ComCall(22, this, "ptr", state, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GameInputRacingWheelState>} state 
     * @returns {Boolean} 
     */
    GetRacingWheelState(state) {
        result := ComCall(23, this, "ptr", state, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GameInputUiNavigationState>} state 
     * @returns {Boolean} 
     */
    GetUiNavigationState(state) {
        result := ComCall(24, this, "ptr", state, "int")
        return result
    }
}
