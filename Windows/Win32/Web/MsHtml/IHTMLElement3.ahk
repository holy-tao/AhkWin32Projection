#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IHTMLElement.ahk" { IHTMLElement }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLElement3 extends IDispatch {
    /**
     * The interface identifier for IHTMLElement3
     * @type {Guid}
     */
    static IID := Guid("{3050f673-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLElement3 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        mergeAttributes        : IntPtr
        get_isMultiLine        : IntPtr
        get_canHaveHTML        : IntPtr
        put_onlayoutcomplete   : IntPtr
        get_onlayoutcomplete   : IntPtr
        put_onpage             : IntPtr
        get_onpage             : IntPtr
        put_inflateBlock       : IntPtr
        get_inflateBlock       : IntPtr
        put_onbeforedeactivate : IntPtr
        get_onbeforedeactivate : IntPtr
        setActive              : IntPtr
        put_contentEditable    : IntPtr
        get_contentEditable    : IntPtr
        get_isContentEditable  : IntPtr
        put_hideFocus          : IntPtr
        get_hideFocus          : IntPtr
        put_disabled           : IntPtr
        get_disabled           : IntPtr
        get_isDisabled         : IntPtr
        put_onmove             : IntPtr
        get_onmove             : IntPtr
        put_oncontrolselect    : IntPtr
        get_oncontrolselect    : IntPtr
        fireEvent              : IntPtr
        put_onresizestart      : IntPtr
        get_onresizestart      : IntPtr
        put_onresizeend        : IntPtr
        get_onresizeend        : IntPtr
        put_onmovestart        : IntPtr
        get_onmovestart        : IntPtr
        put_onmoveend          : IntPtr
        get_onmoveend          : IntPtr
        put_onmouseenter       : IntPtr
        get_onmouseenter       : IntPtr
        put_onmouseleave       : IntPtr
        get_onmouseleave       : IntPtr
        put_onactivate         : IntPtr
        get_onactivate         : IntPtr
        put_ondeactivate       : IntPtr
        get_ondeactivate       : IntPtr
        dragDrop               : IntPtr
        get_glyphMode          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLElement3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    isMultiLine {
        get => this.get_isMultiLine()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    canHaveHTML {
        get => this.get_canHaveHTML()
    }

    /**
     * @type {VARIANT} 
     */
    onlayoutcomplete {
        get => this.get_onlayoutcomplete()
        set => this.put_onlayoutcomplete(value)
    }

    /**
     * @type {VARIANT} 
     */
    onpage {
        get => this.get_onpage()
        set => this.put_onpage(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    inflateBlock {
        get => this.get_inflateBlock()
        set => this.put_inflateBlock(value)
    }

    /**
     * @type {VARIANT} 
     */
    onbeforedeactivate {
        get => this.get_onbeforedeactivate()
        set => this.put_onbeforedeactivate(value)
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
    isContentEditable {
        get => this.get_isContentEditable()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    hideFocus {
        get => this.get_hideFocus()
        set => this.put_hideFocus(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    disabled {
        get => this.get_disabled()
        set => this.put_disabled(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    isDisabled {
        get => this.get_isDisabled()
    }

    /**
     * @type {VARIANT} 
     */
    onmove {
        get => this.get_onmove()
        set => this.put_onmove(value)
    }

    /**
     * @type {VARIANT} 
     */
    oncontrolselect {
        get => this.get_oncontrolselect()
        set => this.put_oncontrolselect(value)
    }

    /**
     * @type {VARIANT} 
     */
    onresizestart {
        get => this.get_onresizestart()
        set => this.put_onresizestart(value)
    }

    /**
     * @type {VARIANT} 
     */
    onresizeend {
        get => this.get_onresizeend()
        set => this.put_onresizeend(value)
    }

    /**
     * @type {VARIANT} 
     */
    onmovestart {
        get => this.get_onmovestart()
        set => this.put_onmovestart(value)
    }

    /**
     * @type {VARIANT} 
     */
    onmoveend {
        get => this.get_onmoveend()
        set => this.put_onmoveend(value)
    }

    /**
     * @type {VARIANT} 
     */
    onmouseenter {
        get => this.get_onmouseenter()
        set => this.put_onmouseenter(value)
    }

    /**
     * @type {VARIANT} 
     */
    onmouseleave {
        get => this.get_onmouseleave()
        set => this.put_onmouseleave(value)
    }

    /**
     * @type {VARIANT} 
     */
    onactivate {
        get => this.get_onactivate()
        set => this.put_onactivate(value)
    }

    /**
     * @type {VARIANT} 
     */
    ondeactivate {
        get => this.get_ondeactivate()
        set => this.put_ondeactivate(value)
    }

    /**
     * @type {Integer} 
     */
    glyphMode {
        get => this.get_glyphMode()
    }

    /**
     * 
     * @param {IHTMLElement} mergeThis 
     * @param {Pointer<VARIANT>} pvarFlags 
     * @returns {HRESULT} 
     */
    mergeAttributes(mergeThis, pvarFlags) {
        result := ComCall(7, this, "ptr", mergeThis, VARIANT.Ptr, pvarFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_isMultiLine() {
        result := ComCall(8, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_canHaveHTML() {
        result := ComCall(9, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onlayoutcomplete(v) {
        result := ComCall(10, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onlayoutcomplete() {
        p := VARIANT()
        result := ComCall(11, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onpage(v) {
        result := ComCall(12, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onpage() {
        p := VARIANT()
        result := ComCall(13, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_inflateBlock(v) {
        result := ComCall(14, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_inflateBlock() {
        result := ComCall(15, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onbeforedeactivate(v) {
        result := ComCall(16, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onbeforedeactivate() {
        p := VARIANT()
        result := ComCall(17, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    setActive() {
        result := ComCall(18, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_contentEditable(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(19, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_contentEditable() {
        p := BSTR.Owned()
        result := ComCall(20, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_isContentEditable() {
        result := ComCall(21, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_hideFocus(v) {
        result := ComCall(22, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_hideFocus() {
        result := ComCall(23, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_disabled(v) {
        result := ComCall(24, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_disabled() {
        result := ComCall(25, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_isDisabled() {
        result := ComCall(26, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmove(v) {
        result := ComCall(27, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmove() {
        p := VARIANT()
        result := ComCall(28, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_oncontrolselect(v) {
        result := ComCall(29, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_oncontrolselect() {
        p := VARIANT()
        result := ComCall(30, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} bstrEventName 
     * @param {Pointer<VARIANT>} pvarEventObject 
     * @returns {VARIANT_BOOL} 
     */
    fireEvent(bstrEventName, pvarEventObject) {
        bstrEventName := bstrEventName is String ? BSTR.Alloc(bstrEventName).Value : bstrEventName

        result := ComCall(31, this, BSTR, bstrEventName, VARIANT.Ptr, pvarEventObject, VARIANT_BOOL.Ptr, &pfCancelled := 0, "HRESULT")
        return pfCancelled
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onresizestart(v) {
        result := ComCall(32, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onresizestart() {
        p := VARIANT()
        result := ComCall(33, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onresizeend(v) {
        result := ComCall(34, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onresizeend() {
        p := VARIANT()
        result := ComCall(35, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmovestart(v) {
        result := ComCall(36, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmovestart() {
        p := VARIANT()
        result := ComCall(37, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmoveend(v) {
        result := ComCall(38, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmoveend() {
        p := VARIANT()
        result := ComCall(39, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmouseenter(v) {
        result := ComCall(40, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmouseenter() {
        p := VARIANT()
        result := ComCall(41, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmouseleave(v) {
        result := ComCall(42, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmouseleave() {
        p := VARIANT()
        result := ComCall(43, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onactivate(v) {
        result := ComCall(44, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onactivate() {
        p := VARIANT()
        result := ComCall(45, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ondeactivate(v) {
        result := ComCall(46, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ondeactivate() {
        p := VARIANT()
        result := ComCall(47, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    dragDrop() {
        result := ComCall(48, this, VARIANT_BOOL.Ptr, &pfRet := 0, "HRESULT")
        return pfRet
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_glyphMode() {
        result := ComCall(49, this, "int*", &p := 0, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLElement3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.mergeAttributes := CallbackCreate(GetMethod(implObj, "mergeAttributes"), flags, 3)
        this.vtbl.get_isMultiLine := CallbackCreate(GetMethod(implObj, "get_isMultiLine"), flags, 2)
        this.vtbl.get_canHaveHTML := CallbackCreate(GetMethod(implObj, "get_canHaveHTML"), flags, 2)
        this.vtbl.put_onlayoutcomplete := CallbackCreate(GetMethod(implObj, "put_onlayoutcomplete"), flags, 2)
        this.vtbl.get_onlayoutcomplete := CallbackCreate(GetMethod(implObj, "get_onlayoutcomplete"), flags, 2)
        this.vtbl.put_onpage := CallbackCreate(GetMethod(implObj, "put_onpage"), flags, 2)
        this.vtbl.get_onpage := CallbackCreate(GetMethod(implObj, "get_onpage"), flags, 2)
        this.vtbl.put_inflateBlock := CallbackCreate(GetMethod(implObj, "put_inflateBlock"), flags, 2)
        this.vtbl.get_inflateBlock := CallbackCreate(GetMethod(implObj, "get_inflateBlock"), flags, 2)
        this.vtbl.put_onbeforedeactivate := CallbackCreate(GetMethod(implObj, "put_onbeforedeactivate"), flags, 2)
        this.vtbl.get_onbeforedeactivate := CallbackCreate(GetMethod(implObj, "get_onbeforedeactivate"), flags, 2)
        this.vtbl.setActive := CallbackCreate(GetMethod(implObj, "setActive"), flags, 1)
        this.vtbl.put_contentEditable := CallbackCreate(GetMethod(implObj, "put_contentEditable"), flags, 2)
        this.vtbl.get_contentEditable := CallbackCreate(GetMethod(implObj, "get_contentEditable"), flags, 2)
        this.vtbl.get_isContentEditable := CallbackCreate(GetMethod(implObj, "get_isContentEditable"), flags, 2)
        this.vtbl.put_hideFocus := CallbackCreate(GetMethod(implObj, "put_hideFocus"), flags, 2)
        this.vtbl.get_hideFocus := CallbackCreate(GetMethod(implObj, "get_hideFocus"), flags, 2)
        this.vtbl.put_disabled := CallbackCreate(GetMethod(implObj, "put_disabled"), flags, 2)
        this.vtbl.get_disabled := CallbackCreate(GetMethod(implObj, "get_disabled"), flags, 2)
        this.vtbl.get_isDisabled := CallbackCreate(GetMethod(implObj, "get_isDisabled"), flags, 2)
        this.vtbl.put_onmove := CallbackCreate(GetMethod(implObj, "put_onmove"), flags, 2)
        this.vtbl.get_onmove := CallbackCreate(GetMethod(implObj, "get_onmove"), flags, 2)
        this.vtbl.put_oncontrolselect := CallbackCreate(GetMethod(implObj, "put_oncontrolselect"), flags, 2)
        this.vtbl.get_oncontrolselect := CallbackCreate(GetMethod(implObj, "get_oncontrolselect"), flags, 2)
        this.vtbl.fireEvent := CallbackCreate(GetMethod(implObj, "fireEvent"), flags, 4)
        this.vtbl.put_onresizestart := CallbackCreate(GetMethod(implObj, "put_onresizestart"), flags, 2)
        this.vtbl.get_onresizestart := CallbackCreate(GetMethod(implObj, "get_onresizestart"), flags, 2)
        this.vtbl.put_onresizeend := CallbackCreate(GetMethod(implObj, "put_onresizeend"), flags, 2)
        this.vtbl.get_onresizeend := CallbackCreate(GetMethod(implObj, "get_onresizeend"), flags, 2)
        this.vtbl.put_onmovestart := CallbackCreate(GetMethod(implObj, "put_onmovestart"), flags, 2)
        this.vtbl.get_onmovestart := CallbackCreate(GetMethod(implObj, "get_onmovestart"), flags, 2)
        this.vtbl.put_onmoveend := CallbackCreate(GetMethod(implObj, "put_onmoveend"), flags, 2)
        this.vtbl.get_onmoveend := CallbackCreate(GetMethod(implObj, "get_onmoveend"), flags, 2)
        this.vtbl.put_onmouseenter := CallbackCreate(GetMethod(implObj, "put_onmouseenter"), flags, 2)
        this.vtbl.get_onmouseenter := CallbackCreate(GetMethod(implObj, "get_onmouseenter"), flags, 2)
        this.vtbl.put_onmouseleave := CallbackCreate(GetMethod(implObj, "put_onmouseleave"), flags, 2)
        this.vtbl.get_onmouseleave := CallbackCreate(GetMethod(implObj, "get_onmouseleave"), flags, 2)
        this.vtbl.put_onactivate := CallbackCreate(GetMethod(implObj, "put_onactivate"), flags, 2)
        this.vtbl.get_onactivate := CallbackCreate(GetMethod(implObj, "get_onactivate"), flags, 2)
        this.vtbl.put_ondeactivate := CallbackCreate(GetMethod(implObj, "put_ondeactivate"), flags, 2)
        this.vtbl.get_ondeactivate := CallbackCreate(GetMethod(implObj, "get_ondeactivate"), flags, 2)
        this.vtbl.dragDrop := CallbackCreate(GetMethod(implObj, "dragDrop"), flags, 2)
        this.vtbl.get_glyphMode := CallbackCreate(GetMethod(implObj, "get_glyphMode"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.mergeAttributes)
        CallbackFree(this.vtbl.get_isMultiLine)
        CallbackFree(this.vtbl.get_canHaveHTML)
        CallbackFree(this.vtbl.put_onlayoutcomplete)
        CallbackFree(this.vtbl.get_onlayoutcomplete)
        CallbackFree(this.vtbl.put_onpage)
        CallbackFree(this.vtbl.get_onpage)
        CallbackFree(this.vtbl.put_inflateBlock)
        CallbackFree(this.vtbl.get_inflateBlock)
        CallbackFree(this.vtbl.put_onbeforedeactivate)
        CallbackFree(this.vtbl.get_onbeforedeactivate)
        CallbackFree(this.vtbl.setActive)
        CallbackFree(this.vtbl.put_contentEditable)
        CallbackFree(this.vtbl.get_contentEditable)
        CallbackFree(this.vtbl.get_isContentEditable)
        CallbackFree(this.vtbl.put_hideFocus)
        CallbackFree(this.vtbl.get_hideFocus)
        CallbackFree(this.vtbl.put_disabled)
        CallbackFree(this.vtbl.get_disabled)
        CallbackFree(this.vtbl.get_isDisabled)
        CallbackFree(this.vtbl.put_onmove)
        CallbackFree(this.vtbl.get_onmove)
        CallbackFree(this.vtbl.put_oncontrolselect)
        CallbackFree(this.vtbl.get_oncontrolselect)
        CallbackFree(this.vtbl.fireEvent)
        CallbackFree(this.vtbl.put_onresizestart)
        CallbackFree(this.vtbl.get_onresizestart)
        CallbackFree(this.vtbl.put_onresizeend)
        CallbackFree(this.vtbl.get_onresizeend)
        CallbackFree(this.vtbl.put_onmovestart)
        CallbackFree(this.vtbl.get_onmovestart)
        CallbackFree(this.vtbl.put_onmoveend)
        CallbackFree(this.vtbl.get_onmoveend)
        CallbackFree(this.vtbl.put_onmouseenter)
        CallbackFree(this.vtbl.get_onmouseenter)
        CallbackFree(this.vtbl.put_onmouseleave)
        CallbackFree(this.vtbl.get_onmouseleave)
        CallbackFree(this.vtbl.put_onactivate)
        CallbackFree(this.vtbl.get_onactivate)
        CallbackFree(this.vtbl.put_ondeactivate)
        CallbackFree(this.vtbl.get_ondeactivate)
        CallbackFree(this.vtbl.dragDrop)
        CallbackFree(this.vtbl.get_glyphMode)
    }
}
