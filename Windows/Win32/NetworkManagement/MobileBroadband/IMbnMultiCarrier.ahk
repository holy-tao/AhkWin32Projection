#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This interface exposes the multi-carrier functionality of a capable Mobile Broadband device.
 * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nn-mbnapi-imbnmulticarrier
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class IMbnMultiCarrier extends IUnknown{
    /**
     * The interface identifier for IMbnMultiCarrier
     * @type {Guid}
     */
    static IID => Guid("{dcbbbab6-2020-4bbb-aaee-338e368af6fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<MBN_PROVIDER2>} homeProvider 
     * @param {Pointer<UInt32>} requestID 
     * @returns {HRESULT} 
     */
    SetHomeProvider(homeProvider, requestID) {
        result := ComCall(3, this, "ptr", homeProvider, "uint*", requestID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} preferredMulticarrierProviders 
     * @returns {HRESULT} 
     */
    GetPreferredProviders(preferredMulticarrierProviders) {
        result := ComCall(4, this, "ptr", preferredMulticarrierProviders, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} age 
     * @param {Pointer<SAFEARRAY>} visibleProviders 
     * @returns {HRESULT} 
     */
    GetVisibleProviders(age, visibleProviders) {
        result := ComCall(5, this, "uint*", age, "ptr", visibleProviders, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} cellularClasses 
     * @returns {HRESULT} 
     */
    GetSupportedCellularClasses(cellularClasses) {
        result := ComCall(6, this, "ptr", cellularClasses, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} currentCellularClass 
     * @returns {HRESULT} 
     */
    GetCurrentCellularClass(currentCellularClass) {
        result := ComCall(7, this, "int*", currentCellularClass, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} requestID 
     * @returns {HRESULT} 
     */
    ScanNetwork(requestID) {
        result := ComCall(8, this, "uint*", requestID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
