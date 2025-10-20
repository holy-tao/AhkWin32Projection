#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class Columns extends IDispatch{
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
     * 
     * @param {Integer} Index 
     * @param {Pointer<Column>} Column 
     * @returns {HRESULT} 
     */
    Item(Index, Column) {
        result := ComCall(7, this, "int", Index, "ptr", Column, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} Count 
     * @returns {HRESULT} 
     */
    get_Count(Count) {
        result := ComCall(8, this, "int*", Count, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} retval 
     * @returns {HRESULT} 
     */
    get__NewEnum(retval) {
        result := ComCall(9, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
