#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DistributedTransactionCoordinator\ITransactionOptions.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ITransactionJoin extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITransactionJoin
     * @type {Guid}
     */
    static IID => Guid("{0c733a5e-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetOptionsObject", "JoinTransaction"]

    /**
     * 
     * @returns {ITransactionOptions} 
     */
    GetOptionsObject() {
        result := ComCall(3, this, "ptr*", &ppOptions := 0, "HRESULT")
        return ITransactionOptions(ppOptions)
    }

    /**
     * 
     * @param {IUnknown} punkTransactionCoord 
     * @param {Integer} isoLevel 
     * @param {Integer} isoFlags 
     * @param {ITransactionOptions} pOtherOptions 
     * @returns {HRESULT} 
     */
    JoinTransaction(punkTransactionCoord, isoLevel, isoFlags, pOtherOptions) {
        result := ComCall(4, this, "ptr", punkTransactionCoord, "int", isoLevel, "uint", isoFlags, "ptr", pOtherOptions, "HRESULT")
        return result
    }
}
