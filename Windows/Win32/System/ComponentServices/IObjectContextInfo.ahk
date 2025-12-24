#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Retrieves transaction, activity, and context information on the current context object.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-iobjectcontextinfo
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IObjectContextInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IObjectContextInfo
     * @type {Guid}
     */
    static IID => Guid("{75b52ddb-e8ed-11d1-93ad-00aa00ba3258}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsInTransaction", "GetTransaction", "GetTransactionId", "GetActivityId", "GetContextId"]

    /**
     * Indicates whether the current object is executing in a transaction.
     * @returns {BOOL} If the current object is executing within a transaction, the return value is <b>TRUE</b>. Otherwise, it is <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-iobjectcontextinfo-isintransaction
     */
    IsInTransaction() {
        result := ComCall(3, this, "int")
        return result
    }

    /**
     * Retrieves a reference to the current transaction.
     * @returns {IUnknown} A reference to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface of the transaction that is currently executing. You can then <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> to get the <b>ITransaction</b> interface for the current transaction.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-iobjectcontextinfo-gettransaction
     */
    GetTransaction() {
        result := ComCall(4, this, "ptr*", &pptrans := 0, "HRESULT")
        return IUnknown(pptrans)
    }

    /**
     * Retrieves the identifier of the current transaction.
     * @param {Pointer<Guid>} pGuid A GUID that identifies the current transaction.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, and E_FAIL, as well as the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed succesfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object is not executing in a transaction.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-iobjectcontextinfo-gettransactionid
     */
    GetTransactionId(pGuid) {
        result := ComCall(5, this, "ptr", pGuid, "HRESULT")
        return result
    }

    /**
     * Retrieves the identifier of the current activity.
     * @param {Pointer<Guid>} pGUID A GUID that identifies the current activity.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-iobjectcontextinfo-getactivityid
     */
    GetActivityId(pGUID) {
        result := ComCall(6, this, "ptr", pGUID, "HRESULT")
        return result
    }

    /**
     * Retrieves the identifier of the current context.
     * @param {Pointer<Guid>} pGuid A GUID that identifies the current context.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-iobjectcontextinfo-getcontextid
     */
    GetContextId(pGuid) {
        result := ComCall(7, this, "ptr", pGuid, "HRESULT")
        return result
    }
}
