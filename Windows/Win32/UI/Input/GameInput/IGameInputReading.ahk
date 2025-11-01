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
     * 
     * @returns {Integer} 
     */
    GetTimestamp() {
        result := ComCall(5, this, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<IGameInputDevice>} device 
     * @returns {String} Nothing - always returns an empty string
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
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getkeystate
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
