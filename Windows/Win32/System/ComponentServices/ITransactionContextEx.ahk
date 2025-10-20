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
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} pObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-itransactioncontextex-createinstance
     */
    CreateInstance(rclsid, riid, pObject) {
        result := ComCall(3, this, "ptr", rclsid, "ptr", riid, "ptr*", pObject, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-itransactioncontextex-commit
     */
    Commit() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-itransactioncontextex-abort
     */
    Abort() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
