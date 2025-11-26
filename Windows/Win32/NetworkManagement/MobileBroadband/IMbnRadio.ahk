#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IMbnRadio interface is used to query and update the radio state of Mobile Broadband devices.
 * @remarks
 * 
 * An application can acquire this interface by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbninterface">IMbnInterface</a>.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nn-mbnapi-imbnradio
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
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnradio-get_softwareradiostate
     */
    get_SoftwareRadioState() {
        result := ComCall(3, this, "int*", &SoftwareRadioState := 0, "HRESULT")
        return SoftwareRadioState
    }

    /**
     * The hardware radio state of a Mobile Broadband device.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnradio-get_hardwareradiostate
     */
    get_HardwareRadioState() {
        result := ComCall(4, this, "int*", &HardwareRadioState := 0, "HRESULT")
        return HardwareRadioState
    }

    /**
     * Sets the software radio state of a Mobile Broadband device.
     * @param {Integer} radioState A <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_radio">MBN_RADIO</a> value that specifies the new software radio state.
     * @returns {Integer} A pointer to a request ID assigned by the Mobile Broadband service to identify this request.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnradio-setsoftwareradiostate
     */
    SetSoftwareRadioState(radioState) {
        result := ComCall(5, this, "int", radioState, "uint*", &requestID := 0, "HRESULT")
        return requestID
    }
}
