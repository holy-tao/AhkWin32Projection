#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ITransactionJoin extends IUnknown{
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
     * 
     * @param {Pointer<ITransactionOptions>} ppOptions 
     * @returns {HRESULT} 
     */
    GetOptionsObject(ppOptions) {
        result := ComCall(3, this, "ptr", ppOptions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} punkTransactionCoord 
     * @param {Integer} isoLevel 
     * @param {Integer} isoFlags 
     * @param {Pointer<ITransactionOptions>} pOtherOptions 
     * @returns {HRESULT} 
     */
    JoinTransaction(punkTransactionCoord, isoLevel, isoFlags, pOtherOptions) {
        result := ComCall(4, this, "ptr", punkTransactionCoord, "int", isoLevel, "uint", isoFlags, "ptr", pOtherOptions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
