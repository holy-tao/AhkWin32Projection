#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * Enables you to compose the work of multiple COM+ objects in a single transaction and explicitly commit or abort the transaction.
 * @remarks
 * Using the transaction context object to control a transaction limits the reuse of the business logic driving the transaction and should be used sparingly.
 * 
 * You obtain a reference to the <b>ITransactionContext</b> interface by creating a transaction context object with the appropriate call, as in the following example.
 * 
 * 
 * ``` syntax
 * hr = CoCreateInstance(
 *        CLSID_TransactionContext, 
 *        NULL, 
 *        CLSCTX_INPROC,
 *        IID_ITransactionContext, 
 *        (void**)&amp;m_pTransactionContext);
 * 
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-itransactioncontext
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct ITransactionContext extends IDispatch {
    /**
     * The interface identifier for ITransactionContext
     * @type {Guid}
     */
    static IID := Guid("{7999fc21-d3c6-11cf-acab-00a024a55aef}")

    /**
     * The class identifier for TransactionContext
     * @type {Guid}
     */
    static CLSID := Guid("{7999fc25-d3c6-11cf-acab-00a024a55aef}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITransactionContext interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        CreateInstance : IntPtr
        Commit         : IntPtr
        Abort          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITransactionContext.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a COM object that can execute within the scope of the transaction that was initiated by the transaction context object. (ITransactionContext.CreateInstance)
     * @remarks
     * If the Microsoft Distributed Transaction Coordinator is not running and the object is transactional, the object is successfully created. However, method calls to that object will fail with CONTEXT_E_TMNOTAVAILABLE. Objects cannot recover from this condition and should be released.
     * @param {BSTR} pszProgId A reference to the ProgID of the type of object to be instantiated.
     * @returns {VARIANT} A reference to the new object.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-itransactioncontext-createinstance
     */
    CreateInstance(pszProgId) {
        pszProgId := pszProgId is String ? BSTR.Alloc(pszProgId).Value : pszProgId

        pObject := VARIANT()
        result := ComCall(7, this, BSTR, pszProgId, VARIANT.Ptr, pObject, "HRESULT")
        return pObject
    }

    /**
     * Attempts to commit the work of all COM objects participating in the current transaction. The transaction ends on return from this method. (ITransactionContext.Commit)
     * @remarks
     * Calling <b>Commit</b> attempts to commit a transaction. However, the transaction aborts under the following conditions:
     * 
     * <ul>
     * <li>If a participating object returns from a method after calling <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-iobjectcontext-setabort">SetAbort</a>.</li>
     * <li>If an object calls <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-iobjectcontext-disablecommit">DisableCommit</a> and returns without calling <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-iobjectcontext-enablecommit">EnableCommit</a> or <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-iobjectcontext-setcomplete">SetComplete</a>. 
     * </li>
     * <li>If an error causes the Microsoft Distributed Transaction Coordinator (DTC) to abort.
     * </li>
     * </ul>
     * When the method returns, whether the transaction commits or aborts, the transaction ends.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, and E_UNEXPECTED, as well as the following values.
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
     * The transaction was committed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="https://docs.microsoft.com/windows/desktop/cossdk/transactioncontext">TransactionContext</a> object is not running under a COM+ process, possibly indicating a corrupted registry entry for the <b>TransactionContext</b> component.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CONTEXT_E_ABORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The transaction was aborted.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-itransactioncontext-commit
     */
    Commit() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * Aborts the work of all COM objects participating in the current transaction. The transaction ends on return from this method. (ITransactionContext.Abort)
     * @remarks
     * Calling <b>Abort</b> ends the transaction on return of the method and automatically deactivates all participating objects. Each resource manager enlisted in the transaction rolls back the operations performed on behalf of those objects.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, and E_UNEXPECTED, as well as the following values.
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
     * The transaction was aborted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="https://docs.microsoft.com/windows/desktop/cossdk/transactioncontext">TransactionContext</a> object is not running under a COM+ process, possibly indicating a corrupted registry entry for the <b>TransactionContext</b> component.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-itransactioncontext-abort
     */
    Abort() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITransactionContext.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateInstance := CallbackCreate(GetMethod(implObj, "CreateInstance"), flags, 3)
        this.vtbl.Commit := CallbackCreate(GetMethod(implObj, "Commit"), flags, 1)
        this.vtbl.Abort := CallbackCreate(GetMethod(implObj, "Abort"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateInstance)
        CallbackFree(this.vtbl.Commit)
        CallbackFree(this.vtbl.Abort)
    }
}
