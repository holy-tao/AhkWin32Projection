#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class ITransactionLastResourceAsync extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITransactionLastResourceAsync
     * @type {Guid}
     */
    static IID => Guid("{c82bd532-5b30-11d3-8a91-00c04f79eb6d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DelegateCommit", "ForgetRequest"]

    /**
     * 
     * @param {Integer} grfRM 
     * @returns {HRESULT} 
     */
    DelegateCommit(grfRM) {
        result := ComCall(3, this, "uint", grfRM, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOID>} pNewUOW 
     * @returns {HRESULT} 
     */
    ForgetRequest(pNewUOW) {
        result := ComCall(4, this, "ptr", pNewUOW, "HRESULT")
        return result
    }
}
