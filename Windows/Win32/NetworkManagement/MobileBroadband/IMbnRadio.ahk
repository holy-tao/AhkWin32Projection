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
     * 
     * @param {Pointer<Integer>} SoftwareRadioState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnradio-get_softwareradiostate
     */
    get_SoftwareRadioState(SoftwareRadioState) {
        SoftwareRadioStateMarshal := SoftwareRadioState is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, SoftwareRadioStateMarshal, SoftwareRadioState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} HardwareRadioState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnradio-get_hardwareradiostate
     */
    get_HardwareRadioState(HardwareRadioState) {
        HardwareRadioStateMarshal := HardwareRadioState is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, HardwareRadioStateMarshal, HardwareRadioState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} radioState 
     * @param {Pointer<Integer>} requestID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnradio-setsoftwareradiostate
     */
    SetSoftwareRadioState(radioState, requestID) {
        requestIDMarshal := requestID is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "int", radioState, requestIDMarshal, requestID, "HRESULT")
        return result
    }
}
