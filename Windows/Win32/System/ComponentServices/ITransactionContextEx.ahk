#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides basic methods for a generic transactional object that begins a transaction. By calling the methods of this interface, you can compose the work of multiple COM+ objects in a single transaction and explicitly commit or abort the transaction.
 * @remarks
 * 
 * Using the transaction context object to control a transaction limits the reuse of the business logic driving the transaction and should be used sparingly.
 * 
 * You obtain a reference to the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-itransactioncontext">ITransactionContext</a> interface by creating a transaction context object with the appropriate call, as in the following example.
 * 
 * <pre class="syntax" xml:space="preserve"><code>hr = CoCreateInstance(
 *        CLSID_TransactionContextEx, 
 *        NULL, 
 *        CLSCTX_INPROC,
 *        IID_ITransactionContextEx, 
 *        (void**)&amp;m_pTransactionContext);
 * </code></pre>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-itransactioncontextex
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class ITransactionContextEx extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITransactionContextEx
     * @type {Guid}
     */
    static IID => Guid("{7999fc22-d3c6-11cf-acab-00a024a55aef}")

    /**
     * The class identifier for TransactionContextEx
     * @type {Guid}
     */
    static CLSID => Guid("{5cb66670-d3d4-11cf-acab-00a024a55aef}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInstance", "Commit", "Abort"]

    /**
     * Creates a COM object that can execute within the scope of the transaction that was initiated by the transaction context object.
     * @param {Pointer<Guid>} rclsid A reference to the CLSID of the type of object to be instantiated.
     * @param {Pointer<Guid>} riid A reference to the interface ID of the interface through which you will communicate with the new object.
     * @returns {Pointer<Void>} A reference to a new object of the type specified by the <i>rclsid</i> parameter, through the interface specified by the <i>riid</i> parameter.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-itransactioncontextex-createinstance
     */
    CreateInstance(rclsid, riid) {
        result := ComCall(3, this, "ptr", rclsid, "ptr", riid, "ptr*", &pObject := 0, "HRESULT")
        return pObject
    }

    /**
     * Attempts to commit the work of all COM objects participating in the current transaction. The transaction ends on return from this method.
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
     * The <a href="/windows/desktop/cossdk/transactioncontextex">TransactionContextEx</a> object is not running under a COM+ process, possibly indicating a corrupted registry entry for the <b>TransactionContextEx</b> component.
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
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-itransactioncontextex-commit
     */
    Commit() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Aborts the work of all COM objects participating in the current transaction. The transaction ends on return from this method.
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
     * The <a href="/windows/desktop/cossdk/transactioncontextex">TransactionContextEx</a> object is not running under a COM+ process, possibly indicating a corrupted registry entry for the <b>TransactionContextEx</b> component.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-itransactioncontextex-abort
     */
    Abort() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
