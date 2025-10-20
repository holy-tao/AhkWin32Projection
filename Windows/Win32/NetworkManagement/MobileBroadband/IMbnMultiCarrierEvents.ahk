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
     * 
     * @param {Pointer<IMbnMultiCarrier>} mbnInterface 
     * @param {Integer} requestID 
     * @param {HRESULT} status 
     * @returns {HRESULT} 
     */
    OnSetHomeProviderComplete(mbnInterface, requestID, status) {
        result := ComCall(3, this, "ptr", mbnInterface, "uint", requestID, "int", status, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMbnMultiCarrier>} mbnInterface 
     * @returns {HRESULT} 
     */
    OnCurrentCellularClassChange(mbnInterface) {
        result := ComCall(4, this, "ptr", mbnInterface, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMbnMultiCarrier>} mbnInterface 
     * @returns {HRESULT} 
     */
    OnPreferredProvidersChange(mbnInterface) {
        result := ComCall(5, this, "ptr", mbnInterface, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMbnMultiCarrier>} mbnInterface 
     * @param {Integer} requestID 
     * @param {HRESULT} status 
     * @returns {HRESULT} 
     */
    OnScanNetworkComplete(mbnInterface, requestID, status) {
        result := ComCall(6, this, "ptr", mbnInterface, "uint", requestID, "int", status, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMbnMultiCarrier>} mbnInterface 
     * @returns {HRESULT} 
     */
    OnInterfaceCapabilityChange(mbnInterface) {
        result := ComCall(7, this, "ptr", mbnInterface, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
