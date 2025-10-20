#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintSchemaOptionCollection extends IDispatch{
    /**
     * The interface identifier for IPrintSchemaOptionCollection
     * @type {Guid}
     */
    static IID => Guid("{baecb0bd-a946-4771-bc30-e8b24f8d45c1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<UInt32>} pulCount 
     * @returns {HRESULT} 
     */
    get_Count(pulCount) {
        result := ComCall(7, this, "uint*", pulCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulIndex 
     * @param {Pointer<IPrintSchemaOption>} ppOption 
     * @returns {HRESULT} 
     */
    GetAt(ulIndex, ppOption) {
        result := ComCall(8, this, "uint", ulIndex, "ptr", ppOption, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppUnk 
     * @returns {HRESULT} 
     */
    get__NewEnum(ppUnk) {
        result := ComCall(9, this, "ptr", ppUnk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
