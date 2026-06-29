#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\PHONE_BUTTON_STATE.ahk" { PHONE_BUTTON_STATE }
#Import ".\PHONE_HOOK_SWITCH_STATE.ahk" { PHONE_HOOK_SWITCH_STATE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\PHONE_EVENT.ahk" { PHONE_EVENT }
#Import ".\ITPhone.ahk" { ITPhone }
#Import ".\ITCallInfo.ahk" { ITCallInfo }
#Import ".\PHONE_HOOK_SWITCH_DEVICE.ahk" { PHONE_HOOK_SWITCH_DEVICE }

/**
 * The ITPhoneEvent interface contains methods that retrieve the description of phone events that have occurred.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nn-tapi3if-itphoneevent
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITPhoneEvent extends IDispatch {
    /**
     * The interface identifier for ITPhoneEvent
     * @type {Guid}
     */
    static IID := Guid("{8f942dd8-64ed-4aaf-a77d-b23db0837ead}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITPhoneEvent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Phone            : IntPtr
        get_Event            : IntPtr
        get_ButtonState      : IntPtr
        get_HookSwitchState  : IntPtr
        get_HookSwitchDevice : IntPtr
        get_RingMode         : IntPtr
        get_ButtonLampId     : IntPtr
        get_NumberGathered   : IntPtr
        get_Call             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITPhoneEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {ITPhone} 
     */
    Phone {
        get => this.get_Phone()
    }

    /**
     * @type {PHONE_EVENT} 
     */
    Event {
        get => this.get_Event()
    }

    /**
     * @type {PHONE_BUTTON_STATE} 
     */
    ButtonState {
        get => this.get_ButtonState()
    }

    /**
     * @type {PHONE_HOOK_SWITCH_STATE} 
     */
    HookSwitchState {
        get => this.get_HookSwitchState()
    }

    /**
     * @type {PHONE_HOOK_SWITCH_DEVICE} 
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
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itphone">ITPhone</a> interface returned by <b>ITPhoneEvent::get_Phone</b>. The application must call <b>Release</b> on the 
     * <b>ITPhone</b> interface to free resources associated with it.
     * @returns {ITPhone} Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itphone">ITPhone</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphoneevent-get_phone
     */
    get_Phone() {
        result := ComCall(7, this, "ptr*", &ppPhone := 0, "HRESULT")
        return ITPhone(ppPhone)
    }

    /**
     * The get_Event method returns a PHONE_EVENT value specifying the type of phone event that occurred.
     * @returns {PHONE_EVENT} The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-phone_event">PHONE_EVENT</a> descriptor of the event.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphoneevent-get_event
     */
    get_Event() {
        result := ComCall(8, this, "int*", &pEvent := 0, "HRESULT")
        return pEvent
    }

    /**
     * The get_ButtonState method returns a PHONE_BUTTON_STATE value specifying the state to which the button has transitioned. This information is available only when the ITPhoneEvent::get_Event method returns PE_BUTTON.
     * @remarks
     * This method is available because some buttons do not support the PBS_DOWN button state, but instead momentarily report PBS_PRESSED. Additionally, the application can miss the button press on phones that do support PBS_DOWN if the button is pressed only for a short time and the call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-itphone-get_buttonstate">ITPhone::get_ButtonState</a> method does not execute quickly enough.
     * @returns {PHONE_BUTTON_STATE} Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-phone_button_state">PHONE_BUTTON_STATE</a> descriptor of the button's current state.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphoneevent-get_buttonstate
     */
    get_ButtonState() {
        result := ComCall(9, this, "int*", &pState := 0, "HRESULT")
        return pState
    }

    /**
     * The get_HookSwitchState method returns a PHONE_HOOK_SWITCH_STATE value specifying the state to which the hookswitch has transitioned. This information is available only when the ITPhoneEvent::get_Event method returns PE_HOOKSWITCH.
     * @returns {PHONE_HOOK_SWITCH_STATE} Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-phone_hook_switch_state">PHONE_HOOK_SWITCH_STATE</a> descriptor of the current hookswitch state.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphoneevent-get_hookswitchstate
     */
    get_HookSwitchState() {
        result := ComCall(10, this, "int*", &pState := 0, "HRESULT")
        return pState
    }

    /**
     * The get_HookSwitchDevice method returns a PHONE_HOOK_SWITCH_DEVICE value specifying the hookswitch device that changed state. This information is available only when the ITPhoneEvent::get_Event method returns PE_HOOKSWITCH.
     * @returns {PHONE_HOOK_SWITCH_DEVICE} Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-phone_hook_switch_device">PHONE_HOOK_SWITCH_DEVICE</a> descriptor of the type of device that has changed hookswitch state.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphoneevent-get_hookswitchdevice
     */
    get_HookSwitchDevice() {
        result := ComCall(11, this, "int*", &pDevice := 0, "HRESULT")
        return pDevice
    }

    /**
     * The get_RingMode method returns a long value specifying the ring mode to which the phone has transitioned. This information is available only when the ITPhoneEvent::get_Event method returns PE_RINGMODE.
     * @returns {Integer} Ring mode.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphoneevent-get_ringmode
     */
    get_RingMode() {
        result := ComCall(12, this, "int*", &plRingMode := 0, "HRESULT")
        return plRingMode
    }

    /**
     * The get_ButtonLampId method returns a long value indicating which button or lamp triggered the event. This information is available only when ITPhoneEvent::get_Event returns PE_LAMPMODE or PE_BUTTON.
     * @returns {Integer} Button or lamp ID.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphoneevent-get_buttonlampid
     */
    get_ButtonLampId() {
        result := ComCall(13, this, "int*", &plButtonLampId := 0, "HRESULT")
        return plButtonLampId
    }

    /**
     * The get_NumberGathered method returns a BSTR value specifying the phone number that was gathered. This information is available only when the ITPhoneEvent::get_Event method returns PE_NUMBERGATHERED.
     * @returns {BSTR} Phone number that was gathered. The <b>BSTR</b> is allocated using 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysallocstring">SysAllocString</a> and should be deallocated by the client.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphoneevent-get_numbergathered
     */
    get_NumberGathered() {
        ppNumber := BSTR.Owned()
        result := ComCall(14, this, BSTR.Ptr, ppNumber, "HRESULT")
        return ppNumber
    }

    /**
     * The get_Call method returns a pointer to the ITCallInfo interface for the call object involved in the event.
     * @returns {ITCallInfo} Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcallinfo">ITCallInfo</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphoneevent-get_call
     */
    get_Call() {
        result := ComCall(15, this, "ptr*", &ppCallInfo := 0, "HRESULT")
        return ITCallInfo(ppCallInfo)
    }

    Query(iid) {
        if (ITPhoneEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Phone := CallbackCreate(GetMethod(implObj, "get_Phone"), flags, 2)
        this.vtbl.get_Event := CallbackCreate(GetMethod(implObj, "get_Event"), flags, 2)
        this.vtbl.get_ButtonState := CallbackCreate(GetMethod(implObj, "get_ButtonState"), flags, 2)
        this.vtbl.get_HookSwitchState := CallbackCreate(GetMethod(implObj, "get_HookSwitchState"), flags, 2)
        this.vtbl.get_HookSwitchDevice := CallbackCreate(GetMethod(implObj, "get_HookSwitchDevice"), flags, 2)
        this.vtbl.get_RingMode := CallbackCreate(GetMethod(implObj, "get_RingMode"), flags, 2)
        this.vtbl.get_ButtonLampId := CallbackCreate(GetMethod(implObj, "get_ButtonLampId"), flags, 2)
        this.vtbl.get_NumberGathered := CallbackCreate(GetMethod(implObj, "get_NumberGathered"), flags, 2)
        this.vtbl.get_Call := CallbackCreate(GetMethod(implObj, "get_Call"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Phone)
        CallbackFree(this.vtbl.get_Event)
        CallbackFree(this.vtbl.get_ButtonState)
        CallbackFree(this.vtbl.get_HookSwitchState)
        CallbackFree(this.vtbl.get_HookSwitchDevice)
        CallbackFree(this.vtbl.get_RingMode)
        CallbackFree(this.vtbl.get_ButtonLampId)
        CallbackFree(this.vtbl.get_NumberGathered)
        CallbackFree(this.vtbl.get_Call)
    }
}
