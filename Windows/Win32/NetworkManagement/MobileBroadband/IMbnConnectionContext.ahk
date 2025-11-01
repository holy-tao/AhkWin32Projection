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
     * 
     * @param {Pointer<Pointer<SAFEARRAY>>} provisionedContexts 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnconnectioncontext-getprovisionedcontexts
     */
    GetProvisionedContexts(provisionedContexts) {
        result := ComCall(3, this, "ptr*", provisionedContexts, "HRESULT")
        return result
    }

    /**
     * 
     * @param {MBN_CONTEXT} provisionedContexts 
     * @param {PWSTR} providerID 
     * @param {Pointer<Integer>} requestID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnconnectioncontext-setprovisionedcontext
     */
    SetProvisionedContext(provisionedContexts, providerID, requestID) {
        providerID := providerID is String ? StrPtr(providerID) : providerID

        requestIDMarshal := requestID is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", provisionedContexts, "ptr", providerID, requestIDMarshal, requestID, "HRESULT")
        return result
    }
}
