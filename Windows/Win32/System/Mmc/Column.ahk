#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class Column extends IDispatch{
    /**
     * The interface identifier for Column
     * @type {Guid}
     */
    static IID => Guid("{fd1c5f63-2b16-4d06-9ab3-f45350b940ab}")

    /**
     * The class identifier for Column
     * @type {Guid}
     */
    static CLSID => Guid("{fd1c5f63-2b16-4d06-9ab3-f45350b940ab}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<BSTR>} Name 
     * @returns {HRESULT} 
     */
    Name(Name) {
        result := ComCall(7, this, "ptr", Name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} Width 
     * @returns {HRESULT} 
     */
    get_Width(Width) {
        result := ComCall(8, this, "int*", Width, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Width 
     * @returns {HRESULT} 
     */
    put_Width(Width) {
        result := ComCall(9, this, "int", Width, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} DisplayPosition 
     * @returns {HRESULT} 
     */
    get_DisplayPosition(DisplayPosition) {
        result := ComCall(10, this, "int*", DisplayPosition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {HRESULT} 
     */
    put_DisplayPosition(Index) {
        result := ComCall(11, this, "int", Index, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} Hidden 
     * @returns {HRESULT} 
     */
    get_Hidden(Hidden) {
        result := ComCall(12, this, "ptr", Hidden, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} Hidden 
     * @returns {HRESULT} 
     */
    put_Hidden(Hidden) {
        result := ComCall(13, this, "int", Hidden, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} SortOrder 
     * @returns {HRESULT} 
     */
    SetAsSortColumn(SortOrder) {
        result := ComCall(14, this, "int", SortOrder, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} IsSortColumn 
     * @returns {HRESULT} 
     */
    IsSortColumn(IsSortColumn) {
        result := ComCall(15, this, "ptr", IsSortColumn, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
