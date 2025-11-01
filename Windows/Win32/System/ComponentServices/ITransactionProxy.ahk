#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Guid} guid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-itransactionproxy-commit
     */
    Commit(guid) {
        result := ComCall(3, this, "ptr", guid, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-itransactionproxy-abort
     */
    Abort() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITransaction>} pTransaction 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-itransactionproxy-promote
     */
    Promote(pTransaction) {
        result := ComCall(5, this, "ptr*", pTransaction, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITransactionVoterNotifyAsync2} pTxAsync 
     * @param {Pointer<ITransactionVoterBallotAsync2>} ppBallot 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-itransactionproxy-createvoter
     */
    CreateVoter(pTxAsync, ppBallot) {
        result := ComCall(6, this, "ptr", pTxAsync, "ptr*", ppBallot, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} __MIDL__ITransactionProxy0000 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-itransactionproxy-getisolationlevel
     */
    GetIsolationLevel(__MIDL__ITransactionProxy0000) {
        __MIDL__ITransactionProxy0000Marshal := __MIDL__ITransactionProxy0000 is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, __MIDL__ITransactionProxy0000Marshal, __MIDL__ITransactionProxy0000, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pbstrIdentifier 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-itransactionproxy-getidentifier
     */
    GetIdentifier(pbstrIdentifier) {
        result := ComCall(8, this, "ptr", pbstrIdentifier, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfIsReusable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-itransactionproxy-isreusable
     */
    IsReusable(pfIsReusable) {
        result := ComCall(9, this, "ptr", pfIsReusable, "HRESULT")
        return result
    }
}
