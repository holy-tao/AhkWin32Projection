#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Retrieves transaction, activity, and context information on the current context object. Using the methods of this interface, you can retrieve relevant information contained within an object context.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-contextinfo
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class ContextInfo extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ContextInfo
     * @type {Guid}
     */
    static IID => Guid("{19a5a02c-0ac8-11d2-b286-00c04f8ef934}")

    /**
     * The class identifier for ContextInfo
     * @type {Guid}
     */
    static CLSID => Guid("{19a5a02c-0ac8-11d2-b286-00c04f8ef934}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsInTransaction", "GetTransaction", "GetTransactionId", "GetActivityId", "GetContextId"]

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbIsInTx 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-contextinfo-isintransaction
     */
    IsInTransaction(pbIsInTx) {
        result := ComCall(7, this, "ptr", pbIsInTx, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppTx 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-contextinfo-gettransaction
     */
    GetTransaction(ppTx) {
        result := ComCall(8, this, "ptr*", ppTx, "HRESULT")
        return result
    }

    /**
     * Obtains the identifier (ID) for the specified transaction.
     * @param {Pointer<BSTR>} pbstrTxId 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is 0 (zero). To get extended error information, call the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * 
     * 
     * The following list identifies the possible error codes:
     * @see https://docs.microsoft.com/windows/win32/api//ktmw32/nf-ktmw32-gettransactionid
     */
    GetTransactionId(pbstrTxId) {
        result := ComCall(9, this, "ptr", pbstrTxId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrActivityId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-contextinfo-getactivityid
     */
    GetActivityId(pbstrActivityId) {
        result := ComCall(10, this, "ptr", pbstrActivityId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrCtxId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-contextinfo-getcontextid
     */
    GetContextId(pbstrCtxId) {
        result := ComCall(11, this, "ptr", pbstrCtxId, "HRESULT")
        return result
    }
}
