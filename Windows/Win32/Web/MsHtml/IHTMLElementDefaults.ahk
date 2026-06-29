#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IHTMLDocument.ahk" { IHTMLDocument }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\IHTMLStyle.ahk" { IHTMLStyle }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLElementDefaults extends IDispatch {
    /**
     * The interface identifier for IHTMLElementDefaults
     * @type {Guid}
     */
    static IID := Guid("{3050f6c9-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLElementDefaults interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_style            : IntPtr
        put_tabStop          : IntPtr
        get_tabStop          : IntPtr
        put_viewInheritStyle : IntPtr
        get_viewInheritStyle : IntPtr
        put_viewMasterTab    : IntPtr
        get_viewMasterTab    : IntPtr
        put_scrollSegmentX   : IntPtr
        get_scrollSegmentX   : IntPtr
        put_scrollSegmentY   : IntPtr
        get_scrollSegmentY   : IntPtr
        put_isMultiLine      : IntPtr
        get_isMultiLine      : IntPtr
        put_contentEditable  : IntPtr
        get_contentEditable  : IntPtr
        put_canHaveHTML      : IntPtr
        get_canHaveHTML      : IntPtr
        putref_viewLink      : IntPtr
        get_viewLink         : IntPtr
        put_frozen           : IntPtr
        get_frozen           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLElementDefaults.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IHTMLStyle} 
     */
    style {
        get => this.get_style()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    tabStop {
        get => this.get_tabStop()
        set => this.put_tabStop(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    viewInheritStyle {
        get => this.get_viewInheritStyle()
        set => this.put_viewInheritStyle(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    viewMasterTab {
        get => this.get_viewMasterTab()
        set => this.put_viewMasterTab(value)
    }

    /**
     * @type {Integer} 
     */
    scrollSegmentX {
        get => this.get_scrollSegmentX()
        set => this.put_scrollSegmentX(value)
    }

    /**
     * @type {Integer} 
     */
    scrollSegmentY {
        get => this.get_scrollSegmentY()
        set => this.put_scrollSegmentY(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    isMultiLine {
        get => this.get_isMultiLine()
        set => this.put_isMultiLine(value)
    }

    /**
     * @type {BSTR} 
     */
    contentEditable {
        get => this.get_contentEditable()
        set => this.put_contentEditable(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    canHaveHTML {
        get => this.get_canHaveHTML()
        set => this.put_canHaveHTML(value)
    }

    /**
     * @type {IHTMLDocument} 
     */
    viewLink {
        get => this.get_viewLink()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    frozen {
        get => this.get_frozen()
        set => this.put_frozen(value)
    }

    /**
     * 
     * @returns {IHTMLStyle} 
     */
    get_style() {
        result := ComCall(7, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLStyle(p)
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_tabStop(v) {
        result := ComCall(8, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_tabStop() {
        result := ComCall(9, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_viewInheritStyle(v) {
        result := ComCall(10, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_viewInheritStyle() {
        result := ComCall(11, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_viewMasterTab(v) {
        result := ComCall(12, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_viewMasterTab() {
        result := ComCall(13, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_scrollSegmentX(v) {
        result := ComCall(14, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_scrollSegmentX() {
        result := ComCall(15, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_scrollSegmentY(v) {
        result := ComCall(16, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_scrollSegmentY() {
        result := ComCall(17, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_isMultiLine(v) {
        result := ComCall(18, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_isMultiLine() {
        result := ComCall(19, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_contentEditable(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(20, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_contentEditable() {
        p := BSTR.Owned()
        result := ComCall(21, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_canHaveHTML(v) {
        result := ComCall(22, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_canHaveHTML() {
        result := ComCall(23, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {IHTMLDocument} v 
     * @returns {HRESULT} 
     */
    putref_viewLink(v) {
        result := ComCall(24, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IHTMLDocument} 
     */
    get_viewLink() {
        result := ComCall(25, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLDocument(p)
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_frozen(v) {
        result := ComCall(26, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_frozen() {
        result := ComCall(27, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLElementDefaults.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_style := CallbackCreate(GetMethod(implObj, "get_style"), flags, 2)
        this.vtbl.put_tabStop := CallbackCreate(GetMethod(implObj, "put_tabStop"), flags, 2)
        this.vtbl.get_tabStop := CallbackCreate(GetMethod(implObj, "get_tabStop"), flags, 2)
        this.vtbl.put_viewInheritStyle := CallbackCreate(GetMethod(implObj, "put_viewInheritStyle"), flags, 2)
        this.vtbl.get_viewInheritStyle := CallbackCreate(GetMethod(implObj, "get_viewInheritStyle"), flags, 2)
        this.vtbl.put_viewMasterTab := CallbackCreate(GetMethod(implObj, "put_viewMasterTab"), flags, 2)
        this.vtbl.get_viewMasterTab := CallbackCreate(GetMethod(implObj, "get_viewMasterTab"), flags, 2)
        this.vtbl.put_scrollSegmentX := CallbackCreate(GetMethod(implObj, "put_scrollSegmentX"), flags, 2)
        this.vtbl.get_scrollSegmentX := CallbackCreate(GetMethod(implObj, "get_scrollSegmentX"), flags, 2)
        this.vtbl.put_scrollSegmentY := CallbackCreate(GetMethod(implObj, "put_scrollSegmentY"), flags, 2)
        this.vtbl.get_scrollSegmentY := CallbackCreate(GetMethod(implObj, "get_scrollSegmentY"), flags, 2)
        this.vtbl.put_isMultiLine := CallbackCreate(GetMethod(implObj, "put_isMultiLine"), flags, 2)
        this.vtbl.get_isMultiLine := CallbackCreate(GetMethod(implObj, "get_isMultiLine"), flags, 2)
        this.vtbl.put_contentEditable := CallbackCreate(GetMethod(implObj, "put_contentEditable"), flags, 2)
        this.vtbl.get_contentEditable := CallbackCreate(GetMethod(implObj, "get_contentEditable"), flags, 2)
        this.vtbl.put_canHaveHTML := CallbackCreate(GetMethod(implObj, "put_canHaveHTML"), flags, 2)
        this.vtbl.get_canHaveHTML := CallbackCreate(GetMethod(implObj, "get_canHaveHTML"), flags, 2)
        this.vtbl.putref_viewLink := CallbackCreate(GetMethod(implObj, "putref_viewLink"), flags, 2)
        this.vtbl.get_viewLink := CallbackCreate(GetMethod(implObj, "get_viewLink"), flags, 2)
        this.vtbl.put_frozen := CallbackCreate(GetMethod(implObj, "put_frozen"), flags, 2)
        this.vtbl.get_frozen := CallbackCreate(GetMethod(implObj, "get_frozen"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_style)
        CallbackFree(this.vtbl.put_tabStop)
        CallbackFree(this.vtbl.get_tabStop)
        CallbackFree(this.vtbl.put_viewInheritStyle)
        CallbackFree(this.vtbl.get_viewInheritStyle)
        CallbackFree(this.vtbl.put_viewMasterTab)
        CallbackFree(this.vtbl.get_viewMasterTab)
        CallbackFree(this.vtbl.put_scrollSegmentX)
        CallbackFree(this.vtbl.get_scrollSegmentX)
        CallbackFree(this.vtbl.put_scrollSegmentY)
        CallbackFree(this.vtbl.get_scrollSegmentY)
        CallbackFree(this.vtbl.put_isMultiLine)
        CallbackFree(this.vtbl.get_isMultiLine)
        CallbackFree(this.vtbl.put_contentEditable)
        CallbackFree(this.vtbl.get_contentEditable)
        CallbackFree(this.vtbl.put_canHaveHTML)
        CallbackFree(this.vtbl.get_canHaveHTML)
        CallbackFree(this.vtbl.putref_viewLink)
        CallbackFree(this.vtbl.get_viewLink)
        CallbackFree(this.vtbl.put_frozen)
        CallbackFree(this.vtbl.get_frozen)
    }
}
