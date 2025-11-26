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
     * Updates the home provider for a multi-carrier device.
     * @param {Pointer<MBN_PROVIDER2>} homeProvider An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ns-mbnapi-mbn_provider2">MBN_PROVIDER2</a> structure that contains the home provider.
     * 
     * <div class="alert"><b>Note</b>  <p class="note">The  <b>SignalStrength</b> and <b>SignalError</b> members must be 0.
     * 
     * </div>
     * <div> </div>
     * @returns {Integer} A pointer to the request ID set by the operating system for this request.  The asynchronous response from <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnmulticarrierevents-onsethomeprovidercomplete">OnSetHomeProviderComplete</a> will contain this same <i>requestID</i>.
     * 
     * Pointer to the request ID set by the operating system for this request. The asynchronous response will contain this same requestID.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnmulticarrier-sethomeprovider
     */
    SetHomeProvider(homeProvider) {
        result := ComCall(3, this, "ptr", homeProvider, "uint*", &requestID := 0, "HRESULT")
        return requestID
    }

    /**
     * Gets the list of subscribed providers visible in the current area for a multi-carrier device minus the current registered provider.
     * @returns {Pointer<SAFEARRAY>} Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ns-mbnapi-mbn_provider2">MBN_PROVIDER2</a> structures that contain the list of preferred providers. If this method returns any value other than <b>S_OK</b>, <i>preferredMultiCarrierProviders</i> is <b>NULL</b>. When <b>GetPreferredProviders</b> returns <b>S_OK</b>, the calling application must free the allocated memory by calling <a href="https://docs.microsoft.com/windows/desktop/api/oleauto/nf-oleauto-safearraydestroy">SafeArrayDestroy</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnmulticarrier-getpreferredproviders
     */
    GetPreferredProviders() {
        result := ComCall(4, this, "ptr*", &preferredMulticarrierProviders := 0, "HRESULT")
        return preferredMulticarrierProviders
    }

    /**
     * Gets the list of visible providers in the current area for a multi-carrier device minus preferred and registered providers.
     * @param {Pointer<Integer>} age A pointer to the time, in seconds, since the last refresh of the visible provider list for the device.
     * @returns {Pointer<SAFEARRAY>} Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ns-mbnapi-mbn_provider2">MBN_PROVIDER2</a> structures that contains the list of providers for the interface. If this method returns any value other than <b>S_OK</b>, <i>visibleProviders</i> is <b>NULL</b>. When <b>GetVisibleProviders</b> returns <b>S_OK</b>, the calling application must free the allocated memory by calling <a href="https://docs.microsoft.com/windows/desktop/api/oleauto/nf-oleauto-safearraydestroy">SafeArrayDestroy</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnmulticarrier-getvisibleproviders
     */
    GetVisibleProviders(age) {
        ageMarshal := age is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, ageMarshal, age, "ptr*", &visibleProviders := 0, "HRESULT")
        return visibleProviders
    }

    /**
     * Gets the list of supported cellular classes for a multi-carrier device.
     * @returns {Pointer<SAFEARRAY>} Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_cellular_class">MBN_CELLULAR_CLASS</a> enumerations that contain the list of supported cellular classes. If this method returns any value other than <b>S_OK</b>, <i>cellularClass</i> is <b>NULL</b>. When <b>GetSupportedCellularClasses</b> returns <b>S_OK</b>, the calling application must free the allocated memory by calling <a href="https://docs.microsoft.com/windows/desktop/api/oleauto/nf-oleauto-safearraydestroy">SafeArrayDestroy</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnmulticarrier-getsupportedcellularclasses
     */
    GetSupportedCellularClasses() {
        result := ComCall(6, this, "ptr*", &cellularClasses := 0, "HRESULT")
        return cellularClasses
    }

    /**
     * Gets the current cellular classes for a multi-carrier device.
     * @returns {Integer} <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_cellular_class">MBN_CELLULAR_CLASS</a>
     * 
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_cellular_class">MBN_CELLULAR_CLASS</a> enumeration that specifies the current cellular class. If this method returns any value other than <b>S_OK</b>, <i>currentCellularClass</i> is <b>NULL</b>. When <b>GetCurrentCellularClass</b> returns <b>S_OK</b>, the calling application must free the allocated memory by calling <a href="https://docs.microsoft.com/windows/desktop/api/oleauto/nf-oleauto-safearraydestroy">SafeArrayDestroy</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnmulticarrier-getcurrentcellularclass
     */
    GetCurrentCellularClass() {
        result := ComCall(7, this, "int*", &currentCellularClass := 0, "HRESULT")
        return currentCellularClass
    }

    /**
     * Scans the network to get a list of visible providers for a multi-carrier device.
     * @returns {Integer} Pointer to the request ID set by the operating system for this request.  The asynchronous response from <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnmulticarrierevents-onscannetworkcomplete">OnScanNetworkComplete</a> will contain this same <i>requestID</i>.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnmulticarrier-scannetwork
     */
    ScanNetwork() {
        result := ComCall(8, this, "uint*", &requestID := 0, "HRESULT")
        return requestID
    }
}
