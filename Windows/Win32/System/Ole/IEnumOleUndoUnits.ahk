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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next", "Skip", "Reset", "Clone"]

    /**
     * 
     * @param {Integer} cElt 
     * @param {Pointer<IOleUndoUnit>} rgElt 
     * @param {Pointer<Integer>} pcEltFetched 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ienumoleundounits-next
     */
    Next(cElt, rgElt, pcEltFetched) {
        result := ComCall(3, this, "uint", cElt, "ptr*", rgElt, "uint*", pcEltFetched, "int")
        return result
    }

    /**
     * 
     * @param {Integer} cElt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ienumoleundounits-skip
     */
    Skip(cElt) {
        result := ComCall(4, this, "uint", cElt, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ienumoleundounits-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumOleUndoUnits>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ienumoleundounits-clone
     */
    Clone(ppEnum) {
        result := ComCall(6, this, "ptr*", ppEnum, "HRESULT")
        return result
    }
}
