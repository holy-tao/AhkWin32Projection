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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_EnumOptions", "put_EnumOptions", "get_SelectedItem", "put_SelectedItem", "get_Root", "put_Root", "get_Depth", "put_Depth", "get_Mode", "put_Mode", "get_Flags", "put_Flags", "put_TVFlags", "get_TVFlags", "get_Columns", "put_Columns", "get_CountViewTypes", "SetViewType", "SelectedItems", "Expand", "UnselectAll"]

    /**
     * 
     * @param {Pointer<Integer>} pgrfEnumFlags 
     * @returns {HRESULT} 
     */
    get_EnumOptions(pgrfEnumFlags) {
        pgrfEnumFlagsMarshal := pgrfEnumFlags is VarRef ? "int*" : "ptr"

        result := ComCall(20, this, pgrfEnumFlagsMarshal, pgrfEnumFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lVal 
     * @returns {HRESULT} 
     */
    put_EnumOptions(lVal) {
        result := ComCall(21, this, "int", lVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} pItem 
     * @returns {HRESULT} 
     */
    get_SelectedItem(pItem) {
        result := ComCall(22, this, "ptr*", pItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDispatch} pItem 
     * @returns {HRESULT} 
     */
    put_SelectedItem(pItem) {
        result := ComCall(23, this, "ptr", pItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvar 
     * @returns {HRESULT} 
     */
    get_Root(pvar) {
        result := ComCall(24, this, "ptr", pvar, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} var 
     * @returns {HRESULT} 
     */
    put_Root(var) {
        result := ComCall(25, this, "ptr", var, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} piDepth 
     * @returns {HRESULT} 
     */
    get_Depth(piDepth) {
        piDepthMarshal := piDepth is VarRef ? "int*" : "ptr"

        result := ComCall(26, this, piDepthMarshal, piDepth, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iDepth 
     * @returns {HRESULT} 
     */
    put_Depth(iDepth) {
        result := ComCall(27, this, "int", iDepth, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} puMode 
     * @returns {HRESULT} 
     */
    get_Mode(puMode) {
        puModeMarshal := puMode is VarRef ? "uint*" : "ptr"

        result := ComCall(28, this, puModeMarshal, puMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uMode 
     * @returns {HRESULT} 
     */
    put_Mode(uMode) {
        result := ComCall(29, this, "uint", uMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwFlags 
     * @returns {HRESULT} 
     */
    get_Flags(pdwFlags) {
        pdwFlagsMarshal := pdwFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(30, this, pdwFlagsMarshal, pdwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    put_Flags(dwFlags) {
        result := ComCall(31, this, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    put_TVFlags(dwFlags) {
        result := ComCall(32, this, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} dwFlags 
     * @returns {HRESULT} 
     */
    get_TVFlags(dwFlags) {
        dwFlagsMarshal := dwFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(33, this, dwFlagsMarshal, dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} bstrColumns 
     * @returns {HRESULT} 
     */
    get_Columns(bstrColumns) {
        result := ComCall(34, this, "ptr", bstrColumns, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrColumns 
     * @returns {HRESULT} 
     */
    put_Columns(bstrColumns) {
        bstrColumns := bstrColumns is String ? BSTR.Alloc(bstrColumns).Value : bstrColumns

        result := ComCall(35, this, "ptr", bstrColumns, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} piTypes 
     * @returns {HRESULT} 
     */
    get_CountViewTypes(piTypes) {
        piTypesMarshal := piTypes is VarRef ? "int*" : "ptr"

        result := ComCall(36, this, piTypesMarshal, piTypes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iType 
     * @returns {HRESULT} 
     */
    SetViewType(iType) {
        result := ComCall(37, this, "int", iType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppid 
     * @returns {HRESULT} 
     */
    SelectedItems(ppid) {
        result := ComCall(38, this, "ptr*", ppid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} var 
     * @param {Integer} iDepth 
     * @returns {HRESULT} 
     */
    Expand(var, iDepth) {
        result := ComCall(39, this, "ptr", var, "int", iDepth, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    UnselectAll() {
        result := ComCall(40, this, "HRESULT")
        return result
    }
}
