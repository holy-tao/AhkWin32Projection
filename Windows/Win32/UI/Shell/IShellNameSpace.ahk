#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IShellFavoritesNameSpace.ahk" { IShellFavoritesNameSpace }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IShellNameSpace extends IShellFavoritesNameSpace {
    /**
     * The interface identifier for IShellNameSpace
     * @type {Guid}
     */
    static IID := Guid("{e572d3c9-37be-4ae2-825d-d521763e3108}")

    /**
     * The class identifier for ShellNameSpace
     * @type {Guid}
     */
    static CLSID := Guid("{55136805-b2de-11d1-b9f2-00a0c98bc547}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IShellNameSpace interfaces
    */
    struct Vtbl extends IShellFavoritesNameSpace.Vtbl {
        get_EnumOptions    : IntPtr
        put_EnumOptions    : IntPtr
        get_SelectedItem   : IntPtr
        put_SelectedItem   : IntPtr
        get_Root           : IntPtr
        put_Root           : IntPtr
        get_Depth          : IntPtr
        put_Depth          : IntPtr
        get_Mode           : IntPtr
        put_Mode           : IntPtr
        get_Flags          : IntPtr
        put_Flags          : IntPtr
        put_TVFlags        : IntPtr
        get_TVFlags        : IntPtr
        get_Columns        : IntPtr
        put_Columns        : IntPtr
        get_CountViewTypes : IntPtr
        SetViewType        : IntPtr
        SelectedItems      : IntPtr
        Expand             : IntPtr
        UnselectAll        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IShellNameSpace.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
        result := ComCall(24, this, VARIANT.Ptr, pvar, "HRESULT")
        return pvar
    }

    /**
     * 
     * @param {VARIANT} var 
     * @returns {HRESULT} 
     */
    put_Root(var) {
        result := ComCall(25, this, VARIANT, var, "HRESULT")
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
        bstrColumns := BSTR.Owned()
        result := ComCall(34, this, BSTR.Ptr, bstrColumns, "HRESULT")
        return bstrColumns
    }

    /**
     * 
     * @param {BSTR} bstrColumns 
     * @returns {HRESULT} 
     */
    put_Columns(bstrColumns) {
        bstrColumns := bstrColumns is String ? BSTR.Alloc(bstrColumns).Value : bstrColumns

        result := ComCall(35, this, BSTR, bstrColumns, "HRESULT")
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
        result := ComCall(39, this, VARIANT, var, "int", iDepth, "HRESULT")
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

    Query(iid) {
        if (IShellNameSpace.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_EnumOptions := CallbackCreate(GetMethod(implObj, "get_EnumOptions"), flags, 2)
        this.vtbl.put_EnumOptions := CallbackCreate(GetMethod(implObj, "put_EnumOptions"), flags, 2)
        this.vtbl.get_SelectedItem := CallbackCreate(GetMethod(implObj, "get_SelectedItem"), flags, 2)
        this.vtbl.put_SelectedItem := CallbackCreate(GetMethod(implObj, "put_SelectedItem"), flags, 2)
        this.vtbl.get_Root := CallbackCreate(GetMethod(implObj, "get_Root"), flags, 2)
        this.vtbl.put_Root := CallbackCreate(GetMethod(implObj, "put_Root"), flags, 2)
        this.vtbl.get_Depth := CallbackCreate(GetMethod(implObj, "get_Depth"), flags, 2)
        this.vtbl.put_Depth := CallbackCreate(GetMethod(implObj, "put_Depth"), flags, 2)
        this.vtbl.get_Mode := CallbackCreate(GetMethod(implObj, "get_Mode"), flags, 2)
        this.vtbl.put_Mode := CallbackCreate(GetMethod(implObj, "put_Mode"), flags, 2)
        this.vtbl.get_Flags := CallbackCreate(GetMethod(implObj, "get_Flags"), flags, 2)
        this.vtbl.put_Flags := CallbackCreate(GetMethod(implObj, "put_Flags"), flags, 2)
        this.vtbl.put_TVFlags := CallbackCreate(GetMethod(implObj, "put_TVFlags"), flags, 2)
        this.vtbl.get_TVFlags := CallbackCreate(GetMethod(implObj, "get_TVFlags"), flags, 2)
        this.vtbl.get_Columns := CallbackCreate(GetMethod(implObj, "get_Columns"), flags, 2)
        this.vtbl.put_Columns := CallbackCreate(GetMethod(implObj, "put_Columns"), flags, 2)
        this.vtbl.get_CountViewTypes := CallbackCreate(GetMethod(implObj, "get_CountViewTypes"), flags, 2)
        this.vtbl.SetViewType := CallbackCreate(GetMethod(implObj, "SetViewType"), flags, 2)
        this.vtbl.SelectedItems := CallbackCreate(GetMethod(implObj, "SelectedItems"), flags, 2)
        this.vtbl.Expand := CallbackCreate(GetMethod(implObj, "Expand"), flags, 3)
        this.vtbl.UnselectAll := CallbackCreate(GetMethod(implObj, "UnselectAll"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_EnumOptions)
        CallbackFree(this.vtbl.put_EnumOptions)
        CallbackFree(this.vtbl.get_SelectedItem)
        CallbackFree(this.vtbl.put_SelectedItem)
        CallbackFree(this.vtbl.get_Root)
        CallbackFree(this.vtbl.put_Root)
        CallbackFree(this.vtbl.get_Depth)
        CallbackFree(this.vtbl.put_Depth)
        CallbackFree(this.vtbl.get_Mode)
        CallbackFree(this.vtbl.put_Mode)
        CallbackFree(this.vtbl.get_Flags)
        CallbackFree(this.vtbl.put_Flags)
        CallbackFree(this.vtbl.put_TVFlags)
        CallbackFree(this.vtbl.get_TVFlags)
        CallbackFree(this.vtbl.get_Columns)
        CallbackFree(this.vtbl.put_Columns)
        CallbackFree(this.vtbl.get_CountViewTypes)
        CallbackFree(this.vtbl.SetViewType)
        CallbackFree(this.vtbl.SelectedItems)
        CallbackFree(this.vtbl.Expand)
        CallbackFree(this.vtbl.UnselectAll)
    }
}
