#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This interface is a notification interface used to handle asynchronous IMbnMultiCarrier method calls.
 * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nn-mbnapi-imbnmulticarrierevents
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class IMbnMultiCarrierEvents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMbnMultiCarrierEvents
     * @type {Guid}
     */
    static IID => Guid("{dcdddab6-2021-4bbb-aaee-338e368af6fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnSetHomeProviderComplete", "OnCurrentCellularClassChange", "OnPreferredProvidersChange", "OnScanNetworkComplete", "OnInterfaceCapabilityChange"]

    /**
     * 
     * @param {IMbnMultiCarrier} mbnInterface 
     * @param {Integer} requestID 
     * @param {HRESULT} status 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnmulticarrierevents-onsethomeprovidercomplete
     */
    OnSetHomeProviderComplete(mbnInterface, requestID, status) {
        result := ComCall(3, this, "ptr", mbnInterface, "uint", requestID, "int", status, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMbnMultiCarrier} mbnInterface 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnmulticarrierevents-oncurrentcellularclasschange
     */
    OnCurrentCellularClassChange(mbnInterface) {
        result := ComCall(4, this, "ptr", mbnInterface, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMbnMultiCarrier} mbnInterface 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnmulticarrierevents-onpreferredproviderschange
     */
    OnPreferredProvidersChange(mbnInterface) {
        result := ComCall(5, this, "ptr", mbnInterface, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMbnMultiCarrier} mbnInterface 
     * @param {Integer} requestID 
     * @param {HRESULT} status 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnmulticarrierevents-onscannetworkcomplete
     */
    OnScanNetworkComplete(mbnInterface, requestID, status) {
        result := ComCall(6, this, "ptr", mbnInterface, "uint", requestID, "int", status, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMbnMultiCarrier} mbnInterface 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnmulticarrierevents-oninterfacecapabilitychange
     */
    OnInterfaceCapabilityChange(mbnInterface) {
        result := ComCall(7, this, "ptr", mbnInterface, "HRESULT")
        return result
    }
}
