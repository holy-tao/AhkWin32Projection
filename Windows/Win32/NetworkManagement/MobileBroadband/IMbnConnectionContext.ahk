#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Manages connection contexts.
 * @remarks
 * 
 * An application can acquire this interface by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbninterface">IMbnInterface</a>.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nn-mbnapi-imbnconnectioncontext
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class IMbnConnectionContext extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMbnConnectionContext
     * @type {Guid}
     */
    static IID => Guid("{dcbbbab6-200b-4bbb-aaee-338e368af6fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetProvisionedContexts", "SetProvisionedContext"]

    /**
     * Gets a list of connection contexts.
     * @returns {Pointer<SAFEARRAY>} A list of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ns-mbnapi-mbn_context">MBN_CONTEXT</a> values that represent connection contexts stored in the device. On error, this array is <b>NULL</b>. When successful, the calling application must free the allocated memory by calling <a href="https://docs.microsoft.com/windows/win32/api/oleauto/nf-oleauto-safearraydestroy">SafeArrayDestroy</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnconnectioncontext-getprovisionedcontexts
     */
    GetProvisionedContexts() {
        result := ComCall(3, this, "ptr*", &provisionedContexts := 0, "HRESULT")
        return provisionedContexts
    }

    /**
     * Adds or updates a provisioned context.
     * @param {MBN_CONTEXT} provisionedContexts An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ns-mbnapi-mbn_context">MBN_CONTEXT</a> structure that specifies the provisioned context to be stored in the device or SIM.
     * @param {PWSTR} providerID A string that represents the network provider ID for which the provisioned context should be stored.  The device should return the added provisioned context in response to any subsequent query when a SIM with this home provider ID is in the device.
     * @returns {Integer} A request ID set by the Mobile Broadband service to identify this asynchronous request.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnconnectioncontext-setprovisionedcontext
     */
    SetProvisionedContext(provisionedContexts, providerID) {
        providerID := providerID is String ? StrPtr(providerID) : providerID

        result := ComCall(4, this, "ptr", provisionedContexts, "ptr", providerID, "uint*", &requestID := 0, "HRESULT")
        return requestID
    }
}
