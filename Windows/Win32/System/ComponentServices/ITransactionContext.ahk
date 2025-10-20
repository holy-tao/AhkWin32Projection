#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Enables you to compose the work of multiple COM+ objects in a single transaction and explicitly commit or abort the transaction.
 * @remarks
 * 
  * Using the transaction context object to control a transaction limits the reuse of the business logic driving the transaction and should be used sparingly.
  * 
  * You obtain a reference to the <b>ITransactionContext</b> interface by creating a transaction context object with the appropriate call, as in the following example.
  * 
  * <pre class="syntax" xml:space="preserve"><code>hr = CoCreateInstance(
  *        CLSID_TransactionContext, 
  *        NULL, 
  *        CLSCTX_INPROC,
  *        IID_ITransactionContext, 
  *        (void**)&amp;m_pTransactionContext);
  * </code></pre>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-itransactioncontext
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class ITransactionContext extends IDispatch{
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
     * 
     * @param {BSTR} pszProgId 
     * @param {Pointer<VARIANT>} pObject 
     * @returns {HRESULT} 
     */
    CreateInstance(pszProgId, pObject) {
        pszProgId := pszProgId is String ? BSTR.Alloc(pszProgId).Value : pszProgId

        result := ComCall(7, this, "ptr", pszProgId, "ptr", pObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Commit() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Abort() {
        result := ComCall(9, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
