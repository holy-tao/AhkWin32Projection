#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DistributedTransactionCoordinator\ITransaction.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ITransactionLocal extends ITransaction{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITransactionLocal
     * @type {Guid}
     */
    static IID => Guid("{0c733a5f-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetOptionsObject", "StartTransaction"]

    /**
     * 
     * @param {Pointer<ITransactionOptions>} ppOptions 
     * @returns {HRESULT} 
     */
    GetOptionsObject(ppOptions) {
        result := ComCall(6, this, "ptr*", ppOptions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} isoLevel 
     * @param {Integer} isoFlags 
     * @param {ITransactionOptions} pOtherOptions 
     * @param {Pointer<Integer>} pulTransactionLevel 
     * @returns {HRESULT} 
     */
    StartTransaction(isoLevel, isoFlags, pOtherOptions, pulTransactionLevel) {
        result := ComCall(7, this, "int", isoLevel, "uint", isoFlags, "ptr", pOtherOptions, "uint*", pulTransactionLevel, "HRESULT")
        return result
    }
}
