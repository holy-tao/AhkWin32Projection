#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\IHTMLTableSection.ahk" { IHTMLTableSection }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IHTMLElementCollection.ahk" { IHTMLElementCollection }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }
#Import ".\IHTMLTableCaption.ahk" { IHTMLTableCaption }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLTable extends IDispatch {
    /**
     * The interface identifier for IHTMLTable
     * @type {Guid}
     */
    static IID := Guid("{3050f21e-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLTable
     * @type {Guid}
     */
    static CLSID := Guid("{3050f26b-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLTable interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_cols               : IntPtr
        get_cols               : IntPtr
        put_border             : IntPtr
        get_border             : IntPtr
        put_frame              : IntPtr
        get_frame              : IntPtr
        put_rules              : IntPtr
        get_rules              : IntPtr
        put_cellSpacing        : IntPtr
        get_cellSpacing        : IntPtr
        put_cellPadding        : IntPtr
        get_cellPadding        : IntPtr
        put_background         : IntPtr
        get_background         : IntPtr
        put_bgColor            : IntPtr
        get_bgColor            : IntPtr
        put_borderColor        : IntPtr
        get_borderColor        : IntPtr
        put_borderColorLight   : IntPtr
        get_borderColorLight   : IntPtr
        put_borderColorDark    : IntPtr
        get_borderColorDark    : IntPtr
        put_align              : IntPtr
        get_align              : IntPtr
        refresh                : IntPtr
        get_rows               : IntPtr
        put_width              : IntPtr
        get_width              : IntPtr
        put_height             : IntPtr
        get_height             : IntPtr
        put_dataPageSize       : IntPtr
        get_dataPageSize       : IntPtr
        nextPage               : IntPtr
        previousPage           : IntPtr
        get_tHead              : IntPtr
        get_tFoot              : IntPtr
        get_tBodies            : IntPtr
        get_caption            : IntPtr
        createTHead            : IntPtr
        deleteTHead            : IntPtr
        createTFoot            : IntPtr
        deleteTFoot            : IntPtr
        createCaption          : IntPtr
        deleteCaption          : IntPtr
        insertRow              : IntPtr
        deleteRow              : IntPtr
        get_readyState         : IntPtr
        put_onreadystatechange : IntPtr
        get_onreadystatechange : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLTable.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    cols {
        get => this.get_cols()
        set => this.put_cols(value)
    }

    /**
     * @type {VARIANT} 
     */
    border {
        get => this.get_border()
        set => this.put_border(value)
    }

    /**
     * @type {BSTR} 
     */
    frame {
        get => this.get_frame()
        set => this.put_frame(value)
    }

    /**
     * @type {BSTR} 
     */
    rules {
        get => this.get_rules()
        set => this.put_rules(value)
    }

    /**
     * @type {VARIANT} 
     */
    cellSpacing {
        get => this.get_cellSpacing()
        set => this.put_cellSpacing(value)
    }

    /**
     * @type {VARIANT} 
     */
    cellPadding {
        get => this.get_cellPadding()
        set => this.put_cellPadding(value)
    }

    /**
     * @type {BSTR} 
     */
    background {
        get => this.get_background()
        set => this.put_background(value)
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
     * @type {BSTR} 
     */
    align {
        get => this.get_align()
        set => this.put_align(value)
    }

    /**
     * @type {IHTMLElementCollection} 
     */
    rows {
        get => this.get_rows()
    }

    /**
     * @type {VARIANT} 
     */
    width {
        get => this.get_width()
        set => this.put_width(value)
    }

    /**
     * @type {VARIANT} 
     */
    height {
        get => this.get_height()
        set => this.put_height(value)
    }

    /**
     * @type {Integer} 
     */
    dataPageSize {
        get => this.get_dataPageSize()
        set => this.put_dataPageSize(value)
    }

    /**
     * @type {IHTMLTableSection} 
     */
    tHead {
        get => this.get_tHead()
    }

    /**
     * @type {IHTMLTableSection} 
     */
    tFoot {
        get => this.get_tFoot()
    }

    /**
     * @type {IHTMLElementCollection} 
     */
    tBodies {
        get => this.get_tBodies()
    }

    /**
     * @type {IHTMLTableCaption} 
     */
    caption {
        get => this.get_caption()
    }

    /**
     * @type {BSTR} 
     */
    readyState {
        get => this.get_readyState()
    }

    /**
     * @type {VARIANT} 
     */
    onreadystatechange {
        get => this.get_onreadystatechange()
        set => this.put_onreadystatechange(value)
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_cols(v) {
        result := ComCall(7, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_cols() {
        result := ComCall(8, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_border(v) {
        result := ComCall(9, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_border() {
        p := VARIANT()
        result := ComCall(10, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_frame(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(11, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_frame() {
        p := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_rules(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(13, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_rules() {
        p := BSTR.Owned()
        result := ComCall(14, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_cellSpacing(v) {
        result := ComCall(15, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_cellSpacing() {
        p := VARIANT()
        result := ComCall(16, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_cellPadding(v) {
        result := ComCall(17, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_cellPadding() {
        p := VARIANT()
        result := ComCall(18, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_background(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(19, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_background() {
        p := BSTR.Owned()
        result := ComCall(20, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_bgColor(v) {
        result := ComCall(21, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_bgColor() {
        p := VARIANT()
        result := ComCall(22, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_borderColor(v) {
        result := ComCall(23, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_borderColor() {
        p := VARIANT()
        result := ComCall(24, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_borderColorLight(v) {
        result := ComCall(25, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_borderColorLight() {
        p := VARIANT()
        result := ComCall(26, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_borderColorDark(v) {
        result := ComCall(27, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_borderColorDark() {
        p := VARIANT()
        result := ComCall(28, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_align(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(29, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_align() {
        p := BSTR.Owned()
        result := ComCall(30, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    refresh() {
        result := ComCall(31, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IHTMLElementCollection} 
     */
    get_rows() {
        result := ComCall(32, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLElementCollection(p)
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_width(v) {
        result := ComCall(33, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_width() {
        p := VARIANT()
        result := ComCall(34, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_height(v) {
        result := ComCall(35, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_height() {
        p := VARIANT()
        result := ComCall(36, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_dataPageSize(v) {
        result := ComCall(37, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_dataPageSize() {
        result := ComCall(38, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    nextPage() {
        result := ComCall(39, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    previousPage() {
        result := ComCall(40, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IHTMLTableSection} 
     */
    get_tHead() {
        result := ComCall(41, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLTableSection(p)
    }

    /**
     * 
     * @returns {IHTMLTableSection} 
     */
    get_tFoot() {
        result := ComCall(42, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLTableSection(p)
    }

    /**
     * 
     * @returns {IHTMLElementCollection} 
     */
    get_tBodies() {
        result := ComCall(43, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLElementCollection(p)
    }

    /**
     * 
     * @returns {IHTMLTableCaption} 
     */
    get_caption() {
        result := ComCall(44, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLTableCaption(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    createTHead() {
        result := ComCall(45, this, "ptr*", &head := 0, "HRESULT")
        return IDispatch(head)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    deleteTHead() {
        result := ComCall(46, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    createTFoot() {
        result := ComCall(47, this, "ptr*", &foot := 0, "HRESULT")
        return IDispatch(foot)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    deleteTFoot() {
        result := ComCall(48, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IHTMLTableCaption} 
     */
    createCaption() {
        result := ComCall(49, this, "ptr*", &caption := 0, "HRESULT")
        return IHTMLTableCaption(caption)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    deleteCaption() {
        result := ComCall(50, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {IDispatch} 
     */
    insertRow(index) {
        result := ComCall(51, this, "int", index, "ptr*", &row := 0, "HRESULT")
        return IDispatch(row)
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {HRESULT} 
     */
    deleteRow(index) {
        result := ComCall(52, this, "int", index, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_readyState() {
        p := BSTR.Owned()
        result := ComCall(53, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onreadystatechange(v) {
        result := ComCall(54, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onreadystatechange() {
        p := VARIANT()
        result := ComCall(55, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLTable.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_cols := CallbackCreate(GetMethod(implObj, "put_cols"), flags, 2)
        this.vtbl.get_cols := CallbackCreate(GetMethod(implObj, "get_cols"), flags, 2)
        this.vtbl.put_border := CallbackCreate(GetMethod(implObj, "put_border"), flags, 2)
        this.vtbl.get_border := CallbackCreate(GetMethod(implObj, "get_border"), flags, 2)
        this.vtbl.put_frame := CallbackCreate(GetMethod(implObj, "put_frame"), flags, 2)
        this.vtbl.get_frame := CallbackCreate(GetMethod(implObj, "get_frame"), flags, 2)
        this.vtbl.put_rules := CallbackCreate(GetMethod(implObj, "put_rules"), flags, 2)
        this.vtbl.get_rules := CallbackCreate(GetMethod(implObj, "get_rules"), flags, 2)
        this.vtbl.put_cellSpacing := CallbackCreate(GetMethod(implObj, "put_cellSpacing"), flags, 2)
        this.vtbl.get_cellSpacing := CallbackCreate(GetMethod(implObj, "get_cellSpacing"), flags, 2)
        this.vtbl.put_cellPadding := CallbackCreate(GetMethod(implObj, "put_cellPadding"), flags, 2)
        this.vtbl.get_cellPadding := CallbackCreate(GetMethod(implObj, "get_cellPadding"), flags, 2)
        this.vtbl.put_background := CallbackCreate(GetMethod(implObj, "put_background"), flags, 2)
        this.vtbl.get_background := CallbackCreate(GetMethod(implObj, "get_background"), flags, 2)
        this.vtbl.put_bgColor := CallbackCreate(GetMethod(implObj, "put_bgColor"), flags, 2)
        this.vtbl.get_bgColor := CallbackCreate(GetMethod(implObj, "get_bgColor"), flags, 2)
        this.vtbl.put_borderColor := CallbackCreate(GetMethod(implObj, "put_borderColor"), flags, 2)
        this.vtbl.get_borderColor := CallbackCreate(GetMethod(implObj, "get_borderColor"), flags, 2)
        this.vtbl.put_borderColorLight := CallbackCreate(GetMethod(implObj, "put_borderColorLight"), flags, 2)
        this.vtbl.get_borderColorLight := CallbackCreate(GetMethod(implObj, "get_borderColorLight"), flags, 2)
        this.vtbl.put_borderColorDark := CallbackCreate(GetMethod(implObj, "put_borderColorDark"), flags, 2)
        this.vtbl.get_borderColorDark := CallbackCreate(GetMethod(implObj, "get_borderColorDark"), flags, 2)
        this.vtbl.put_align := CallbackCreate(GetMethod(implObj, "put_align"), flags, 2)
        this.vtbl.get_align := CallbackCreate(GetMethod(implObj, "get_align"), flags, 2)
        this.vtbl.refresh := CallbackCreate(GetMethod(implObj, "refresh"), flags, 1)
        this.vtbl.get_rows := CallbackCreate(GetMethod(implObj, "get_rows"), flags, 2)
        this.vtbl.put_width := CallbackCreate(GetMethod(implObj, "put_width"), flags, 2)
        this.vtbl.get_width := CallbackCreate(GetMethod(implObj, "get_width"), flags, 2)
        this.vtbl.put_height := CallbackCreate(GetMethod(implObj, "put_height"), flags, 2)
        this.vtbl.get_height := CallbackCreate(GetMethod(implObj, "get_height"), flags, 2)
        this.vtbl.put_dataPageSize := CallbackCreate(GetMethod(implObj, "put_dataPageSize"), flags, 2)
        this.vtbl.get_dataPageSize := CallbackCreate(GetMethod(implObj, "get_dataPageSize"), flags, 2)
        this.vtbl.nextPage := CallbackCreate(GetMethod(implObj, "nextPage"), flags, 1)
        this.vtbl.previousPage := CallbackCreate(GetMethod(implObj, "previousPage"), flags, 1)
        this.vtbl.get_tHead := CallbackCreate(GetMethod(implObj, "get_tHead"), flags, 2)
        this.vtbl.get_tFoot := CallbackCreate(GetMethod(implObj, "get_tFoot"), flags, 2)
        this.vtbl.get_tBodies := CallbackCreate(GetMethod(implObj, "get_tBodies"), flags, 2)
        this.vtbl.get_caption := CallbackCreate(GetMethod(implObj, "get_caption"), flags, 2)
        this.vtbl.createTHead := CallbackCreate(GetMethod(implObj, "createTHead"), flags, 2)
        this.vtbl.deleteTHead := CallbackCreate(GetMethod(implObj, "deleteTHead"), flags, 1)
        this.vtbl.createTFoot := CallbackCreate(GetMethod(implObj, "createTFoot"), flags, 2)
        this.vtbl.deleteTFoot := CallbackCreate(GetMethod(implObj, "deleteTFoot"), flags, 1)
        this.vtbl.createCaption := CallbackCreate(GetMethod(implObj, "createCaption"), flags, 2)
        this.vtbl.deleteCaption := CallbackCreate(GetMethod(implObj, "deleteCaption"), flags, 1)
        this.vtbl.insertRow := CallbackCreate(GetMethod(implObj, "insertRow"), flags, 3)
        this.vtbl.deleteRow := CallbackCreate(GetMethod(implObj, "deleteRow"), flags, 2)
        this.vtbl.get_readyState := CallbackCreate(GetMethod(implObj, "get_readyState"), flags, 2)
        this.vtbl.put_onreadystatechange := CallbackCreate(GetMethod(implObj, "put_onreadystatechange"), flags, 2)
        this.vtbl.get_onreadystatechange := CallbackCreate(GetMethod(implObj, "get_onreadystatechange"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_cols)
        CallbackFree(this.vtbl.get_cols)
        CallbackFree(this.vtbl.put_border)
        CallbackFree(this.vtbl.get_border)
        CallbackFree(this.vtbl.put_frame)
        CallbackFree(this.vtbl.get_frame)
        CallbackFree(this.vtbl.put_rules)
        CallbackFree(this.vtbl.get_rules)
        CallbackFree(this.vtbl.put_cellSpacing)
        CallbackFree(this.vtbl.get_cellSpacing)
        CallbackFree(this.vtbl.put_cellPadding)
        CallbackFree(this.vtbl.get_cellPadding)
        CallbackFree(this.vtbl.put_background)
        CallbackFree(this.vtbl.get_background)
        CallbackFree(this.vtbl.put_bgColor)
        CallbackFree(this.vtbl.get_bgColor)
        CallbackFree(this.vtbl.put_borderColor)
        CallbackFree(this.vtbl.get_borderColor)
        CallbackFree(this.vtbl.put_borderColorLight)
        CallbackFree(this.vtbl.get_borderColorLight)
        CallbackFree(this.vtbl.put_borderColorDark)
        CallbackFree(this.vtbl.get_borderColorDark)
        CallbackFree(this.vtbl.put_align)
        CallbackFree(this.vtbl.get_align)
        CallbackFree(this.vtbl.refresh)
        CallbackFree(this.vtbl.get_rows)
        CallbackFree(this.vtbl.put_width)
        CallbackFree(this.vtbl.get_width)
        CallbackFree(this.vtbl.put_height)
        CallbackFree(this.vtbl.get_height)
        CallbackFree(this.vtbl.put_dataPageSize)
        CallbackFree(this.vtbl.get_dataPageSize)
        CallbackFree(this.vtbl.nextPage)
        CallbackFree(this.vtbl.previousPage)
        CallbackFree(this.vtbl.get_tHead)
        CallbackFree(this.vtbl.get_tFoot)
        CallbackFree(this.vtbl.get_tBodies)
        CallbackFree(this.vtbl.get_caption)
        CallbackFree(this.vtbl.createTHead)
        CallbackFree(this.vtbl.deleteTHead)
        CallbackFree(this.vtbl.createTFoot)
        CallbackFree(this.vtbl.deleteTFoot)
        CallbackFree(this.vtbl.createCaption)
        CallbackFree(this.vtbl.deleteCaption)
        CallbackFree(this.vtbl.insertRow)
        CallbackFree(this.vtbl.deleteRow)
        CallbackFree(this.vtbl.get_readyState)
        CallbackFree(this.vtbl.put_onreadystatechange)
        CallbackFree(this.vtbl.get_onreadystatechange)
    }
}
