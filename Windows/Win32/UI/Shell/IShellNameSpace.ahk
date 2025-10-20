#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IShellFavoritesNameSpace.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellNameSpace extends IShellFavoritesNameSpace{
    /**
     * The interface identifier for IShellNameSpace
     * @type {Guid}
     */
    static IID => Guid("{e572d3c9-37be-4ae2-825d-d521763e3108}")

    /**
     * The class identifier for ShellNameSpace
     * @type {Guid}
     */
    static CLSID => Guid("{55136805-b2de-11d1-b9f2-00a0c98bc547}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 20

    /**
     * 
     * @param {Pointer<Int32>} pgrfEnumFlags 
     * @returns {HRESULT} 
     */
    get_EnumOptions(pgrfEnumFlags) {
        result := ComCall(20, this, "int*", pgrfEnumFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lVal 
     * @returns {HRESULT} 
     */
    put_EnumOptions(lVal) {
        result := ComCall(21, this, "int", lVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} pItem 
     * @returns {HRESULT} 
     */
    get_SelectedItem(pItem) {
        result := ComCall(22, this, "ptr", pItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} pItem 
     * @returns {HRESULT} 
     */
    put_SelectedItem(pItem) {
        result := ComCall(23, this, "ptr", pItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvar 
     * @returns {HRESULT} 
     */
    get_Root(pvar) {
        result := ComCall(24, this, "ptr", pvar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} var 
     * @returns {HRESULT} 
     */
    put_Root(var) {
        result := ComCall(25, this, "ptr", var, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} piDepth 
     * @returns {HRESULT} 
     */
    get_Depth(piDepth) {
        result := ComCall(26, this, "int*", piDepth, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iDepth 
     * @returns {HRESULT} 
     */
    put_Depth(iDepth) {
        result := ComCall(27, this, "int", iDepth, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} puMode 
     * @returns {HRESULT} 
     */
    get_Mode(puMode) {
        result := ComCall(28, this, "uint*", puMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uMode 
     * @returns {HRESULT} 
     */
    put_Mode(uMode) {
        result := ComCall(29, this, "uint", uMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwFlags 
     * @returns {HRESULT} 
     */
    get_Flags(pdwFlags) {
        result := ComCall(30, this, "uint*", pdwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    put_Flags(dwFlags) {
        result := ComCall(31, this, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    put_TVFlags(dwFlags) {
        result := ComCall(32, this, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} dwFlags 
     * @returns {HRESULT} 
     */
    get_TVFlags(dwFlags) {
        result := ComCall(33, this, "uint*", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} bstrColumns 
     * @returns {HRESULT} 
     */
    get_Columns(bstrColumns) {
        result := ComCall(34, this, "ptr", bstrColumns, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrColumns 
     * @returns {HRESULT} 
     */
    put_Columns(bstrColumns) {
        bstrColumns := bstrColumns is String ? BSTR.Alloc(bstrColumns).Value : bstrColumns

        result := ComCall(35, this, "ptr", bstrColumns, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} piTypes 
     * @returns {HRESULT} 
     */
    get_CountViewTypes(piTypes) {
        result := ComCall(36, this, "int*", piTypes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iType 
     * @returns {HRESULT} 
     */
    SetViewType(iType) {
        result := ComCall(37, this, "int", iType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppid 
     * @returns {HRESULT} 
     */
    SelectedItems(ppid) {
        result := ComCall(38, this, "ptr", ppid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} var 
     * @param {Integer} iDepth 
     * @returns {HRESULT} 
     */
    Expand(var, iDepth) {
        result := ComCall(39, this, "ptr", var, "int", iDepth, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    UnselectAll() {
        result := ComCall(40, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
