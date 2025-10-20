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
     * 
     * @param {Pointer<Guid>} guid 
     * @returns {HRESULT} 
     */
    Commit(guid) {
        result := ComCall(3, this, "ptr", guid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Abort() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITransaction>} pTransaction 
     * @returns {HRESULT} 
     */
    Promote(pTransaction) {
        result := ComCall(5, this, "ptr", pTransaction, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITransactionVoterNotifyAsync2>} pTxAsync 
     * @param {Pointer<ITransactionVoterBallotAsync2>} ppBallot 
     * @returns {HRESULT} 
     */
    CreateVoter(pTxAsync, ppBallot) {
        result := ComCall(6, this, "ptr", pTxAsync, "ptr", ppBallot, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} __MIDL__ITransactionProxy0000 
     * @returns {HRESULT} 
     */
    GetIsolationLevel(__MIDL__ITransactionProxy0000) {
        result := ComCall(7, this, "int*", __MIDL__ITransactionProxy0000, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pbstrIdentifier 
     * @returns {HRESULT} 
     */
    GetIdentifier(pbstrIdentifier) {
        result := ComCall(8, this, "ptr", pbstrIdentifier, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfIsReusable 
     * @returns {HRESULT} 
     */
    IsReusable(pfIsReusable) {
        result := ComCall(9, this, "ptr", pfIsReusable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
