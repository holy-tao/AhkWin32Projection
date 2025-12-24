#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk
#Include ..\..\System\Variant\VARIANT.ahk
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
     * @type {Integer} 
     */
    EnumOptions {
        get => this.get_EnumOptions()
        set => this.put_EnumOptions(value)
    }

    /**
     * @type {IDispatch} 
     */
    SelectedItem {
        get => this.get_SelectedItem()
        set => this.put_SelectedItem(value)
    }

    /**
     * @type {VARIANT} 
     */
    Root {
        get => this.get_Root()
        set => this.put_Root(value)
    }

    /**
     * @type {Integer} 
     */
    Depth {
        get => this.get_Depth()
        set => this.put_Depth(value)
    }

    /**
     * @type {Integer} 
     */
    Mode {
        get => this.get_Mode()
        set => this.put_Mode(value)
    }

    /**
     * @type {Integer} 
     */
    Flags {
        get => this.get_Flags()
        set => this.put_Flags(value)
    }

    /**
     * @type {Integer} 
     */
    TVFlags {
        get => this.get_TVFlags()
        set => this.put_TVFlags(value)
    }

    /**
     * @type {BSTR} 
     */
    Columns {
        get => this.get_Columns()
        set => this.put_Columns(value)
    }

    /**
     * @type {Integer} 
     */
    CountViewTypes {
        get => this.get_CountViewTypes()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EnumOptions() {
        result := ComCall(20, this, "int*", &pgrfEnumFlags := 0, "HRESULT")
        return pgrfEnumFlags
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
     * @returns {IDispatch} 
     */
    get_SelectedItem() {
        result := ComCall(22, this, "ptr*", &pItem := 0, "HRESULT")
        return IDispatch(pItem)
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
     * @returns {VARIANT} 
     */
    get_Root() {
        pvar := VARIANT()
        result := ComCall(24, this, "ptr", pvar, "HRESULT")
        return pvar
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
     * @returns {Integer} 
     */
    get_Depth() {
        result := ComCall(26, this, "int*", &piDepth := 0, "HRESULT")
        return piDepth
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
     * @returns {Integer} 
     */
    get_Mode() {
        result := ComCall(28, this, "uint*", &puMode := 0, "HRESULT")
        return puMode
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
     * @returns {Integer} 
     */
    get_Flags() {
        result := ComCall(30, this, "uint*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
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
     * @returns {Integer} 
     */
    get_TVFlags() {
        result := ComCall(33, this, "uint*", &dwFlags := 0, "HRESULT")
        return dwFlags
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Columns() {
        bstrColumns := BSTR()
        result := ComCall(34, this, "ptr", bstrColumns, "HRESULT")
        return bstrColumns
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
     * @returns {Integer} 
     */
    get_CountViewTypes() {
        result := ComCall(36, this, "int*", &piTypes := 0, "HRESULT")
        return piTypes
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
     * @returns {IDispatch} 
     */
    SelectedItems() {
        result := ComCall(38, this, "ptr*", &ppid := 0, "HRESULT")
        return IDispatch(ppid)
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
