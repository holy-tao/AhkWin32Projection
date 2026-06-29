#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\MBN_RADIO.ahk" { MBN_RADIO }

/**
 * The IMbnRadio interface is used to query and update the radio state of Mobile Broadband devices.
 * @remarks
 * An application can acquire this interface by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbninterface">IMbnInterface</a>.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nn-mbnapi-imbnradio
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
export default struct IMbnRadio extends IUnknown {
    /**
     * The interface identifier for IMbnRadio
     * @type {Guid}
     */
    static IID := Guid("{dccccab6-201f-4bbb-aaee-338e368af6fa}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMbnRadio interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_SoftwareRadioState : IntPtr
        get_HardwareRadioState : IntPtr
        SetSoftwareRadioState  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMbnRadio.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {MBN_RADIO} 
     */
    SoftwareRadioState {
        get => this.get_SoftwareRadioState()
    }

    /**
     * @type {MBN_RADIO} 
     */
    HardwareRadioState {
        get => this.get_HardwareRadioState()
    }

    /**
     * The software radio state of a Mobile Broadband device.
     * @returns {MBN_RADIO} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnradio-get_softwareradiostate
     */
    get_SoftwareRadioState() {
        result := ComCall(3, this, "int*", &SoftwareRadioState := 0, "HRESULT")
        return SoftwareRadioState
    }

    /**
     * The hardware radio state of a Mobile Broadband device.
     * @returns {MBN_RADIO} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnradio-get_hardwareradiostate
     */
    get_HardwareRadioState() {
        result := ComCall(4, this, "int*", &HardwareRadioState := 0, "HRESULT")
        return HardwareRadioState
    }

    /**
     * Sets the software radio state of a Mobile Broadband device.
     * @remarks
     * <b>SetSoftwareRadioState</b> changes the software radio state of the device. This is an asynchronous operation and it will return immediately. On completion, the Mobile Broadband service will call the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnradioevents-onsetsoftwareradiostatecomplete">OnSetSoftwareRadioStateComplete</a> method of the  <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnradioevents">IMbnRadioEvents</a> interface. 
     * 
     * 
     * Disabling the radio for a Mobile Broadband device will result in deactivation of any active connection, network packet detach, and network deregistration. If the radio off operation results in a change in the connection state, packet attach state, or network registration state, then the application will receive a notification of the changes.
     * 
     * 
     * When both software and hardware radio are enabled for a Mobile Broadband device, it will automatically try to register to the network.  Also, some devices may also try to a perform packet attach to the network. Whenever the state changes, the calling application will receive event notifications for network registration and packet attach state changes.
     * 
     * 
     * 
     * A device's radio state can change without a change request from the application.  For instance, if a user turns on the system's hardware radio switch.  The Mobile Broadband service will notify the application about a change in radio state by calling the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnradioevents-onradiostatechange">OnRadioStateChange</a> method of the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnradioevents">IMbnRadioEvents</a> interface.
     * @param {MBN_RADIO} radioState A <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_radio">MBN_RADIO</a> value that specifies the new software radio state.
     * @returns {Integer} A pointer to a request ID assigned by the Mobile Broadband service to identify this request.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnradio-setsoftwareradiostate
     */
    SetSoftwareRadioState(radioState) {
        result := ComCall(5, this, MBN_RADIO, radioState, "uint*", &requestID := 0, "HRESULT")
        return requestID
    }

    Query(iid) {
        if (IMbnRadio.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_SoftwareRadioState := CallbackCreate(GetMethod(implObj, "get_SoftwareRadioState"), flags, 2)
        this.vtbl.get_HardwareRadioState := CallbackCreate(GetMethod(implObj, "get_HardwareRadioState"), flags, 2)
        this.vtbl.SetSoftwareRadioState := CallbackCreate(GetMethod(implObj, "SetSoftwareRadioState"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_SoftwareRadioState)
        CallbackFree(this.vtbl.get_HardwareRadioState)
        CallbackFree(this.vtbl.SetSoftwareRadioState)
    }
}
