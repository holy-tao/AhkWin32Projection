#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\_ColumnSortOrder.ahk" { _ColumnSortOrder }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.System.Mmc
 */
export default struct Column extends IDispatch {
    /**
     * The interface identifier for Column
     * @type {Guid}
     */
    static IID := Guid("{fd1c5f63-2b16-4d06-9ab3-f45350b940ab}")

    /**
     * The class identifier for Column
     * @type {Guid}
     */
    static CLSID := Guid("{fd1c5f63-2b16-4d06-9ab3-f45350b940ab}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for Column interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        Name                : IntPtr
        get_Width           : IntPtr
        put_Width           : IntPtr
        get_DisplayPosition : IntPtr
        put_DisplayPosition : IntPtr
        get_Hidden          : IntPtr
        put_Hidden          : IntPtr
        SetAsSortColumn     : IntPtr
        IsSortColumn        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := Column.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    Width {
        get => this.get_Width()
        set => this.put_Width(value)
    }

    /**
     * @type {Integer} 
     */
    DisplayPosition {
        get => this.get_DisplayPosition()
        set => this.put_DisplayPosition(value)
    }

    /**
     * @type {BOOL} 
     */
    Hidden {
        get => this.get_Hidden()
        set => this.put_Hidden(value)
    }

    /**
     * Contains the name of a header field in an email message.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/TaskSchd/taskschedulerschema-name-headerfieldtype-element
     */
    Name() {
        Name := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, Name, "HRESULT")
        return Name
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Width() {
        result := ComCall(8, this, "int*", &Width := 0, "HRESULT")
        return Width
    }

    /**
     * 
     * @param {Integer} Width 
     * @returns {HRESULT} 
     */
    put_Width(Width) {
        result := ComCall(9, this, "int", Width, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DisplayPosition() {
        result := ComCall(10, this, "int*", &DisplayPosition := 0, "HRESULT")
        return DisplayPosition
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {HRESULT} 
     */
    put_DisplayPosition(Index) {
        result := ComCall(11, this, "int", Index, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_Hidden() {
        result := ComCall(12, this, BOOL.Ptr, &Hidden := 0, "HRESULT")
        return Hidden
    }

    /**
     * 
     * @param {BOOL} Hidden 
     * @returns {HRESULT} 
     */
    put_Hidden(Hidden) {
        result := ComCall(13, this, BOOL, Hidden, "HRESULT")
        return result
    }

    /**
     * 
     * @param {_ColumnSortOrder} SortOrder 
     * @returns {HRESULT} 
     */
    SetAsSortColumn(SortOrder) {
        result := ComCall(14, this, _ColumnSortOrder, SortOrder, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsSortColumn() {
        result := ComCall(15, this, BOOL.Ptr, &IsSortColumn := 0, "HRESULT")
        return IsSortColumn
    }

    Query(iid) {
        if (Column.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Name := CallbackCreate(GetMethod(implObj, "Name"), flags, 2)
        this.vtbl.get_Width := CallbackCreate(GetMethod(implObj, "get_Width"), flags, 2)
        this.vtbl.put_Width := CallbackCreate(GetMethod(implObj, "put_Width"), flags, 2)
        this.vtbl.get_DisplayPosition := CallbackCreate(GetMethod(implObj, "get_DisplayPosition"), flags, 2)
        this.vtbl.put_DisplayPosition := CallbackCreate(GetMethod(implObj, "put_DisplayPosition"), flags, 2)
        this.vtbl.get_Hidden := CallbackCreate(GetMethod(implObj, "get_Hidden"), flags, 2)
        this.vtbl.put_Hidden := CallbackCreate(GetMethod(implObj, "put_Hidden"), flags, 2)
        this.vtbl.SetAsSortColumn := CallbackCreate(GetMethod(implObj, "SetAsSortColumn"), flags, 2)
        this.vtbl.IsSortColumn := CallbackCreate(GetMethod(implObj, "IsSortColumn"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Name)
        CallbackFree(this.vtbl.get_Width)
        CallbackFree(this.vtbl.put_Width)
        CallbackFree(this.vtbl.get_DisplayPosition)
        CallbackFree(this.vtbl.put_DisplayPosition)
        CallbackFree(this.vtbl.get_Hidden)
        CallbackFree(this.vtbl.put_Hidden)
        CallbackFree(this.vtbl.SetAsSortColumn)
        CallbackFree(this.vtbl.IsSortColumn)
    }
}
