#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides basic methods for a generic transactional object that begins a transaction. By calling the methods of this interface, you can compose the work of multiple COM+ objects in a single transaction and explicitly commit or abort the transaction.
 * @remarks
 * Using the transaction context object to control a transaction limits the reuse of the business logic driving the transaction and should be used sparingly.
 * 
 * You obtain a reference to the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-itransactioncontext">ITransactionContext</a> interface by creating a transaction context object with the appropriate call, as in the following example.
 * 
 * 
 * ``` syntax
 * hr = CoCreateInstance(
 *        CLSID_TransactionContextEx, 
 *        NULL, 
 *        CLSCTX_INPROC,
 *        IID_ITransactionContextEx, 
 *        (void**)&amp;m_pTransactionContext);
 * 
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-itransactioncontextex
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct ITransactionContextEx extends IUnknown {
    /**
     * The interface identifier for ITransactionContextEx
     * @type {Guid}
     */
    static IID := Guid("{7999fc22-d3c6-11cf-acab-00a024a55aef}")

    /**
     * The class identifier for TransactionContextEx
     * @type {Guid}
     */
    static CLSID := Guid("{5cb66670-d3d4-11cf-acab-00a024a55aef}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITransactionContextEx interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateInstance : IntPtr
        Commit         : IntPtr
        Abort          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITransactionContextEx.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a COM object that can execute within the scope of the transaction that was initiated by the transaction context object. (ITransactionContextEx.CreateInstance)
     * @remarks
     * If the Microsoft Distributed Transaction Coordinator is not running and the object is transactional, the object is successfully created. However, method calls to that object will fail with CONTEXT_E_TMNOTAVAILABLE. Objects cannot recover from this condition and should be released.
     * @param {Pointer<Guid>} rclsid A reference to the CLSID of the type of object to be instantiated.
     * @param {Pointer<Guid>} riid A reference to the interface ID of the interface through which you will communicate with the new object.
     * @returns {Pointer<Void>} A reference to a new object of the type specified by the <i>rclsid</i> parameter, through the interface specified by the <i>riid</i> parameter.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-itransactioncontextex-createinstance
     */
    CreateInstance(rclsid, riid) {
        result := ComCall(3, this, Guid.Ptr, rclsid, Guid.Ptr, riid, "ptr*", &pObject := 0, "HRESULT")
        return pObject
    }

    /**
     * Attempts to commit the work of all COM objects participating in the current transaction. The transaction ends on return from this method. (ITransactionContextEx.Commit)
     * @remarks
     * Calling <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-itransactioncontext-commit">Commit</a> attempts to commit a transaction. However, the transaction aborts under the following conditions:
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
     * The <a href="https://docs.microsoft.com/windows/desktop/cossdk/transactioncontextex">TransactionContextEx</a> object is not running under a COM+ process, possibly indicating a corrupted registry entry for the <b>TransactionContextEx</b> component.
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
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-itransactioncontextex-commit
     */
    Commit() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Aborts the work of all COM objects participating in the current transaction. The transaction ends on return from this method. (ITransactionContextEx.Abort)
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
     * The <a href="https://docs.microsoft.com/windows/desktop/cossdk/transactioncontextex">TransactionContextEx</a> object is not running under a COM+ process, possibly indicating a corrupted registry entry for the <b>TransactionContextEx</b> component.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-itransactioncontextex-abort
     */
    Abort() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITransactionContextEx.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateInstance := CallbackCreate(GetMethod(implObj, "CreateInstance"), flags, 4)
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
