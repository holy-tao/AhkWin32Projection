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
     * The get_Phone method returns a pointer to the ITPhone interface on the phone object that fired this event.
     * @returns {ITPhone} Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itphone">ITPhone</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itphoneevent-get_phone
     */
    get_Phone() {
        result := ComCall(7, this, "ptr*", &ppPhone := 0, "HRESULT")
        return ITPhone(ppPhone)
    }

    /**
     * The get_Event method returns a PHONE_EVENT value specifying the type of phone event that occurred.
     * @returns {Integer} The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-phone_event">PHONE_EVENT</a> descriptor of the event.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itphoneevent-get_event
     */
    get_Event() {
        result := ComCall(8, this, "int*", &pEvent := 0, "HRESULT")
        return pEvent
    }

    /**
     * The get_ButtonState method returns a PHONE_BUTTON_STATE value specifying the state to which the button has transitioned. This information is available only when the ITPhoneEvent::get_Event method returns PE_BUTTON.
     * @returns {Integer} Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-phone_button_state">PHONE_BUTTON_STATE</a> descriptor of the button's current state.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itphoneevent-get_buttonstate
     */
    get_ButtonState() {
        result := ComCall(9, this, "int*", &pState := 0, "HRESULT")
        return pState
    }

    /**
     * The get_HookSwitchState method returns a PHONE_HOOK_SWITCH_STATE value specifying the state to which the hookswitch has transitioned. This information is available only when the ITPhoneEvent::get_Event method returns PE_HOOKSWITCH.
     * @returns {Integer} Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-phone_hook_switch_state">PHONE_HOOK_SWITCH_STATE</a> descriptor of the current hookswitch state.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itphoneevent-get_hookswitchstate
     */
    get_HookSwitchState() {
        result := ComCall(10, this, "int*", &pState := 0, "HRESULT")
        return pState
    }

    /**
     * The get_HookSwitchDevice method returns a PHONE_HOOK_SWITCH_DEVICE value specifying the hookswitch device that changed state. This information is available only when the ITPhoneEvent::get_Event method returns PE_HOOKSWITCH.
     * @returns {Integer} Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-phone_hook_switch_device">PHONE_HOOK_SWITCH_DEVICE</a> descriptor of the type of device that has changed hookswitch state.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itphoneevent-get_hookswitchdevice
     */
    get_HookSwitchDevice() {
        result := ComCall(11, this, "int*", &pDevice := 0, "HRESULT")
        return pDevice
    }

    /**
     * The get_RingMode method returns a long value specifying the ring mode to which the phone has transitioned. This information is available only when the ITPhoneEvent::get_Event method returns PE_RINGMODE.
     * @returns {Integer} Ring mode.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itphoneevent-get_ringmode
     */
    get_RingMode() {
        result := ComCall(12, this, "int*", &plRingMode := 0, "HRESULT")
        return plRingMode
    }

    /**
     * The get_ButtonLampId method returns a long value indicating which button or lamp triggered the event. This information is available only when ITPhoneEvent::get_Event returns PE_LAMPMODE or PE_BUTTON.
     * @returns {Integer} Button or lamp ID.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itphoneevent-get_buttonlampid
     */
    get_ButtonLampId() {
        result := ComCall(13, this, "int*", &plButtonLampId := 0, "HRESULT")
        return plButtonLampId
    }

    /**
     * The get_NumberGathered method returns a BSTR value specifying the phone number that was gathered. This information is available only when the ITPhoneEvent::get_Event method returns PE_NUMBERGATHERED.
     * @returns {BSTR} Phone number that was gathered. The <b>BSTR</b> is allocated using 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysallocstring">SysAllocString</a> and should be deallocated by the client.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itphoneevent-get_numbergathered
     */
    get_NumberGathered() {
        ppNumber := BSTR()
        result := ComCall(14, this, "ptr", ppNumber, "HRESULT")
        return ppNumber
    }

    /**
     * The get_Call method returns a pointer to the ITCallInfo interface for the call object involved in the event.
     * @returns {ITCallInfo} Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcallinfo">ITCallInfo</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itphoneevent-get_call
     */
    get_Call() {
        result := ComCall(15, this, "ptr*", &ppCallInfo := 0, "HRESULT")
        return ITCallInfo(ppCallInfo)
    }
}
