#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IMbnRadio interface is used to query and update the radio state of Mobile Broadband devices.
 * @remarks
 * An application can acquire this interface by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbninterface">IMbnInterface</a>.
 * @see https://learn.microsoft.com/windows/win32/api//content/mbnapi/nn-mbnapi-imbnradio
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class IMbnRadio extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMbnRadio
     * @type {Guid}
     */
    static IID => Guid("{dccccab6-201f-4bbb-aaee-338e368af6fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SoftwareRadioState", "get_HardwareRadioState", "SetSoftwareRadioState"]

    /**
     * @type {Integer} 
     */
    SoftwareRadioState {
        get => this.get_SoftwareRadioState()
    }

    /**
     * @type {Integer} 
     */
    HardwareRadioState {
        get => this.get_HardwareRadioState()
    }

    /**
     * The software radio state of a Mobile Broadband device.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/mbnapi/nf-mbnapi-imbnradio-get_softwareradiostate
     */
    get_SoftwareRadioState() {
        result := ComCall(3, this, "int*", &SoftwareRadioState := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SoftwareRadioState
    }

    /**
     * The hardware radio state of a Mobile Broadband device.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/mbnapi/nf-mbnapi-imbnradio-get_hardwareradiostate
     */
    get_HardwareRadioState() {
        result := ComCall(4, this, "int*", &HardwareRadioState := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @param {Integer} radioState A <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_radio">MBN_RADIO</a> value that specifies the new software radio state.
     * @returns {Integer} A pointer to a request ID assigned by the Mobile Broadband service to identify this request.
     * @see https://learn.microsoft.com/windows/win32/api//content/mbnapi/nf-mbnapi-imbnradio-setsoftwareradiostate
     */
    SetSoftwareRadioState(radioState) {
        result := ComCall(5, this, "int", radioState, "uint*", &requestID := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return requestID
    }
}
