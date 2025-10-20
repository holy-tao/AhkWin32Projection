#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class ITransactionLastEnlistmentAsync extends IUnknown{
    /**
     * The interface identifier for ITransactionLastEnlistmentAsync
     * @type {Guid}
     */
    static IID => Guid("{c82bd533-5b30-11d3-8a91-00c04f79eb6d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} XactStat 
     * @param {Pointer<BOID>} pboidReason 
     * @returns {HRESULT} 
     */
    TransactionOutcome(XactStat, pboidReason) {
        result := ComCall(3, this, "int", XactStat, "ptr", pboidReason, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
