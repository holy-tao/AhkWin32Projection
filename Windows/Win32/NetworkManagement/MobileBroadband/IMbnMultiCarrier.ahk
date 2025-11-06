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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnmulticarrier-sethomeprovider
     */
    SetHomeProvider(homeProvider) {
        result := ComCall(3, this, "ptr", homeProvider, "uint*", &requestID := 0, "HRESULT")
        return requestID
    }

    /**
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnmulticarrier-getpreferredproviders
     */
    GetPreferredProviders() {
        result := ComCall(4, this, "ptr*", &preferredMulticarrierProviders := 0, "HRESULT")
        return preferredMulticarrierProviders
    }

    /**
     * 
     * @param {Pointer<Integer>} age 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnmulticarrier-getvisibleproviders
     */
    GetVisibleProviders(age) {
        ageMarshal := age is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, ageMarshal, age, "ptr*", &visibleProviders := 0, "HRESULT")
        return visibleProviders
    }

    /**
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnmulticarrier-getsupportedcellularclasses
     */
    GetSupportedCellularClasses() {
        result := ComCall(6, this, "ptr*", &cellularClasses := 0, "HRESULT")
        return cellularClasses
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnmulticarrier-getcurrentcellularclass
     */
    GetCurrentCellularClass() {
        result := ComCall(7, this, "int*", &currentCellularClass := 0, "HRESULT")
        return currentCellularClass
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnmulticarrier-scannetwork
     */
    ScanNetwork() {
        result := ComCall(8, this, "uint*", &requestID := 0, "HRESULT")
        return requestID
    }
}
