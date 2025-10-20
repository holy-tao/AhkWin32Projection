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
     * 
     * @param {Pointer<Int32>} SoftwareRadioState 
     * @returns {HRESULT} 
     */
    get_SoftwareRadioState(SoftwareRadioState) {
        result := ComCall(3, this, "int*", SoftwareRadioState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} HardwareRadioState 
     * @returns {HRESULT} 
     */
    get_HardwareRadioState(HardwareRadioState) {
        result := ComCall(4, this, "int*", HardwareRadioState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} radioState 
     * @param {Pointer<UInt32>} requestID 
     * @returns {HRESULT} 
     */
    SetSoftwareRadioState(radioState, requestID) {
        result := ComCall(5, this, "int", radioState, "uint*", requestID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
