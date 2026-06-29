#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IHTMLElementCollection.ahk" { IHTMLElementCollection }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLTableRow extends IDispatch {
    /**
     * The interface identifier for IHTMLTableRow
     * @type {Guid}
     */
    static IID := Guid("{3050f23c-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLTableRow
     * @type {Guid}
     */
    static CLSID := Guid("{3050f26d-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLTableRow interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_align            : IntPtr
        get_align            : IntPtr
        put_vAlign           : IntPtr
        get_vAlign           : IntPtr
        put_bgColor          : IntPtr
        get_bgColor          : IntPtr
        put_borderColor      : IntPtr
        get_borderColor      : IntPtr
        put_borderColorLight : IntPtr
        get_borderColorLight : IntPtr
        put_borderColorDark  : IntPtr
        get_borderColorDark  : IntPtr
        get_rowIndex         : IntPtr
        get_sectionRowIndex  : IntPtr
        get_cells            : IntPtr
        insertCell           : IntPtr
        deleteCell           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLTableRow.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    align {
        get => this.get_align()
        set => this.put_align(value)
    }

    /**
     * @type {BSTR} 
     */
    vAlign {
        get => this.get_vAlign()
        set => this.put_vAlign(value)
    }

    /**
     * @type {VARIANT} 
     */
    bgColor {
        get => this.get_bgColor()
        set => this.put_bgColor(value)
    }

    /**
     * @type {VARIANT} 
     */
    borderColor {
        get => this.get_borderColor()
        set => this.put_borderColor(value)
    }

    /**
     * @type {VARIANT} 
     */
    borderColorLight {
        get => this.get_borderColorLight()
        set => this.put_borderColorLight(value)
    }

    /**
     * @type {VARIANT} 
     */
    borderColorDark {
        get => this.get_borderColorDark()
        set => this.put_borderColorDark(value)
    }

    /**
     * @type {Integer} 
     */
    rowIndex {
        get => this.get_rowIndex()
    }

    /**
     * @type {Integer} 
     */
    sectionRowIndex {
        get => this.get_sectionRowIndex()
    }

    /**
     * @type {IHTMLElementCollection} 
     */
    cells {
        get => this.get_cells()
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_align(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(7, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_align() {
        p := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_vAlign(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(9, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_vAlign() {
        p := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_bgColor(v) {
        result := ComCall(11, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_bgColor() {
        p := VARIANT()
        result := ComCall(12, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_borderColor(v) {
        result := ComCall(13, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_borderColor() {
        p := VARIANT()
        result := ComCall(14, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_borderColorLight(v) {
        result := ComCall(15, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_borderColorLight() {
        p := VARIANT()
        result := ComCall(16, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_borderColorDark(v) {
        result := ComCall(17, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_borderColorDark() {
        p := VARIANT()
        result := ComCall(18, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_rowIndex() {
        result := ComCall(19, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_sectionRowIndex() {
        result := ComCall(20, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IHTMLElementCollection} 
     */
    get_cells() {
        result := ComCall(21, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLElementCollection(p)
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {IDispatch} 
     */
    insertCell(index) {
        result := ComCall(22, this, "int", index, "ptr*", &row := 0, "HRESULT")
        return IDispatch(row)
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {HRESULT} 
     */
    deleteCell(index) {
        result := ComCall(23, this, "int", index, "HRESULT")
        return result
    }

    Query(iid) {
        if (IHTMLTableRow.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_align := CallbackCreate(GetMethod(implObj, "put_align"), flags, 2)
        this.vtbl.get_align := CallbackCreate(GetMethod(implObj, "get_align"), flags, 2)
        this.vtbl.put_vAlign := CallbackCreate(GetMethod(implObj, "put_vAlign"), flags, 2)
        this.vtbl.get_vAlign := CallbackCreate(GetMethod(implObj, "get_vAlign"), flags, 2)
        this.vtbl.put_bgColor := CallbackCreate(GetMethod(implObj, "put_bgColor"), flags, 2)
        this.vtbl.get_bgColor := CallbackCreate(GetMethod(implObj, "get_bgColor"), flags, 2)
        this.vtbl.put_borderColor := CallbackCreate(GetMethod(implObj, "put_borderColor"), flags, 2)
        this.vtbl.get_borderColor := CallbackCreate(GetMethod(implObj, "get_borderColor"), flags, 2)
        this.vtbl.put_borderColorLight := CallbackCreate(GetMethod(implObj, "put_borderColorLight"), flags, 2)
        this.vtbl.get_borderColorLight := CallbackCreate(GetMethod(implObj, "get_borderColorLight"), flags, 2)
        this.vtbl.put_borderColorDark := CallbackCreate(GetMethod(implObj, "put_borderColorDark"), flags, 2)
        this.vtbl.get_borderColorDark := CallbackCreate(GetMethod(implObj, "get_borderColorDark"), flags, 2)
        this.vtbl.get_rowIndex := CallbackCreate(GetMethod(implObj, "get_rowIndex"), flags, 2)
        this.vtbl.get_sectionRowIndex := CallbackCreate(GetMethod(implObj, "get_sectionRowIndex"), flags, 2)
        this.vtbl.get_cells := CallbackCreate(GetMethod(implObj, "get_cells"), flags, 2)
        this.vtbl.insertCell := CallbackCreate(GetMethod(implObj, "insertCell"), flags, 3)
        this.vtbl.deleteCell := CallbackCreate(GetMethod(implObj, "deleteCell"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_align)
        CallbackFree(this.vtbl.get_align)
        CallbackFree(this.vtbl.put_vAlign)
        CallbackFree(this.vtbl.get_vAlign)
        CallbackFree(this.vtbl.put_bgColor)
        CallbackFree(this.vtbl.get_bgColor)
        CallbackFree(this.vtbl.put_borderColor)
        CallbackFree(this.vtbl.get_borderColor)
        CallbackFree(this.vtbl.put_borderColorLight)
        CallbackFree(this.vtbl.get_borderColorLight)
        CallbackFree(this.vtbl.put_borderColorDark)
        CallbackFree(this.vtbl.get_borderColorDark)
        CallbackFree(this.vtbl.get_rowIndex)
        CallbackFree(this.vtbl.get_sectionRowIndex)
        CallbackFree(this.vtbl.get_cells)
        CallbackFree(this.vtbl.insertCell)
        CallbackFree(this.vtbl.deleteCell)
    }
}
