#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class ITransactionDispenser extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITransactionDispenser
     * @type {Guid}
     */
    static IID => Guid("{3a6ad9e1-23b9-11cf-ad60-00aa00a74ccd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetOptionsObject", "BeginTransaction"]

    /**
     * 
     * @param {Pointer<ITransactionOptions>} ppOptions 
     * @returns {HRESULT} 
     */
    GetOptionsObject(ppOptions) {
        result := ComCall(3, this, "ptr*", ppOptions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} punkOuter 
     * @param {Integer} isoLevel 
     * @param {Integer} isoFlags 
     * @param {ITransactionOptions} pOptions 
     * @param {Pointer<ITransaction>} ppTransaction 
     * @returns {HRESULT} 
     */
    BeginTransaction(punkOuter, isoLevel, isoFlags, pOptions, ppTransaction) {
        result := ComCall(4, this, "ptr", punkOuter, "int", isoLevel, "uint", isoFlags, "ptr", pOptions, "ptr*", ppTransaction, "HRESULT")
        return result
    }
}
