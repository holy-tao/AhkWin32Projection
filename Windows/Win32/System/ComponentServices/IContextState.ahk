#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Controls object deactivation and transaction voting by manipulating context state flags.
 * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nn-comsvcs-icontextstate
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IContextState extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContextState
     * @type {Guid}
     */
    static IID => Guid("{3c05e54b-a42a-11d2-afc4-00c04f8ee1c4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetDeactivateOnReturn", "GetDeactivateOnReturn", "SetMyTransactionVote", "GetMyTransactionVote"]

    /**
     * Sets the done flag, which controls whether the object deactivates on method return.
     * @remarks
     * When set to true, the done flag causes the object to deactivate when the method call returns. When set to false, the object remains active after the method call returns.
     * The default value of the done flag is false.
     * @param {VARIANT_BOOL} bDeactivate The done flag.
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
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CONTEXT_E_NOJIT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/cossdk/com--just-in-time-activation">Just-in-Time Activation</a> is not available to this context.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-icontextstate-setdeactivateonreturn
     */
    SetDeactivateOnReturn(bDeactivate) {
        result := ComCall(3, this, "short", bDeactivate, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the value of the done flag.
     * @remarks
     * When <i>pbDeactivate</i> is <b>FALSE</b> for the root object of a transaction, the object does not deactivate and the transaction does not terminate unless the client releases its reference to the object or until the done flag is set to <b>TRUE</b>.
     * @param {Pointer<VARIANT_BOOL>} pbDeactivate The done flag.
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
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CONTEXT_E_NOJIT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/cossdk/com--just-in-time-activation">Just-in-Time Activation</a> is not available to this context.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-icontextstate-getdeactivateonreturn
     */
    GetDeactivateOnReturn(pbDeactivate) {
        pbDeactivateMarshal := pbDeactivate is VarRef ? "short*" : "ptr"

        result := ComCall(4, this, pbDeactivateMarshal, pbDeactivate, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the consistent flag.
     * @remarks
     * COM+ inspects this flag only when deactivating the object, and the flag can be set multiple times within a method call.
     * 
     * The default value of the consistent flag is true.
     * @param {Integer} txVote The consistent flag. For a list of values, see the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ne-comsvcs-transactionvote">TransactionVote</a> enumeration. Set this parameter to TxCommit if the consistent flag is true;set it to TxAbort if the consistent flag is false.
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
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CONTEXT_E_NOJIT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/cossdk/com--just-in-time-activation">Just-in-Time Activation</a> is not available to this context.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-icontextstate-setmytransactionvote
     */
    SetMyTransactionVote(txVote) {
        result := ComCall(5, this, "int", txVote, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the value of the consistent flag.
     * @remarks
     * If the method fails, you may be able to determine that a transaction is not present, based on the <b>HRESULT</b> value. If the method succeeds, it returns a value based on the consistent flag. From this value, you can determine whether the object can be committed or must be aborted. Regardless of the object's state, the object must be participating in a transaction.
     * @param {Pointer<Integer>} ptxVote The consistent flag. For a list of values, see the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ne-comsvcs-transactionvote">TransactionVote</a> enumeration. This parameter is set to TxCommit if the consistent flag is true; it is set to TxAbort if the consistent flag is false.
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
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CONTEXT_E_NOTRANSACTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object is not running in a transaction.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-icontextstate-getmytransactionvote
     */
    GetMyTransactionVote(ptxVote) {
        ptxVoteMarshal := ptxVote is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, ptxVoteMarshal, ptxVote, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
