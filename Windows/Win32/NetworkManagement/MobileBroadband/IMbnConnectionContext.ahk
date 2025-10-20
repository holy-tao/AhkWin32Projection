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
     * 
     * @param {Pointer<SAFEARRAY>} provisionedContexts 
     * @returns {HRESULT} 
     */
    GetProvisionedContexts(provisionedContexts) {
        result := ComCall(3, this, "ptr", provisionedContexts, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {MBN_CONTEXT} provisionedContexts 
     * @param {PWSTR} providerID 
     * @param {Pointer<UInt32>} requestID 
     * @returns {HRESULT} 
     */
    SetProvisionedContext(provisionedContexts, providerID, requestID) {
        providerID := providerID is String ? StrPtr(providerID) : providerID

        result := ComCall(4, this, "ptr", provisionedContexts, "ptr", providerID, "uint*", requestID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
