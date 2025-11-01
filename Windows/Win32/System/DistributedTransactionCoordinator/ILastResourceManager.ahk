#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class ILastResourceManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILastResourceManager
     * @type {Guid}
     */
    static IID => Guid("{4d964ad4-5b33-11d3-8a91-00c04f79eb6d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TransactionCommitted", "RecoveryDone"]

    /**
     * 
     * @param {Pointer<Integer>} pPrepInfo 
     * @param {Integer} cbPrepInfo 
     * @returns {HRESULT} 
     */
    TransactionCommitted(pPrepInfo, cbPrepInfo) {
        pPrepInfoMarshal := pPrepInfo is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, pPrepInfoMarshal, pPrepInfo, "uint", cbPrepInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RecoveryDone() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
