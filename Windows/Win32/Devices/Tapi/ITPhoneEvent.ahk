#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITPhone.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ITCallInfo.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITPhoneEvent interface contains methods that retrieve the description of phone events that have occurred.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itphoneevent
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITPhoneEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITPhoneEvent
     * @type {Guid}
     */
    static IID => Guid("{8f942dd8-64ed-4aaf-a77d-b23db0837ead}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Phone", "get_Event", "get_ButtonState", "get_HookSwitchState", "get_HookSwitchDevice", "get_RingMode", "get_ButtonLampId", "get_NumberGathered", "get_Call"]

    /**
     * @type {ITPhone} 
     */
    Phone {
        get => this.get_Phone()
    }

    /**
     * @type {Integer} 
     */
    Event {
        get => this.get_Event()
    }

    /**
     * @type {Integer} 
     */
    ButtonState {
        get => this.get_ButtonState()
    }

    /**
     * @type {Integer} 
     */
    HookSwitchState {
        get => this.get_HookSwitchState()
    }

    /**
     * @type {Integer} 
     */
    HookSwitchDevice {
        get => this.get_HookSwitchDevice()
    }

    /**
     * @type {Integer} 
     */
    RingMode {
        get => this.get_RingMode()
    }

    /**
     * @type {Integer} 
     */
    ButtonLampId {
        get => this.get_ButtonLampId()
    }

    /**
     * @type {BSTR} 
     */
    NumberGathered {
        get => this.get_NumberGathered()
    }

    /**
     * @type {ITCallInfo} 
     */
    Call {
        get => this.get_Call()
    }

    /**
     * 
     * @returns {ITPhone} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphoneevent-get_phone
     */
    get_Phone() {
        result := ComCall(7, this, "ptr*", &ppPhone := 0, "HRESULT")
        return ITPhone(ppPhone)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphoneevent-get_event
     */
    get_Event() {
        result := ComCall(8, this, "int*", &pEvent := 0, "HRESULT")
        return pEvent
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphoneevent-get_buttonstate
     */
    get_ButtonState() {
        result := ComCall(9, this, "int*", &pState := 0, "HRESULT")
        return pState
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphoneevent-get_hookswitchstate
     */
    get_HookSwitchState() {
        result := ComCall(10, this, "int*", &pState := 0, "HRESULT")
        return pState
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphoneevent-get_hookswitchdevice
     */
    get_HookSwitchDevice() {
        result := ComCall(11, this, "int*", &pDevice := 0, "HRESULT")
        return pDevice
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphoneevent-get_ringmode
     */
    get_RingMode() {
        result := ComCall(12, this, "int*", &plRingMode := 0, "HRESULT")
        return plRingMode
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphoneevent-get_buttonlampid
     */
    get_ButtonLampId() {
        result := ComCall(13, this, "int*", &plButtonLampId := 0, "HRESULT")
        return plButtonLampId
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphoneevent-get_numbergathered
     */
    get_NumberGathered() {
        ppNumber := BSTR()
        result := ComCall(14, this, "ptr", ppNumber, "HRESULT")
        return ppNumber
    }

    /**
     * 
     * @returns {ITCallInfo} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphoneevent-get_call
     */
    get_Call() {
        result := ComCall(15, this, "ptr*", &ppCallInfo := 0, "HRESULT")
        return ITCallInfo(ppCallInfo)
    }
}
