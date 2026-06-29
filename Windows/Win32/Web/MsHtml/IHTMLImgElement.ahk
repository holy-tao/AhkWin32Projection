#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLImgElement extends IDispatch {
    /**
     * The interface identifier for IHTMLImgElement
     * @type {Guid}
     */
    static IID := Guid("{3050f240-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLImgElement interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_isMap            : IntPtr
        get_isMap            : IntPtr
        put_useMap           : IntPtr
        get_useMap           : IntPtr
        get_mimeType         : IntPtr
        get_fileSize         : IntPtr
        get_fileCreatedDate  : IntPtr
        get_fileModifiedDate : IntPtr
        get_fileUpdatedDate  : IntPtr
        get_protocol         : IntPtr
        get_href             : IntPtr
        get_nameProp         : IntPtr
        put_border           : IntPtr
        get_border           : IntPtr
        put_vspace           : IntPtr
        get_vspace           : IntPtr
        put_hspace           : IntPtr
        get_hspace           : IntPtr
        put_alt              : IntPtr
        get_alt              : IntPtr
        put_src              : IntPtr
        get_src              : IntPtr
        put_lowsrc           : IntPtr
        get_lowsrc           : IntPtr
        put_vrml             : IntPtr
        get_vrml             : IntPtr
        put_dynsrc           : IntPtr
        get_dynsrc           : IntPtr
        get_readyState       : IntPtr
        get_complete         : IntPtr
        put_loop             : IntPtr
        get_loop             : IntPtr
        put_align            : IntPtr
        get_align            : IntPtr
        put_onload           : IntPtr
        get_onload           : IntPtr
        put_onerror          : IntPtr
        get_onerror          : IntPtr
        put_onabort          : IntPtr
        get_onabort          : IntPtr
        put_name             : IntPtr
        get_name             : IntPtr
        put_width            : IntPtr
        get_width            : IntPtr
        put_height           : IntPtr
        get_height           : IntPtr
        put_start            : IntPtr
        get_start            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLImgElement.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    isMap {
        get => this.get_isMap()
        set => this.put_isMap(value)
    }

    /**
     * @type {BSTR} 
     */
    useMap {
        get => this.get_useMap()
        set => this.put_useMap(value)
    }

    /**
     * @type {BSTR} 
     */
    mimeType {
        get => this.get_mimeType()
    }

    /**
     * @type {BSTR} 
     */
    fileSize {
        get => this.get_fileSize()
    }

    /**
     * @type {BSTR} 
     */
    fileCreatedDate {
        get => this.get_fileCreatedDate()
    }

    /**
     * @type {BSTR} 
     */
    fileModifiedDate {
        get => this.get_fileModifiedDate()
    }

    /**
     * @type {BSTR} 
     */
    fileUpdatedDate {
        get => this.get_fileUpdatedDate()
    }

    /**
     * @type {BSTR} 
     */
    protocol {
        get => this.get_protocol()
    }

    /**
     * @type {BSTR} 
     */
    href {
        get => this.get_href()
    }

    /**
     * @type {BSTR} 
     */
    nameProp {
        get => this.get_nameProp()
    }

    /**
     * @type {VARIANT} 
     */
    border {
        get => this.get_border()
        set => this.put_border(value)
    }

    /**
     * @type {Integer} 
     */
    vspace {
        get => this.get_vspace()
        set => this.put_vspace(value)
    }

    /**
     * @type {Integer} 
     */
    hspace {
        get => this.get_hspace()
        set => this.put_hspace(value)
    }

    /**
     * @type {BSTR} 
     */
    alt {
        get => this.get_alt()
        set => this.put_alt(value)
    }

    /**
     * @type {BSTR} 
     */
    src {
        get => this.get_src()
        set => this.put_src(value)
    }

    /**
     * @type {BSTR} 
     */
    lowsrc {
        get => this.get_lowsrc()
        set => this.put_lowsrc(value)
    }

    /**
     * @type {BSTR} 
     */
    vrml {
        get => this.get_vrml()
        set => this.put_vrml(value)
    }

    /**
     * @type {BSTR} 
     */
    dynsrc {
        get => this.get_dynsrc()
        set => this.put_dynsrc(value)
    }

    /**
     * @type {BSTR} 
     */
    readyState {
        get => this.get_readyState()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    complete {
        get => this.get_complete()
    }

    /**
     * @type {VARIANT} 
     */
    loop {
        get => this.get_loop()
        set => this.put_loop(value)
    }

    /**
     * @type {BSTR} 
     */
    align {
        get => this.get_align()
        set => this.put_align(value)
    }

    /**
     * @type {VARIANT} 
     */
    onload {
        get => this.get_onload()
        set => this.put_onload(value)
    }

    /**
     * @type {VARIANT} 
     */
    onerror {
        get => this.get_onerror()
        set => this.put_onerror(value)
    }

    /**
     * @type {VARIANT} 
     */
    onabort {
        get => this.get_onabort()
        set => this.put_onabort(value)
    }

    /**
     * @type {BSTR} 
     */
    name {
        get => this.get_name()
        set => this.put_name(value)
    }

    /**
     * @type {Integer} 
     */
    width {
        get => this.get_width()
        set => this.put_width(value)
    }

    /**
     * @type {Integer} 
     */
    height {
        get => this.get_height()
        set => this.put_height(value)
    }

    /**
     * @type {BSTR} 
     */
    start {
        get => this.get_start()
        set => this.put_start(value)
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_isMap(v) {
        result := ComCall(7, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_isMap() {
        result := ComCall(8, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_useMap(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(9, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_useMap() {
        p := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_mimeType() {
        p := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_fileSize() {
        p := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_fileCreatedDate() {
        p := BSTR.Owned()
        result := ComCall(13, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_fileModifiedDate() {
        p := BSTR.Owned()
        result := ComCall(14, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_fileUpdatedDate() {
        p := BSTR.Owned()
        result := ComCall(15, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_protocol() {
        p := BSTR.Owned()
        result := ComCall(16, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_href() {
        p := BSTR.Owned()
        result := ComCall(17, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_nameProp() {
        p := BSTR.Owned()
        result := ComCall(18, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_border(v) {
        result := ComCall(19, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_border() {
        p := VARIANT()
        result := ComCall(20, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_vspace(v) {
        result := ComCall(21, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_vspace() {
        result := ComCall(22, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_hspace(v) {
        result := ComCall(23, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_hspace() {
        result := ComCall(24, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_alt(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(25, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_alt() {
        p := BSTR.Owned()
        result := ComCall(26, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_src(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(27, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_src() {
        p := BSTR.Owned()
        result := ComCall(28, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_lowsrc(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(29, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_lowsrc() {
        p := BSTR.Owned()
        result := ComCall(30, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_vrml(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(31, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_vrml() {
        p := BSTR.Owned()
        result := ComCall(32, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_dynsrc(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(33, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_dynsrc() {
        p := BSTR.Owned()
        result := ComCall(34, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_readyState() {
        p := BSTR.Owned()
        result := ComCall(35, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_complete() {
        result := ComCall(36, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_loop(v) {
        result := ComCall(37, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_loop() {
        p := VARIANT()
        result := ComCall(38, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_align(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(39, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_align() {
        p := BSTR.Owned()
        result := ComCall(40, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onload(v) {
        result := ComCall(41, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onload() {
        p := VARIANT()
        result := ComCall(42, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onerror(v) {
        result := ComCall(43, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onerror() {
        p := VARIANT()
        result := ComCall(44, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onabort(v) {
        result := ComCall(45, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onabort() {
        p := VARIANT()
        result := ComCall(46, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_name(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(47, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_name() {
        p := BSTR.Owned()
        result := ComCall(48, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_width(v) {
        result := ComCall(49, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_width() {
        result := ComCall(50, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_height(v) {
        result := ComCall(51, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_height() {
        result := ComCall(52, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_start(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(53, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_start() {
        p := BSTR.Owned()
        result := ComCall(54, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLImgElement.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_isMap := CallbackCreate(GetMethod(implObj, "put_isMap"), flags, 2)
        this.vtbl.get_isMap := CallbackCreate(GetMethod(implObj, "get_isMap"), flags, 2)
        this.vtbl.put_useMap := CallbackCreate(GetMethod(implObj, "put_useMap"), flags, 2)
        this.vtbl.get_useMap := CallbackCreate(GetMethod(implObj, "get_useMap"), flags, 2)
        this.vtbl.get_mimeType := CallbackCreate(GetMethod(implObj, "get_mimeType"), flags, 2)
        this.vtbl.get_fileSize := CallbackCreate(GetMethod(implObj, "get_fileSize"), flags, 2)
        this.vtbl.get_fileCreatedDate := CallbackCreate(GetMethod(implObj, "get_fileCreatedDate"), flags, 2)
        this.vtbl.get_fileModifiedDate := CallbackCreate(GetMethod(implObj, "get_fileModifiedDate"), flags, 2)
        this.vtbl.get_fileUpdatedDate := CallbackCreate(GetMethod(implObj, "get_fileUpdatedDate"), flags, 2)
        this.vtbl.get_protocol := CallbackCreate(GetMethod(implObj, "get_protocol"), flags, 2)
        this.vtbl.get_href := CallbackCreate(GetMethod(implObj, "get_href"), flags, 2)
        this.vtbl.get_nameProp := CallbackCreate(GetMethod(implObj, "get_nameProp"), flags, 2)
        this.vtbl.put_border := CallbackCreate(GetMethod(implObj, "put_border"), flags, 2)
        this.vtbl.get_border := CallbackCreate(GetMethod(implObj, "get_border"), flags, 2)
        this.vtbl.put_vspace := CallbackCreate(GetMethod(implObj, "put_vspace"), flags, 2)
        this.vtbl.get_vspace := CallbackCreate(GetMethod(implObj, "get_vspace"), flags, 2)
        this.vtbl.put_hspace := CallbackCreate(GetMethod(implObj, "put_hspace"), flags, 2)
        this.vtbl.get_hspace := CallbackCreate(GetMethod(implObj, "get_hspace"), flags, 2)
        this.vtbl.put_alt := CallbackCreate(GetMethod(implObj, "put_alt"), flags, 2)
        this.vtbl.get_alt := CallbackCreate(GetMethod(implObj, "get_alt"), flags, 2)
        this.vtbl.put_src := CallbackCreate(GetMethod(implObj, "put_src"), flags, 2)
        this.vtbl.get_src := CallbackCreate(GetMethod(implObj, "get_src"), flags, 2)
        this.vtbl.put_lowsrc := CallbackCreate(GetMethod(implObj, "put_lowsrc"), flags, 2)
        this.vtbl.get_lowsrc := CallbackCreate(GetMethod(implObj, "get_lowsrc"), flags, 2)
        this.vtbl.put_vrml := CallbackCreate(GetMethod(implObj, "put_vrml"), flags, 2)
        this.vtbl.get_vrml := CallbackCreate(GetMethod(implObj, "get_vrml"), flags, 2)
        this.vtbl.put_dynsrc := CallbackCreate(GetMethod(implObj, "put_dynsrc"), flags, 2)
        this.vtbl.get_dynsrc := CallbackCreate(GetMethod(implObj, "get_dynsrc"), flags, 2)
        this.vtbl.get_readyState := CallbackCreate(GetMethod(implObj, "get_readyState"), flags, 2)
        this.vtbl.get_complete := CallbackCreate(GetMethod(implObj, "get_complete"), flags, 2)
        this.vtbl.put_loop := CallbackCreate(GetMethod(implObj, "put_loop"), flags, 2)
        this.vtbl.get_loop := CallbackCreate(GetMethod(implObj, "get_loop"), flags, 2)
        this.vtbl.put_align := CallbackCreate(GetMethod(implObj, "put_align"), flags, 2)
        this.vtbl.get_align := CallbackCreate(GetMethod(implObj, "get_align"), flags, 2)
        this.vtbl.put_onload := CallbackCreate(GetMethod(implObj, "put_onload"), flags, 2)
        this.vtbl.get_onload := CallbackCreate(GetMethod(implObj, "get_onload"), flags, 2)
        this.vtbl.put_onerror := CallbackCreate(GetMethod(implObj, "put_onerror"), flags, 2)
        this.vtbl.get_onerror := CallbackCreate(GetMethod(implObj, "get_onerror"), flags, 2)
        this.vtbl.put_onabort := CallbackCreate(GetMethod(implObj, "put_onabort"), flags, 2)
        this.vtbl.get_onabort := CallbackCreate(GetMethod(implObj, "get_onabort"), flags, 2)
        this.vtbl.put_name := CallbackCreate(GetMethod(implObj, "put_name"), flags, 2)
        this.vtbl.get_name := CallbackCreate(GetMethod(implObj, "get_name"), flags, 2)
        this.vtbl.put_width := CallbackCreate(GetMethod(implObj, "put_width"), flags, 2)
        this.vtbl.get_width := CallbackCreate(GetMethod(implObj, "get_width"), flags, 2)
        this.vtbl.put_height := CallbackCreate(GetMethod(implObj, "put_height"), flags, 2)
        this.vtbl.get_height := CallbackCreate(GetMethod(implObj, "get_height"), flags, 2)
        this.vtbl.put_start := CallbackCreate(GetMethod(implObj, "put_start"), flags, 2)
        this.vtbl.get_start := CallbackCreate(GetMethod(implObj, "get_start"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_isMap)
        CallbackFree(this.vtbl.get_isMap)
        CallbackFree(this.vtbl.put_useMap)
        CallbackFree(this.vtbl.get_useMap)
        CallbackFree(this.vtbl.get_mimeType)
        CallbackFree(this.vtbl.get_fileSize)
        CallbackFree(this.vtbl.get_fileCreatedDate)
        CallbackFree(this.vtbl.get_fileModifiedDate)
        CallbackFree(this.vtbl.get_fileUpdatedDate)
        CallbackFree(this.vtbl.get_protocol)
        CallbackFree(this.vtbl.get_href)
        CallbackFree(this.vtbl.get_nameProp)
        CallbackFree(this.vtbl.put_border)
        CallbackFree(this.vtbl.get_border)
        CallbackFree(this.vtbl.put_vspace)
        CallbackFree(this.vtbl.get_vspace)
        CallbackFree(this.vtbl.put_hspace)
        CallbackFree(this.vtbl.get_hspace)
        CallbackFree(this.vtbl.put_alt)
        CallbackFree(this.vtbl.get_alt)
        CallbackFree(this.vtbl.put_src)
        CallbackFree(this.vtbl.get_src)
        CallbackFree(this.vtbl.put_lowsrc)
        CallbackFree(this.vtbl.get_lowsrc)
        CallbackFree(this.vtbl.put_vrml)
        CallbackFree(this.vtbl.get_vrml)
        CallbackFree(this.vtbl.put_dynsrc)
        CallbackFree(this.vtbl.get_dynsrc)
        CallbackFree(this.vtbl.get_readyState)
        CallbackFree(this.vtbl.get_complete)
        CallbackFree(this.vtbl.put_loop)
        CallbackFree(this.vtbl.get_loop)
        CallbackFree(this.vtbl.put_align)
        CallbackFree(this.vtbl.get_align)
        CallbackFree(this.vtbl.put_onload)
        CallbackFree(this.vtbl.get_onload)
        CallbackFree(this.vtbl.put_onerror)
        CallbackFree(this.vtbl.get_onerror)
        CallbackFree(this.vtbl.put_onabort)
        CallbackFree(this.vtbl.get_onabort)
        CallbackFree(this.vtbl.put_name)
        CallbackFree(this.vtbl.get_name)
        CallbackFree(this.vtbl.put_width)
        CallbackFree(this.vtbl.get_width)
        CallbackFree(this.vtbl.put_height)
        CallbackFree(this.vtbl.get_height)
        CallbackFree(this.vtbl.put_start)
        CallbackFree(this.vtbl.get_start)
    }
}
