#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<Column>} Column 
     * @returns {HRESULT} 
     */
    Item(Index, Column) {
        result := ComCall(7, this, "int", Index, "ptr*", Column, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Count 
     * @returns {HRESULT} 
     */
    get_Count(Count) {
        CountMarshal := Count is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, CountMarshal, Count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} retval 
     * @returns {HRESULT} 
     */
    get__NewEnum(retval) {
        result := ComCall(9, this, "ptr*", retval, "HRESULT")
        return result
    }
}
