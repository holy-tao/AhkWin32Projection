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
     * 
     * @param {VARIANT_BOOL} bDeactivate 
     * @returns {HRESULT} 
     */
    SetDeactivateOnReturn(bDeactivate) {
        result := ComCall(3, this, "short", bDeactivate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbDeactivate 
     * @returns {HRESULT} 
     */
    GetDeactivateOnReturn(pbDeactivate) {
        result := ComCall(4, this, "ptr", pbDeactivate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} txVote 
     * @returns {HRESULT} 
     */
    SetMyTransactionVote(txVote) {
        result := ComCall(5, this, "int", txVote, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} ptxVote 
     * @returns {HRESULT} 
     */
    GetMyTransactionVote(ptxVote) {
        result := ComCall(6, this, "int*", ptxVote, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
