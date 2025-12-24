#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DistributedTransactionCoordinator\ITransaction.ahk
#Include ..\DistributedTransactionCoordinator\ITransactionVoterBallotAsync2.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides a way for a COM+ transaction context to work with a non-DTC transaction.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-itransactionproxy
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class ITransactionProxy extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITransactionProxy
     * @type {Guid}
     */
    static IID => Guid("{02558374-df2e-4dae-bd6b-1d5c994f9bdc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Commit", "Abort", "Promote", "CreateVoter", "GetIsolationLevel", "GetIdentifier", "IsReusable"]

    /**
     * Commits the transaction.
     * @param {Guid} guid A GUID that identifies the transaction to commit.
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
     * <dt><b>CONTEXT_E_ABORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The transaction was aborted.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-itransactionproxy-commit
     */
    Commit(guid) {
        result := ComCall(3, this, "ptr", guid, "HRESULT")
        return result
    }

    /**
     * Aborts the transaction.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-itransactionproxy-abort
     */
    Abort() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Promotes a non-DTC transaction to a DTC transaction.
     * @returns {ITransaction} An implementation of <b>ITransaction</b> that represents the DTC transaction.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-itransactionproxy-promote
     */
    Promote() {
        result := ComCall(5, this, "ptr*", &pTransaction := 0, "HRESULT")
        return ITransaction(pTransaction)
    }

    /**
     * Provides a ballot so that a COM+ transaction context can vote on the transaction.
     * @param {ITransactionVoterNotifyAsync2} pTxAsync An implementation of <b>ITransactionVoterNotifyAsync2</b> that notifies the voter of a vote request.
     * @returns {ITransactionVoterBallotAsync2} An implementation of <b>ITransactionVoterBallotAsync2</b> that allows the voter to approve or veto the non-DTC transaction.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-itransactionproxy-createvoter
     */
    CreateVoter(pTxAsync) {
        result := ComCall(6, this, "ptr", pTxAsync, "ptr*", &ppBallot := 0, "HRESULT")
        return ITransactionVoterBallotAsync2(ppBallot)
    }

    /**
     * Retrieves the isolation level of the non-DTC transaction.
     * @param {Pointer<Integer>} __MIDL__ITransactionProxy0000 A pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ms679234(v=vs.85)">ISOLATIONLEVEL</a> value that specifies the isolation level of the non-DTC transaction.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-itransactionproxy-getisolationlevel
     */
    GetIsolationLevel(__MIDL__ITransactionProxy0000) {
        __MIDL__ITransactionProxy0000Marshal := __MIDL__ITransactionProxy0000 is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, __MIDL__ITransactionProxy0000Marshal, __MIDL__ITransactionProxy0000, "HRESULT")
        return result
    }

    /**
     * Retrieves the identifier of the non-DTC transaction.
     * @param {Pointer<Guid>} pbstrIdentifier The GUID that identifies the non-DTC transaction.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-itransactionproxy-getidentifier
     */
    GetIdentifier(pbstrIdentifier) {
        result := ComCall(8, this, "ptr", pbstrIdentifier, "HRESULT")
        return result
    }

    /**
     * Indicates whether the non-DTC transaction context can be reused for multiple transactions.
     * @param {Pointer<BOOL>} pfIsReusable <b>TRUE</b> if the non-DTC transaction context can be reused for multiple transactions; otherwise, <b>FALSE</b>.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-itransactionproxy-isreusable
     */
    IsReusable(pfIsReusable) {
        pfIsReusableMarshal := pfIsReusable is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, pfIsReusableMarshal, pfIsReusable, "HRESULT")
        return result
    }
}
