#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Variant\VARIANT.ahk
#Include ..\Com\IDispatch.ahk

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
 * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nn-comsvcs-itransactioncontext
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class ITransactionContext extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITransactionContext
     * @type {Guid}
     */
    static IID => Guid("{7999fc21-d3c6-11cf-acab-00a024a55aef}")

    /**
     * The class identifier for TransactionContext
     * @type {Guid}
     */
    static CLSID => Guid("{7999fc25-d3c6-11cf-acab-00a024a55aef}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInstance", "Commit", "Abort"]

    /**
     * Creates a COM object that can execute within the scope of the transaction that was initiated by the transaction context object. (ITransactionContext.CreateInstance)
     * @remarks
     * If the Microsoft Distributed Transaction Coordinator is not running and the object is transactional, the object is successfully created. However, method calls to that object will fail with CONTEXT_E_TMNOTAVAILABLE. Objects cannot recover from this condition and should be released.
     * @param {BSTR} pszProgId A reference to the ProgID of the type of object to be instantiated.
     * @returns {VARIANT} A reference to the new object.
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-itransactioncontext-createinstance
     */
    CreateInstance(pszProgId) {
        if(pszProgId is String) {
            pin := BSTR.Alloc(pszProgId)
            pszProgId := pin.Value
        }

        pObject := VARIANT()
        result := ComCall(7, this, "ptr", pszProgId, "ptr", pObject, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-itransactioncontext-commit
     */
    Commit() {
        result := ComCall(8, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-itransactioncontext-abort
     */
    Abort() {
        result := ComCall(9, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
