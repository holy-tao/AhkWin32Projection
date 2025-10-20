#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Enumerates the undo units on the undo or redo stack.
 * @see https://docs.microsoft.com/windows/win32/api//ocidl/nn-ocidl-ienumoleundounits
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IEnumOleUndoUnits extends IUnknown{
    /**
     * The interface identifier for IEnumOleUndoUnits
     * @type {Guid}
     */
    static IID => Guid("{b3e7c340-ef97-11ce-9bc9-00aa00608e01}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} cElt 
     * @param {Pointer<IOleUndoUnit>} rgElt 
     * @param {Pointer<UInt32>} pcEltFetched 
     * @returns {HRESULT} 
     */
    Next(cElt, rgElt, pcEltFetched) {
        result := ComCall(3, this, "uint", cElt, "ptr", rgElt, "uint*", pcEltFetched, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cElt 
     * @returns {HRESULT} 
     */
    Skip(cElt) {
        result := ComCall(4, this, "uint", cElt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumOleUndoUnits>} ppEnum 
     * @returns {HRESULT} 
     */
    Clone(ppEnum) {
        result := ComCall(6, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
