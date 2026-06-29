#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLRuleStyle2 extends IDispatch {
    /**
     * The interface identifier for IHTMLRuleStyle2
     * @type {Guid}
     */
    static IID := Guid("{3050f4ac-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLRuleStyle2 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_tableLayout     : IntPtr
        get_tableLayout     : IntPtr
        put_borderCollapse  : IntPtr
        get_borderCollapse  : IntPtr
        put_direction       : IntPtr
        get_direction       : IntPtr
        put_behavior        : IntPtr
        get_behavior        : IntPtr
        put_position        : IntPtr
        get_position        : IntPtr
        put_unicodeBidi     : IntPtr
        get_unicodeBidi     : IntPtr
        put_bottom          : IntPtr
        get_bottom          : IntPtr
        put_right           : IntPtr
        get_right           : IntPtr
        put_pixelBottom     : IntPtr
        get_pixelBottom     : IntPtr
        put_pixelRight      : IntPtr
        get_pixelRight      : IntPtr
        put_posBottom       : IntPtr
        get_posBottom       : IntPtr
        put_posRight        : IntPtr
        get_posRight        : IntPtr
        put_imeMode         : IntPtr
        get_imeMode         : IntPtr
        put_rubyAlign       : IntPtr
        get_rubyAlign       : IntPtr
        put_rubyPosition    : IntPtr
        get_rubyPosition    : IntPtr
        put_rubyOverhang    : IntPtr
        get_rubyOverhang    : IntPtr
        put_layoutGridChar  : IntPtr
        get_layoutGridChar  : IntPtr
        put_layoutGridLine  : IntPtr
        get_layoutGridLine  : IntPtr
        put_layoutGridMode  : IntPtr
        get_layoutGridMode  : IntPtr
        put_layoutGridType  : IntPtr
        get_layoutGridType  : IntPtr
        put_layoutGrid      : IntPtr
        get_layoutGrid      : IntPtr
        put_textAutospace   : IntPtr
        get_textAutospace   : IntPtr
        put_wordBreak       : IntPtr
        get_wordBreak       : IntPtr
        put_lineBreak       : IntPtr
        get_lineBreak       : IntPtr
        put_textJustify     : IntPtr
        get_textJustify     : IntPtr
        put_textJustifyTrim : IntPtr
        get_textJustifyTrim : IntPtr
        put_textKashida     : IntPtr
        get_textKashida     : IntPtr
        put_overflowX       : IntPtr
        get_overflowX       : IntPtr
        put_overflowY       : IntPtr
        get_overflowY       : IntPtr
        put_accelerator     : IntPtr
        get_accelerator     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLRuleStyle2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    tableLayout {
        get => this.get_tableLayout()
        set => this.put_tableLayout(value)
    }

    /**
     * @type {BSTR} 
     */
    borderCollapse {
        get => this.get_borderCollapse()
        set => this.put_borderCollapse(value)
    }

    /**
     * @type {BSTR} 
     */
    direction {
        get => this.get_direction()
        set => this.put_direction(value)
    }

    /**
     * @type {BSTR} 
     */
    behavior {
        get => this.get_behavior()
        set => this.put_behavior(value)
    }

    /**
     * @type {BSTR} 
     */
    position {
        get => this.get_position()
        set => this.put_position(value)
    }

    /**
     * @type {BSTR} 
     */
    unicodeBidi {
        get => this.get_unicodeBidi()
        set => this.put_unicodeBidi(value)
    }

    /**
     * @type {VARIANT} 
     */
    bottom {
        get => this.get_bottom()
        set => this.put_bottom(value)
    }

    /**
     * @type {VARIANT} 
     */
    right {
        get => this.get_right()
        set => this.put_right(value)
    }

    /**
     * @type {Integer} 
     */
    pixelBottom {
        get => this.get_pixelBottom()
        set => this.put_pixelBottom(value)
    }

    /**
     * @type {Integer} 
     */
    pixelRight {
        get => this.get_pixelRight()
        set => this.put_pixelRight(value)
    }

    /**
     * @type {Float} 
     */
    posBottom {
        get => this.get_posBottom()
        set => this.put_posBottom(value)
    }

    /**
     * @type {Float} 
     */
    posRight {
        get => this.get_posRight()
        set => this.put_posRight(value)
    }

    /**
     * @type {BSTR} 
     */
    imeMode {
        get => this.get_imeMode()
        set => this.put_imeMode(value)
    }

    /**
     * @type {BSTR} 
     */
    rubyAlign {
        get => this.get_rubyAlign()
        set => this.put_rubyAlign(value)
    }

    /**
     * @type {BSTR} 
     */
    rubyPosition {
        get => this.get_rubyPosition()
        set => this.put_rubyPosition(value)
    }

    /**
     * @type {BSTR} 
     */
    rubyOverhang {
        get => this.get_rubyOverhang()
        set => this.put_rubyOverhang(value)
    }

    /**
     * @type {VARIANT} 
     */
    layoutGridChar {
        get => this.get_layoutGridChar()
        set => this.put_layoutGridChar(value)
    }

    /**
     * @type {VARIANT} 
     */
    layoutGridLine {
        get => this.get_layoutGridLine()
        set => this.put_layoutGridLine(value)
    }

    /**
     * @type {BSTR} 
     */
    layoutGridMode {
        get => this.get_layoutGridMode()
        set => this.put_layoutGridMode(value)
    }

    /**
     * @type {BSTR} 
     */
    layoutGridType {
        get => this.get_layoutGridType()
        set => this.put_layoutGridType(value)
    }

    /**
     * @type {BSTR} 
     */
    layoutGrid {
        get => this.get_layoutGrid()
        set => this.put_layoutGrid(value)
    }

    /**
     * @type {BSTR} 
     */
    textAutospace {
        get => this.get_textAutospace()
        set => this.put_textAutospace(value)
    }

    /**
     * @type {BSTR} 
     */
    wordBreak {
        get => this.get_wordBreak()
        set => this.put_wordBreak(value)
    }

    /**
     * @type {BSTR} 
     */
    lineBreak {
        get => this.get_lineBreak()
        set => this.put_lineBreak(value)
    }

    /**
     * @type {BSTR} 
     */
    textJustify {
        get => this.get_textJustify()
        set => this.put_textJustify(value)
    }

    /**
     * @type {BSTR} 
     */
    textJustifyTrim {
        get => this.get_textJustifyTrim()
        set => this.put_textJustifyTrim(value)
    }

    /**
     * @type {VARIANT} 
     */
    textKashida {
        get => this.get_textKashida()
        set => this.put_textKashida(value)
    }

    /**
     * @type {BSTR} 
     */
    overflowX {
        get => this.get_overflowX()
        set => this.put_overflowX(value)
    }

    /**
     * @type {BSTR} 
     */
    overflowY {
        get => this.get_overflowY()
        set => this.put_overflowY(value)
    }

    /**
     * @type {BSTR} 
     */
    accelerator {
        get => this.get_accelerator()
        set => this.put_accelerator(value)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_tableLayout(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(7, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_tableLayout() {
        p := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderCollapse(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(9, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderCollapse() {
        p := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_direction(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(11, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_direction() {
        p := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_behavior(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(13, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_behavior() {
        p := BSTR.Owned()
        result := ComCall(14, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_position(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(15, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_position() {
        p := BSTR.Owned()
        result := ComCall(16, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_unicodeBidi(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(17, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_unicodeBidi() {
        p := BSTR.Owned()
        result := ComCall(18, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_bottom(v) {
        result := ComCall(19, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_bottom() {
        p := VARIANT()
        result := ComCall(20, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_right(v) {
        result := ComCall(21, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_right() {
        p := VARIANT()
        result := ComCall(22, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_pixelBottom(v) {
        result := ComCall(23, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_pixelBottom() {
        result := ComCall(24, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_pixelRight(v) {
        result := ComCall(25, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_pixelRight() {
        result := ComCall(26, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_posBottom(v) {
        result := ComCall(27, this, "float", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_posBottom() {
        result := ComCall(28, this, "float*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_posRight(v) {
        result := ComCall(29, this, "float", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_posRight() {
        result := ComCall(30, this, "float*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_imeMode(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(31, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_imeMode() {
        p := BSTR.Owned()
        result := ComCall(32, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_rubyAlign(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(33, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_rubyAlign() {
        p := BSTR.Owned()
        result := ComCall(34, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_rubyPosition(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(35, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_rubyPosition() {
        p := BSTR.Owned()
        result := ComCall(36, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_rubyOverhang(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(37, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_rubyOverhang() {
        p := BSTR.Owned()
        result := ComCall(38, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_layoutGridChar(v) {
        result := ComCall(39, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_layoutGridChar() {
        p := VARIANT()
        result := ComCall(40, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_layoutGridLine(v) {
        result := ComCall(41, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_layoutGridLine() {
        p := VARIANT()
        result := ComCall(42, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_layoutGridMode(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(43, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_layoutGridMode() {
        p := BSTR.Owned()
        result := ComCall(44, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_layoutGridType(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(45, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_layoutGridType() {
        p := BSTR.Owned()
        result := ComCall(46, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_layoutGrid(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(47, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_layoutGrid() {
        p := BSTR.Owned()
        result := ComCall(48, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_textAutospace(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(49, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_textAutospace() {
        p := BSTR.Owned()
        result := ComCall(50, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_wordBreak(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(51, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_wordBreak() {
        p := BSTR.Owned()
        result := ComCall(52, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_lineBreak(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(53, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_lineBreak() {
        p := BSTR.Owned()
        result := ComCall(54, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_textJustify(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(55, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_textJustify() {
        p := BSTR.Owned()
        result := ComCall(56, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_textJustifyTrim(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(57, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_textJustifyTrim() {
        p := BSTR.Owned()
        result := ComCall(58, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_textKashida(v) {
        result := ComCall(59, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_textKashida() {
        p := VARIANT()
        result := ComCall(60, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_overflowX(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(61, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_overflowX() {
        p := BSTR.Owned()
        result := ComCall(62, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_overflowY(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(63, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_overflowY() {
        p := BSTR.Owned()
        result := ComCall(64, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_accelerator(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(65, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_accelerator() {
        p := BSTR.Owned()
        result := ComCall(66, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLRuleStyle2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_tableLayout := CallbackCreate(GetMethod(implObj, "put_tableLayout"), flags, 2)
        this.vtbl.get_tableLayout := CallbackCreate(GetMethod(implObj, "get_tableLayout"), flags, 2)
        this.vtbl.put_borderCollapse := CallbackCreate(GetMethod(implObj, "put_borderCollapse"), flags, 2)
        this.vtbl.get_borderCollapse := CallbackCreate(GetMethod(implObj, "get_borderCollapse"), flags, 2)
        this.vtbl.put_direction := CallbackCreate(GetMethod(implObj, "put_direction"), flags, 2)
        this.vtbl.get_direction := CallbackCreate(GetMethod(implObj, "get_direction"), flags, 2)
        this.vtbl.put_behavior := CallbackCreate(GetMethod(implObj, "put_behavior"), flags, 2)
        this.vtbl.get_behavior := CallbackCreate(GetMethod(implObj, "get_behavior"), flags, 2)
        this.vtbl.put_position := CallbackCreate(GetMethod(implObj, "put_position"), flags, 2)
        this.vtbl.get_position := CallbackCreate(GetMethod(implObj, "get_position"), flags, 2)
        this.vtbl.put_unicodeBidi := CallbackCreate(GetMethod(implObj, "put_unicodeBidi"), flags, 2)
        this.vtbl.get_unicodeBidi := CallbackCreate(GetMethod(implObj, "get_unicodeBidi"), flags, 2)
        this.vtbl.put_bottom := CallbackCreate(GetMethod(implObj, "put_bottom"), flags, 2)
        this.vtbl.get_bottom := CallbackCreate(GetMethod(implObj, "get_bottom"), flags, 2)
        this.vtbl.put_right := CallbackCreate(GetMethod(implObj, "put_right"), flags, 2)
        this.vtbl.get_right := CallbackCreate(GetMethod(implObj, "get_right"), flags, 2)
        this.vtbl.put_pixelBottom := CallbackCreate(GetMethod(implObj, "put_pixelBottom"), flags, 2)
        this.vtbl.get_pixelBottom := CallbackCreate(GetMethod(implObj, "get_pixelBottom"), flags, 2)
        this.vtbl.put_pixelRight := CallbackCreate(GetMethod(implObj, "put_pixelRight"), flags, 2)
        this.vtbl.get_pixelRight := CallbackCreate(GetMethod(implObj, "get_pixelRight"), flags, 2)
        this.vtbl.put_posBottom := CallbackCreate(GetMethod(implObj, "put_posBottom"), flags, 2)
        this.vtbl.get_posBottom := CallbackCreate(GetMethod(implObj, "get_posBottom"), flags, 2)
        this.vtbl.put_posRight := CallbackCreate(GetMethod(implObj, "put_posRight"), flags, 2)
        this.vtbl.get_posRight := CallbackCreate(GetMethod(implObj, "get_posRight"), flags, 2)
        this.vtbl.put_imeMode := CallbackCreate(GetMethod(implObj, "put_imeMode"), flags, 2)
        this.vtbl.get_imeMode := CallbackCreate(GetMethod(implObj, "get_imeMode"), flags, 2)
        this.vtbl.put_rubyAlign := CallbackCreate(GetMethod(implObj, "put_rubyAlign"), flags, 2)
        this.vtbl.get_rubyAlign := CallbackCreate(GetMethod(implObj, "get_rubyAlign"), flags, 2)
        this.vtbl.put_rubyPosition := CallbackCreate(GetMethod(implObj, "put_rubyPosition"), flags, 2)
        this.vtbl.get_rubyPosition := CallbackCreate(GetMethod(implObj, "get_rubyPosition"), flags, 2)
        this.vtbl.put_rubyOverhang := CallbackCreate(GetMethod(implObj, "put_rubyOverhang"), flags, 2)
        this.vtbl.get_rubyOverhang := CallbackCreate(GetMethod(implObj, "get_rubyOverhang"), flags, 2)
        this.vtbl.put_layoutGridChar := CallbackCreate(GetMethod(implObj, "put_layoutGridChar"), flags, 2)
        this.vtbl.get_layoutGridChar := CallbackCreate(GetMethod(implObj, "get_layoutGridChar"), flags, 2)
        this.vtbl.put_layoutGridLine := CallbackCreate(GetMethod(implObj, "put_layoutGridLine"), flags, 2)
        this.vtbl.get_layoutGridLine := CallbackCreate(GetMethod(implObj, "get_layoutGridLine"), flags, 2)
        this.vtbl.put_layoutGridMode := CallbackCreate(GetMethod(implObj, "put_layoutGridMode"), flags, 2)
        this.vtbl.get_layoutGridMode := CallbackCreate(GetMethod(implObj, "get_layoutGridMode"), flags, 2)
        this.vtbl.put_layoutGridType := CallbackCreate(GetMethod(implObj, "put_layoutGridType"), flags, 2)
        this.vtbl.get_layoutGridType := CallbackCreate(GetMethod(implObj, "get_layoutGridType"), flags, 2)
        this.vtbl.put_layoutGrid := CallbackCreate(GetMethod(implObj, "put_layoutGrid"), flags, 2)
        this.vtbl.get_layoutGrid := CallbackCreate(GetMethod(implObj, "get_layoutGrid"), flags, 2)
        this.vtbl.put_textAutospace := CallbackCreate(GetMethod(implObj, "put_textAutospace"), flags, 2)
        this.vtbl.get_textAutospace := CallbackCreate(GetMethod(implObj, "get_textAutospace"), flags, 2)
        this.vtbl.put_wordBreak := CallbackCreate(GetMethod(implObj, "put_wordBreak"), flags, 2)
        this.vtbl.get_wordBreak := CallbackCreate(GetMethod(implObj, "get_wordBreak"), flags, 2)
        this.vtbl.put_lineBreak := CallbackCreate(GetMethod(implObj, "put_lineBreak"), flags, 2)
        this.vtbl.get_lineBreak := CallbackCreate(GetMethod(implObj, "get_lineBreak"), flags, 2)
        this.vtbl.put_textJustify := CallbackCreate(GetMethod(implObj, "put_textJustify"), flags, 2)
        this.vtbl.get_textJustify := CallbackCreate(GetMethod(implObj, "get_textJustify"), flags, 2)
        this.vtbl.put_textJustifyTrim := CallbackCreate(GetMethod(implObj, "put_textJustifyTrim"), flags, 2)
        this.vtbl.get_textJustifyTrim := CallbackCreate(GetMethod(implObj, "get_textJustifyTrim"), flags, 2)
        this.vtbl.put_textKashida := CallbackCreate(GetMethod(implObj, "put_textKashida"), flags, 2)
        this.vtbl.get_textKashida := CallbackCreate(GetMethod(implObj, "get_textKashida"), flags, 2)
        this.vtbl.put_overflowX := CallbackCreate(GetMethod(implObj, "put_overflowX"), flags, 2)
        this.vtbl.get_overflowX := CallbackCreate(GetMethod(implObj, "get_overflowX"), flags, 2)
        this.vtbl.put_overflowY := CallbackCreate(GetMethod(implObj, "put_overflowY"), flags, 2)
        this.vtbl.get_overflowY := CallbackCreate(GetMethod(implObj, "get_overflowY"), flags, 2)
        this.vtbl.put_accelerator := CallbackCreate(GetMethod(implObj, "put_accelerator"), flags, 2)
        this.vtbl.get_accelerator := CallbackCreate(GetMethod(implObj, "get_accelerator"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_tableLayout)
        CallbackFree(this.vtbl.get_tableLayout)
        CallbackFree(this.vtbl.put_borderCollapse)
        CallbackFree(this.vtbl.get_borderCollapse)
        CallbackFree(this.vtbl.put_direction)
        CallbackFree(this.vtbl.get_direction)
        CallbackFree(this.vtbl.put_behavior)
        CallbackFree(this.vtbl.get_behavior)
        CallbackFree(this.vtbl.put_position)
        CallbackFree(this.vtbl.get_position)
        CallbackFree(this.vtbl.put_unicodeBidi)
        CallbackFree(this.vtbl.get_unicodeBidi)
        CallbackFree(this.vtbl.put_bottom)
        CallbackFree(this.vtbl.get_bottom)
        CallbackFree(this.vtbl.put_right)
        CallbackFree(this.vtbl.get_right)
        CallbackFree(this.vtbl.put_pixelBottom)
        CallbackFree(this.vtbl.get_pixelBottom)
        CallbackFree(this.vtbl.put_pixelRight)
        CallbackFree(this.vtbl.get_pixelRight)
        CallbackFree(this.vtbl.put_posBottom)
        CallbackFree(this.vtbl.get_posBottom)
        CallbackFree(this.vtbl.put_posRight)
        CallbackFree(this.vtbl.get_posRight)
        CallbackFree(this.vtbl.put_imeMode)
        CallbackFree(this.vtbl.get_imeMode)
        CallbackFree(this.vtbl.put_rubyAlign)
        CallbackFree(this.vtbl.get_rubyAlign)
        CallbackFree(this.vtbl.put_rubyPosition)
        CallbackFree(this.vtbl.get_rubyPosition)
        CallbackFree(this.vtbl.put_rubyOverhang)
        CallbackFree(this.vtbl.get_rubyOverhang)
        CallbackFree(this.vtbl.put_layoutGridChar)
        CallbackFree(this.vtbl.get_layoutGridChar)
        CallbackFree(this.vtbl.put_layoutGridLine)
        CallbackFree(this.vtbl.get_layoutGridLine)
        CallbackFree(this.vtbl.put_layoutGridMode)
        CallbackFree(this.vtbl.get_layoutGridMode)
        CallbackFree(this.vtbl.put_layoutGridType)
        CallbackFree(this.vtbl.get_layoutGridType)
        CallbackFree(this.vtbl.put_layoutGrid)
        CallbackFree(this.vtbl.get_layoutGrid)
        CallbackFree(this.vtbl.put_textAutospace)
        CallbackFree(this.vtbl.get_textAutospace)
        CallbackFree(this.vtbl.put_wordBreak)
        CallbackFree(this.vtbl.get_wordBreak)
        CallbackFree(this.vtbl.put_lineBreak)
        CallbackFree(this.vtbl.get_lineBreak)
        CallbackFree(this.vtbl.put_textJustify)
        CallbackFree(this.vtbl.get_textJustify)
        CallbackFree(this.vtbl.put_textJustifyTrim)
        CallbackFree(this.vtbl.get_textJustifyTrim)
        CallbackFree(this.vtbl.put_textKashida)
        CallbackFree(this.vtbl.get_textKashida)
        CallbackFree(this.vtbl.put_overflowX)
        CallbackFree(this.vtbl.get_overflowX)
        CallbackFree(this.vtbl.put_overflowY)
        CallbackFree(this.vtbl.get_overflowY)
        CallbackFree(this.vtbl.put_accelerator)
        CallbackFree(this.vtbl.get_accelerator)
    }
}
