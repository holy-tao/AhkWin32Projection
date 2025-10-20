#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class ITransactionResourceAsync extends IUnknown{
    /**
     * The interface identifier for ITransactionResourceAsync
     * @type {Guid}
     */
    static IID => Guid("{69e971f0-23ce-11cf-ad60-00aa00a74ccd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {BOOL} fRetaining 
     * @param {Integer} grfRM 
     * @param {BOOL} fWantMoniker 
     * @param {BOOL} fSinglePhase 
     * @returns {HRESULT} 
     */
    PrepareRequest(fRetaining, grfRM, fWantMoniker, fSinglePhase) {
        result := ComCall(3, this, "int", fRetaining, "uint", grfRM, "int", fWantMoniker, "int", fSinglePhase, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} grfRM 
     * @param {Pointer<BOID>} pNewUOW 
     * @returns {HRESULT} 
     */
    CommitRequest(grfRM, pNewUOW) {
        result := ComCall(4, this, "uint", grfRM, "ptr", pNewUOW, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOID>} pboidReason 
     * @param {BOOL} fRetaining 
     * @param {Pointer<BOID>} pNewUOW 
     * @returns {HRESULT} 
     */
    AbortRequest(pboidReason, fRetaining, pNewUOW) {
        result := ComCall(5, this, "ptr", pboidReason, "int", fRetaining, "ptr", pNewUOW, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    TMDown() {
        result := ComCall(6, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
