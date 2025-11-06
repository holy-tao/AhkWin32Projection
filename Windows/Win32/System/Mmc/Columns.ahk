#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\Column.ahk
#Include ..\Com\IUnknown.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class Columns extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for Columns
     * @type {Guid}
     */
    static IID => Guid("{383d4d97-fc44-478b-b139-6323dc48611c}")

    /**
     * The class identifier for Columns
     * @type {Guid}
     */
    static CLSID => Guid("{383d4d97-fc44-478b-b139-6323dc48611c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Item", "get_Count", "get__NewEnum"]

    /**
     * 
     * @param {Integer} Index 
     * @returns {Column} 
     */
    Item(Index) {
        result := ComCall(7, this, "int", Index, "ptr*", &Column := 0, "HRESULT")
        return Column(Column)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Count() {
        result := ComCall(8, this, "int*", &Count := 0, "HRESULT")
        return Count
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get__NewEnum() {
        result := ComCall(9, this, "ptr*", &retval := 0, "HRESULT")
        return IUnknown(retval)
    }
}
