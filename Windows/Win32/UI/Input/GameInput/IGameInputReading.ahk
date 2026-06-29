#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IGameInputDevice.ahk" { IGameInputDevice }
#Import ".\GameInputSwitchPosition.ahk" { GameInputSwitchPosition }
#Import ".\GameInputArcadeStickState.ahk" { GameInputArcadeStickState }
#Import ".\GameInputUiNavigationState.ahk" { GameInputUiNavigationState }
#Import ".\GameInputTouchState.ahk" { GameInputTouchState }
#Import ".\GameInputRacingWheelState.ahk" { GameInputRacingWheelState }
#Import ".\GameInputMouseState.ahk" { GameInputMouseState }
#Import ".\GameInputKind.ahk" { GameInputKind }
#Import ".\GameInputMotionState.ahk" { GameInputMotionState }
#Import ".\GameInputKeyState.ahk" { GameInputKeyState }
#Import ".\GameInputGamepadState.ahk" { GameInputGamepadState }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\GameInputFlightStickState.ahk" { GameInputFlightStickState }
#Import ".\IGameInputRawDeviceReport.ahk" { IGameInputRawDeviceReport }

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
export default struct IGameInputReading extends IUnknown {
    /**
     * The interface identifier for IGameInputReading
     * @type {Guid}
     */
    static IID := Guid("{2156947a-e1fa-4de0-a30b-d812931dbd8d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IGameInputReading interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetInputKind             : IntPtr
        GetSequenceNumber        : IntPtr
        GetTimestamp             : IntPtr
        GetDevice                : IntPtr
        GetRawReport             : IntPtr
        GetControllerAxisCount   : IntPtr
        GetControllerAxisState   : IntPtr
        GetControllerButtonCount : IntPtr
        GetControllerButtonState : IntPtr
        GetControllerSwitchCount : IntPtr
        GetControllerSwitchState : IntPtr
        GetKeyCount              : IntPtr
        GetKeyState              : IntPtr
        GetMouseState            : IntPtr
        GetTouchCount            : IntPtr
        GetTouchState            : IntPtr
        GetMotionState           : IntPtr
        GetArcadeStickState      : IntPtr
        GetFlightStickState      : IntPtr
        GetGamepadState          : IntPtr
        GetRacingWheelState      : IntPtr
        GetUiNavigationState     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IGameInputReading.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {GameInputKind} 
     */
    GetInputKind() {
        result := ComCall(3, this, GameInputKind)
        return result
    }

    /**
     * 
     * @param {GameInputKind} inputKind 
     * @returns {Integer} 
     */
    GetSequenceNumber(inputKind) {
        result := ComCall(4, this, GameInputKind, inputKind, Int64)
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetTimestamp() {
        result := ComCall(5, this, Int64)
        return result
    }

    /**
     * 
     * @param {Pointer<IGameInputDevice>} device 
     * @returns {String} Nothing - always returns an empty string
     */
    GetDevice(device) {
        ComCall(6, this, IGameInputDevice.Ptr, device)
    }

    /**
     * 
     * @param {Pointer<IGameInputRawDeviceReport>} report 
     * @returns {Boolean} 
     */
    GetRawReport(report) {
        result := ComCall(7, this, IGameInputRawDeviceReport.Ptr, report, Int32)
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetControllerAxisCount() {
        result := ComCall(8, this, UInt32)
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

        result := ComCall(9, this, "uint", stateArrayCount, stateArrayMarshal, stateArray, UInt32)
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetControllerButtonCount() {
        result := ComCall(10, this, UInt32)
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

        result := ComCall(11, this, "uint", stateArrayCount, stateArrayMarshal, stateArray, UInt32)
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetControllerSwitchCount() {
        result := ComCall(12, this, UInt32)
        return result
    }

    /**
     * 
     * @param {Integer} stateArrayCount 
     * @param {Pointer<GameInputSwitchPosition>} stateArray 
     * @returns {Integer} 
     */
    GetControllerSwitchState(stateArrayCount, stateArray) {
        stateArrayMarshal := stateArray is VarRef ? "int*" : "ptr"

        result := ComCall(13, this, "uint", stateArrayCount, stateArrayMarshal, stateArray, UInt32)
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetKeyCount() {
        result := ComCall(14, this, UInt32)
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
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getkeystate
     */
    GetKeyState(stateArrayCount, stateArray) {
        result := ComCall(15, this, "uint", stateArrayCount, GameInputKeyState.Ptr, stateArray, UInt32)
        return result
    }

    /**
     * 
     * @param {Pointer<GameInputMouseState>} state 
     * @returns {Boolean} 
     */
    GetMouseState(state) {
        result := ComCall(16, this, GameInputMouseState.Ptr, state, Int32)
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetTouchCount() {
        result := ComCall(17, this, UInt32)
        return result
    }

    /**
     * 
     * @param {Integer} stateArrayCount 
     * @param {Pointer<GameInputTouchState>} stateArray 
     * @returns {Integer} 
     */
    GetTouchState(stateArrayCount, stateArray) {
        result := ComCall(18, this, "uint", stateArrayCount, GameInputTouchState.Ptr, stateArray, UInt32)
        return result
    }

    /**
     * 
     * @param {Pointer<GameInputMotionState>} state 
     * @returns {Boolean} 
     */
    GetMotionState(state) {
        result := ComCall(19, this, GameInputMotionState.Ptr, state, Int32)
        return result
    }

    /**
     * 
     * @param {Pointer<GameInputArcadeStickState>} state 
     * @returns {Boolean} 
     */
    GetArcadeStickState(state) {
        result := ComCall(20, this, GameInputArcadeStickState.Ptr, state, Int32)
        return result
    }

    /**
     * 
     * @param {Pointer<GameInputFlightStickState>} state 
     * @returns {Boolean} 
     */
    GetFlightStickState(state) {
        result := ComCall(21, this, GameInputFlightStickState.Ptr, state, Int32)
        return result
    }

    /**
     * 
     * @param {Pointer<GameInputGamepadState>} state 
     * @returns {Boolean} 
     */
    GetGamepadState(state) {
        result := ComCall(22, this, GameInputGamepadState.Ptr, state, Int32)
        return result
    }

    /**
     * 
     * @param {Pointer<GameInputRacingWheelState>} state 
     * @returns {Boolean} 
     */
    GetRacingWheelState(state) {
        result := ComCall(23, this, GameInputRacingWheelState.Ptr, state, Int32)
        return result
    }

    /**
     * 
     * @param {Pointer<GameInputUiNavigationState>} state 
     * @returns {Boolean} 
     */
    GetUiNavigationState(state) {
        result := ComCall(24, this, GameInputUiNavigationState.Ptr, state, Int32)
        return result
    }

    Query(iid) {
        if (IGameInputReading.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetInputKind := CallbackCreate(GetMethod(implObj, "GetInputKind"), flags, 1)
        this.vtbl.GetSequenceNumber := CallbackCreate(GetMethod(implObj, "GetSequenceNumber"), flags, 2)
        this.vtbl.GetTimestamp := CallbackCreate(GetMethod(implObj, "GetTimestamp"), flags, 1)
        this.vtbl.GetDevice := CallbackCreate(GetMethod(implObj, "GetDevice"), flags, 2)
        this.vtbl.GetRawReport := CallbackCreate(GetMethod(implObj, "GetRawReport"), flags, 2)
        this.vtbl.GetControllerAxisCount := CallbackCreate(GetMethod(implObj, "GetControllerAxisCount"), flags, 1)
        this.vtbl.GetControllerAxisState := CallbackCreate(GetMethod(implObj, "GetControllerAxisState"), flags, 3)
        this.vtbl.GetControllerButtonCount := CallbackCreate(GetMethod(implObj, "GetControllerButtonCount"), flags, 1)
        this.vtbl.GetControllerButtonState := CallbackCreate(GetMethod(implObj, "GetControllerButtonState"), flags, 3)
        this.vtbl.GetControllerSwitchCount := CallbackCreate(GetMethod(implObj, "GetControllerSwitchCount"), flags, 1)
        this.vtbl.GetControllerSwitchState := CallbackCreate(GetMethod(implObj, "GetControllerSwitchState"), flags, 3)
        this.vtbl.GetKeyCount := CallbackCreate(GetMethod(implObj, "GetKeyCount"), flags, 1)
        this.vtbl.GetKeyState := CallbackCreate(GetMethod(implObj, "GetKeyState"), flags, 3)
        this.vtbl.GetMouseState := CallbackCreate(GetMethod(implObj, "GetMouseState"), flags, 2)
        this.vtbl.GetTouchCount := CallbackCreate(GetMethod(implObj, "GetTouchCount"), flags, 1)
        this.vtbl.GetTouchState := CallbackCreate(GetMethod(implObj, "GetTouchState"), flags, 3)
        this.vtbl.GetMotionState := CallbackCreate(GetMethod(implObj, "GetMotionState"), flags, 2)
        this.vtbl.GetArcadeStickState := CallbackCreate(GetMethod(implObj, "GetArcadeStickState"), flags, 2)
        this.vtbl.GetFlightStickState := CallbackCreate(GetMethod(implObj, "GetFlightStickState"), flags, 2)
        this.vtbl.GetGamepadState := CallbackCreate(GetMethod(implObj, "GetGamepadState"), flags, 2)
        this.vtbl.GetRacingWheelState := CallbackCreate(GetMethod(implObj, "GetRacingWheelState"), flags, 2)
        this.vtbl.GetUiNavigationState := CallbackCreate(GetMethod(implObj, "GetUiNavigationState"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetInputKind)
        CallbackFree(this.vtbl.GetSequenceNumber)
        CallbackFree(this.vtbl.GetTimestamp)
        CallbackFree(this.vtbl.GetDevice)
        CallbackFree(this.vtbl.GetRawReport)
        CallbackFree(this.vtbl.GetControllerAxisCount)
        CallbackFree(this.vtbl.GetControllerAxisState)
        CallbackFree(this.vtbl.GetControllerButtonCount)
        CallbackFree(this.vtbl.GetControllerButtonState)
        CallbackFree(this.vtbl.GetControllerSwitchCount)
        CallbackFree(this.vtbl.GetControllerSwitchState)
        CallbackFree(this.vtbl.GetKeyCount)
        CallbackFree(this.vtbl.GetKeyState)
        CallbackFree(this.vtbl.GetMouseState)
        CallbackFree(this.vtbl.GetTouchCount)
        CallbackFree(this.vtbl.GetTouchState)
        CallbackFree(this.vtbl.GetMotionState)
        CallbackFree(this.vtbl.GetArcadeStickState)
        CallbackFree(this.vtbl.GetFlightStickState)
        CallbackFree(this.vtbl.GetGamepadState)
        CallbackFree(this.vtbl.GetRacingWheelState)
        CallbackFree(this.vtbl.GetUiNavigationState)
    }
}
