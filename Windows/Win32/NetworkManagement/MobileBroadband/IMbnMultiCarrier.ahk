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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetHomeProvider", "GetPreferredProviders", "GetVisibleProviders", "GetSupportedCellularClasses", "GetCurrentCellularClass", "ScanNetwork"]

    /**
     * 
     * @param {Pointer<MBN_PROVIDER2>} homeProvider 
     * @param {Pointer<Integer>} requestID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnmulticarrier-sethomeprovider
     */
    SetHomeProvider(homeProvider, requestID) {
        requestIDMarshal := requestID is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", homeProvider, requestIDMarshal, requestID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<SAFEARRAY>>} preferredMulticarrierProviders 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnmulticarrier-getpreferredproviders
     */
    GetPreferredProviders(preferredMulticarrierProviders) {
        preferredMulticarrierProvidersMarshal := preferredMulticarrierProviders is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, preferredMulticarrierProvidersMarshal, preferredMulticarrierProviders, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} age 
     * @param {Pointer<Pointer<SAFEARRAY>>} visibleProviders 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnmulticarrier-getvisibleproviders
     */
    GetVisibleProviders(age, visibleProviders) {
        ageMarshal := age is VarRef ? "uint*" : "ptr"
        visibleProvidersMarshal := visibleProviders is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, ageMarshal, age, visibleProvidersMarshal, visibleProviders, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<SAFEARRAY>>} cellularClasses 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnmulticarrier-getsupportedcellularclasses
     */
    GetSupportedCellularClasses(cellularClasses) {
        cellularClassesMarshal := cellularClasses is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, cellularClassesMarshal, cellularClasses, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} currentCellularClass 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnmulticarrier-getcurrentcellularclass
     */
    GetCurrentCellularClass(currentCellularClass) {
        currentCellularClassMarshal := currentCellularClass is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, currentCellularClassMarshal, currentCellularClass, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} requestID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnmulticarrier-scannetwork
     */
    ScanNetwork(requestID) {
        requestIDMarshal := requestID is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, requestIDMarshal, requestID, "HRESULT")
        return result
    }
}
