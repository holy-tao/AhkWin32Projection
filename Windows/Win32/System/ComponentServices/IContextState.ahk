#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Controls object deactivation and transaction voting by manipulating context state flags.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-icontextstate
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
     * 
     * @param {VARIANT_BOOL} bDeactivate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icontextstate-setdeactivateonreturn
     */
    SetDeactivateOnReturn(bDeactivate) {
        result := ComCall(3, this, "short", bDeactivate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbDeactivate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icontextstate-getdeactivateonreturn
     */
    GetDeactivateOnReturn(pbDeactivate) {
        pbDeactivateMarshal := pbDeactivate is VarRef ? "short*" : "ptr"

        result := ComCall(4, this, pbDeactivateMarshal, pbDeactivate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} txVote 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icontextstate-setmytransactionvote
     */
    SetMyTransactionVote(txVote) {
        result := ComCall(5, this, "int", txVote, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} ptxVote 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icontextstate-getmytransactionvote
     */
    GetMyTransactionVote(ptxVote) {
        ptxVoteMarshal := ptxVote is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, ptxVoteMarshal, ptxVote, "HRESULT")
        return result
    }
}
