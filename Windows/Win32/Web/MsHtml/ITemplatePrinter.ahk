#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct ITemplatePrinter extends IDispatch {
    /**
     * The interface identifier for ITemplatePrinter
     * @type {Guid}
     */
    static IID := Guid("{3050f6b4-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITemplatePrinter interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        startDoc                  : IntPtr
        stopDoc                   : IntPtr
        printBlankPage            : IntPtr
        printPage                 : IntPtr
        ensurePrintDialogDefaults : IntPtr
        showPrintDialog           : IntPtr
        showPageSetupDialog       : IntPtr
        printNonNative            : IntPtr
        printNonNativeFrames      : IntPtr
        put_framesetDocument      : IntPtr
        get_framesetDocument      : IntPtr
        put_frameActive           : IntPtr
        get_frameActive           : IntPtr
        put_frameAsShown          : IntPtr
        get_frameAsShown          : IntPtr
        put_selection             : IntPtr
        get_selection             : IntPtr
        put_selectedPages         : IntPtr
        get_selectedPages         : IntPtr
        put_currentPage           : IntPtr
        get_currentPage           : IntPtr
        put_currentPageAvail      : IntPtr
        get_currentPageAvail      : IntPtr
        put_collate               : IntPtr
        get_collate               : IntPtr
        get_duplex                : IntPtr
        put_copies                : IntPtr
        get_copies                : IntPtr
        put_pageFrom              : IntPtr
        get_pageFrom              : IntPtr
        put_pageTo                : IntPtr
        get_pageTo                : IntPtr
        put_tableOfLinks          : IntPtr
        get_tableOfLinks          : IntPtr
        put_allLinkedDocuments    : IntPtr
        get_allLinkedDocuments    : IntPtr
        put_header                : IntPtr
        get_header                : IntPtr
        put_footer                : IntPtr
        get_footer                : IntPtr
        put_marginLeft            : IntPtr
        get_marginLeft            : IntPtr
        put_marginRight           : IntPtr
        get_marginRight           : IntPtr
        put_marginTop             : IntPtr
        get_marginTop             : IntPtr
        put_marginBottom          : IntPtr
        get_marginBottom          : IntPtr
        get_pageWidth             : IntPtr
        get_pageHeight            : IntPtr
        get_unprintableLeft       : IntPtr
        get_unprintableTop        : IntPtr
        get_unprintableRight      : IntPtr
        get_unprintableBottom     : IntPtr
        updatePageStatus          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITemplatePrinter.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    framesetDocument {
        get => this.get_framesetDocument()
        set => this.put_framesetDocument(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    frameActive {
        get => this.get_frameActive()
        set => this.put_frameActive(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    frameAsShown {
        get => this.get_frameAsShown()
        set => this.put_frameAsShown(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    selection {
        get => this.get_selection()
        set => this.put_selection(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    selectedPages {
        get => this.get_selectedPages()
        set => this.put_selectedPages(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    currentPage {
        get => this.get_currentPage()
        set => this.put_currentPage(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    currentPageAvail {
        get => this.get_currentPageAvail()
        set => this.put_currentPageAvail(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    collate {
        get => this.get_collate()
        set => this.put_collate(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    duplex {
        get => this.get_duplex()
    }

    /**
     * @type {Integer} 
     */
    copies {
        get => this.get_copies()
        set => this.put_copies(value)
    }

    /**
     * @type {Integer} 
     */
    pageFrom {
        get => this.get_pageFrom()
        set => this.put_pageFrom(value)
    }

    /**
     * @type {Integer} 
     */
    pageTo {
        get => this.get_pageTo()
        set => this.put_pageTo(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    tableOfLinks {
        get => this.get_tableOfLinks()
        set => this.put_tableOfLinks(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    allLinkedDocuments {
        get => this.get_allLinkedDocuments()
        set => this.put_allLinkedDocuments(value)
    }

    /**
     * @type {BSTR} 
     */
    header {
        get => this.get_header()
        set => this.put_header(value)
    }

    /**
     * @type {BSTR} 
     */
    footer {
        get => this.get_footer()
        set => this.put_footer(value)
    }

    /**
     * @type {Integer} 
     */
    marginLeft {
        get => this.get_marginLeft()
        set => this.put_marginLeft(value)
    }

    /**
     * @type {Integer} 
     */
    marginRight {
        get => this.get_marginRight()
        set => this.put_marginRight(value)
    }

    /**
     * @type {Integer} 
     */
    marginTop {
        get => this.get_marginTop()
        set => this.put_marginTop(value)
    }

    /**
     * @type {Integer} 
     */
    marginBottom {
        get => this.get_marginBottom()
        set => this.put_marginBottom(value)
    }

    /**
     * @type {Integer} 
     */
    pageWidth {
        get => this.get_pageWidth()
    }

    /**
     * @type {Integer} 
     */
    pageHeight {
        get => this.get_pageHeight()
    }

    /**
     * @type {Integer} 
     */
    unprintableLeft {
        get => this.get_unprintableLeft()
    }

    /**
     * @type {Integer} 
     */
    unprintableTop {
        get => this.get_unprintableTop()
    }

    /**
     * @type {Integer} 
     */
    unprintableRight {
        get => this.get_unprintableRight()
    }

    /**
     * @type {Integer} 
     */
    unprintableBottom {
        get => this.get_unprintableBottom()
    }

    /**
     * 
     * @param {BSTR} bstrTitle 
     * @returns {VARIANT_BOOL} 
     */
    startDoc(bstrTitle) {
        bstrTitle := bstrTitle is String ? BSTR.Alloc(bstrTitle).Value : bstrTitle

        result := ComCall(7, this, BSTR, bstrTitle, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    stopDoc() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    printBlankPage() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDispatch} pElemDisp 
     * @returns {HRESULT} 
     */
    printPage(pElemDisp) {
        result := ComCall(10, this, "ptr", pElemDisp, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    ensurePrintDialogDefaults() {
        result := ComCall(11, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    showPrintDialog() {
        result := ComCall(12, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    showPageSetupDialog() {
        result := ComCall(13, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {IUnknown} pMarkup 
     * @returns {VARIANT_BOOL} 
     */
    printNonNative(pMarkup) {
        result := ComCall(14, this, "ptr", pMarkup, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {IUnknown} pMarkup 
     * @param {VARIANT_BOOL} fActiveFrame 
     * @returns {HRESULT} 
     */
    printNonNativeFrames(pMarkup, fActiveFrame) {
        result := ComCall(15, this, "ptr", pMarkup, VARIANT_BOOL, fActiveFrame, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_framesetDocument(v) {
        result := ComCall(16, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_framesetDocument() {
        result := ComCall(17, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_frameActive(v) {
        result := ComCall(18, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_frameActive() {
        result := ComCall(19, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_frameAsShown(v) {
        result := ComCall(20, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_frameAsShown() {
        result := ComCall(21, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_selection(v) {
        result := ComCall(22, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_selection() {
        result := ComCall(23, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_selectedPages(v) {
        result := ComCall(24, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_selectedPages() {
        result := ComCall(25, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_currentPage(v) {
        result := ComCall(26, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_currentPage() {
        result := ComCall(27, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_currentPageAvail(v) {
        result := ComCall(28, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_currentPageAvail() {
        result := ComCall(29, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_collate(v) {
        result := ComCall(30, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_collate() {
        result := ComCall(31, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_duplex() {
        result := ComCall(32, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_copies(v) {
        result := ComCall(33, this, "ushort", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_copies() {
        result := ComCall(34, this, "ushort*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_pageFrom(v) {
        result := ComCall(35, this, "ushort", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_pageFrom() {
        result := ComCall(36, this, "ushort*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_pageTo(v) {
        result := ComCall(37, this, "ushort", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_pageTo() {
        result := ComCall(38, this, "ushort*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_tableOfLinks(v) {
        result := ComCall(39, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_tableOfLinks() {
        result := ComCall(40, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_allLinkedDocuments(v) {
        result := ComCall(41, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_allLinkedDocuments() {
        result := ComCall(42, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_header(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(43, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_header() {
        p := BSTR.Owned()
        result := ComCall(44, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_footer(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(45, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_footer() {
        p := BSTR.Owned()
        result := ComCall(46, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_marginLeft(v) {
        result := ComCall(47, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_marginLeft() {
        result := ComCall(48, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_marginRight(v) {
        result := ComCall(49, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_marginRight() {
        result := ComCall(50, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_marginTop(v) {
        result := ComCall(51, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_marginTop() {
        result := ComCall(52, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_marginBottom(v) {
        result := ComCall(53, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_marginBottom() {
        result := ComCall(54, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_pageWidth() {
        result := ComCall(55, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_pageHeight() {
        result := ComCall(56, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_unprintableLeft() {
        result := ComCall(57, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_unprintableTop() {
        result := ComCall(58, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_unprintableRight() {
        result := ComCall(59, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_unprintableBottom() {
        result := ComCall(60, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    updatePageStatus(p) {
        pMarshal := p is VarRef ? "int*" : "ptr"

        result := ComCall(61, this, pMarshal, p, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITemplatePrinter.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.startDoc := CallbackCreate(GetMethod(implObj, "startDoc"), flags, 3)
        this.vtbl.stopDoc := CallbackCreate(GetMethod(implObj, "stopDoc"), flags, 1)
        this.vtbl.printBlankPage := CallbackCreate(GetMethod(implObj, "printBlankPage"), flags, 1)
        this.vtbl.printPage := CallbackCreate(GetMethod(implObj, "printPage"), flags, 2)
        this.vtbl.ensurePrintDialogDefaults := CallbackCreate(GetMethod(implObj, "ensurePrintDialogDefaults"), flags, 2)
        this.vtbl.showPrintDialog := CallbackCreate(GetMethod(implObj, "showPrintDialog"), flags, 2)
        this.vtbl.showPageSetupDialog := CallbackCreate(GetMethod(implObj, "showPageSetupDialog"), flags, 2)
        this.vtbl.printNonNative := CallbackCreate(GetMethod(implObj, "printNonNative"), flags, 3)
        this.vtbl.printNonNativeFrames := CallbackCreate(GetMethod(implObj, "printNonNativeFrames"), flags, 3)
        this.vtbl.put_framesetDocument := CallbackCreate(GetMethod(implObj, "put_framesetDocument"), flags, 2)
        this.vtbl.get_framesetDocument := CallbackCreate(GetMethod(implObj, "get_framesetDocument"), flags, 2)
        this.vtbl.put_frameActive := CallbackCreate(GetMethod(implObj, "put_frameActive"), flags, 2)
        this.vtbl.get_frameActive := CallbackCreate(GetMethod(implObj, "get_frameActive"), flags, 2)
        this.vtbl.put_frameAsShown := CallbackCreate(GetMethod(implObj, "put_frameAsShown"), flags, 2)
        this.vtbl.get_frameAsShown := CallbackCreate(GetMethod(implObj, "get_frameAsShown"), flags, 2)
        this.vtbl.put_selection := CallbackCreate(GetMethod(implObj, "put_selection"), flags, 2)
        this.vtbl.get_selection := CallbackCreate(GetMethod(implObj, "get_selection"), flags, 2)
        this.vtbl.put_selectedPages := CallbackCreate(GetMethod(implObj, "put_selectedPages"), flags, 2)
        this.vtbl.get_selectedPages := CallbackCreate(GetMethod(implObj, "get_selectedPages"), flags, 2)
        this.vtbl.put_currentPage := CallbackCreate(GetMethod(implObj, "put_currentPage"), flags, 2)
        this.vtbl.get_currentPage := CallbackCreate(GetMethod(implObj, "get_currentPage"), flags, 2)
        this.vtbl.put_currentPageAvail := CallbackCreate(GetMethod(implObj, "put_currentPageAvail"), flags, 2)
        this.vtbl.get_currentPageAvail := CallbackCreate(GetMethod(implObj, "get_currentPageAvail"), flags, 2)
        this.vtbl.put_collate := CallbackCreate(GetMethod(implObj, "put_collate"), flags, 2)
        this.vtbl.get_collate := CallbackCreate(GetMethod(implObj, "get_collate"), flags, 2)
        this.vtbl.get_duplex := CallbackCreate(GetMethod(implObj, "get_duplex"), flags, 2)
        this.vtbl.put_copies := CallbackCreate(GetMethod(implObj, "put_copies"), flags, 2)
        this.vtbl.get_copies := CallbackCreate(GetMethod(implObj, "get_copies"), flags, 2)
        this.vtbl.put_pageFrom := CallbackCreate(GetMethod(implObj, "put_pageFrom"), flags, 2)
        this.vtbl.get_pageFrom := CallbackCreate(GetMethod(implObj, "get_pageFrom"), flags, 2)
        this.vtbl.put_pageTo := CallbackCreate(GetMethod(implObj, "put_pageTo"), flags, 2)
        this.vtbl.get_pageTo := CallbackCreate(GetMethod(implObj, "get_pageTo"), flags, 2)
        this.vtbl.put_tableOfLinks := CallbackCreate(GetMethod(implObj, "put_tableOfLinks"), flags, 2)
        this.vtbl.get_tableOfLinks := CallbackCreate(GetMethod(implObj, "get_tableOfLinks"), flags, 2)
        this.vtbl.put_allLinkedDocuments := CallbackCreate(GetMethod(implObj, "put_allLinkedDocuments"), flags, 2)
        this.vtbl.get_allLinkedDocuments := CallbackCreate(GetMethod(implObj, "get_allLinkedDocuments"), flags, 2)
        this.vtbl.put_header := CallbackCreate(GetMethod(implObj, "put_header"), flags, 2)
        this.vtbl.get_header := CallbackCreate(GetMethod(implObj, "get_header"), flags, 2)
        this.vtbl.put_footer := CallbackCreate(GetMethod(implObj, "put_footer"), flags, 2)
        this.vtbl.get_footer := CallbackCreate(GetMethod(implObj, "get_footer"), flags, 2)
        this.vtbl.put_marginLeft := CallbackCreate(GetMethod(implObj, "put_marginLeft"), flags, 2)
        this.vtbl.get_marginLeft := CallbackCreate(GetMethod(implObj, "get_marginLeft"), flags, 2)
        this.vtbl.put_marginRight := CallbackCreate(GetMethod(implObj, "put_marginRight"), flags, 2)
        this.vtbl.get_marginRight := CallbackCreate(GetMethod(implObj, "get_marginRight"), flags, 2)
        this.vtbl.put_marginTop := CallbackCreate(GetMethod(implObj, "put_marginTop"), flags, 2)
        this.vtbl.get_marginTop := CallbackCreate(GetMethod(implObj, "get_marginTop"), flags, 2)
        this.vtbl.put_marginBottom := CallbackCreate(GetMethod(implObj, "put_marginBottom"), flags, 2)
        this.vtbl.get_marginBottom := CallbackCreate(GetMethod(implObj, "get_marginBottom"), flags, 2)
        this.vtbl.get_pageWidth := CallbackCreate(GetMethod(implObj, "get_pageWidth"), flags, 2)
        this.vtbl.get_pageHeight := CallbackCreate(GetMethod(implObj, "get_pageHeight"), flags, 2)
        this.vtbl.get_unprintableLeft := CallbackCreate(GetMethod(implObj, "get_unprintableLeft"), flags, 2)
        this.vtbl.get_unprintableTop := CallbackCreate(GetMethod(implObj, "get_unprintableTop"), flags, 2)
        this.vtbl.get_unprintableRight := CallbackCreate(GetMethod(implObj, "get_unprintableRight"), flags, 2)
        this.vtbl.get_unprintableBottom := CallbackCreate(GetMethod(implObj, "get_unprintableBottom"), flags, 2)
        this.vtbl.updatePageStatus := CallbackCreate(GetMethod(implObj, "updatePageStatus"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.startDoc)
        CallbackFree(this.vtbl.stopDoc)
        CallbackFree(this.vtbl.printBlankPage)
        CallbackFree(this.vtbl.printPage)
        CallbackFree(this.vtbl.ensurePrintDialogDefaults)
        CallbackFree(this.vtbl.showPrintDialog)
        CallbackFree(this.vtbl.showPageSetupDialog)
        CallbackFree(this.vtbl.printNonNative)
        CallbackFree(this.vtbl.printNonNativeFrames)
        CallbackFree(this.vtbl.put_framesetDocument)
        CallbackFree(this.vtbl.get_framesetDocument)
        CallbackFree(this.vtbl.put_frameActive)
        CallbackFree(this.vtbl.get_frameActive)
        CallbackFree(this.vtbl.put_frameAsShown)
        CallbackFree(this.vtbl.get_frameAsShown)
        CallbackFree(this.vtbl.put_selection)
        CallbackFree(this.vtbl.get_selection)
        CallbackFree(this.vtbl.put_selectedPages)
        CallbackFree(this.vtbl.get_selectedPages)
        CallbackFree(this.vtbl.put_currentPage)
        CallbackFree(this.vtbl.get_currentPage)
        CallbackFree(this.vtbl.put_currentPageAvail)
        CallbackFree(this.vtbl.get_currentPageAvail)
        CallbackFree(this.vtbl.put_collate)
        CallbackFree(this.vtbl.get_collate)
        CallbackFree(this.vtbl.get_duplex)
        CallbackFree(this.vtbl.put_copies)
        CallbackFree(this.vtbl.get_copies)
        CallbackFree(this.vtbl.put_pageFrom)
        CallbackFree(this.vtbl.get_pageFrom)
        CallbackFree(this.vtbl.put_pageTo)
        CallbackFree(this.vtbl.get_pageTo)
        CallbackFree(this.vtbl.put_tableOfLinks)
        CallbackFree(this.vtbl.get_tableOfLinks)
        CallbackFree(this.vtbl.put_allLinkedDocuments)
        CallbackFree(this.vtbl.get_allLinkedDocuments)
        CallbackFree(this.vtbl.put_header)
        CallbackFree(this.vtbl.get_header)
        CallbackFree(this.vtbl.put_footer)
        CallbackFree(this.vtbl.get_footer)
        CallbackFree(this.vtbl.put_marginLeft)
        CallbackFree(this.vtbl.get_marginLeft)
        CallbackFree(this.vtbl.put_marginRight)
        CallbackFree(this.vtbl.get_marginRight)
        CallbackFree(this.vtbl.put_marginTop)
        CallbackFree(this.vtbl.get_marginTop)
        CallbackFree(this.vtbl.put_marginBottom)
        CallbackFree(this.vtbl.get_marginBottom)
        CallbackFree(this.vtbl.get_pageWidth)
        CallbackFree(this.vtbl.get_pageHeight)
        CallbackFree(this.vtbl.get_unprintableLeft)
        CallbackFree(this.vtbl.get_unprintableTop)
        CallbackFree(this.vtbl.get_unprintableRight)
        CallbackFree(this.vtbl.get_unprintableBottom)
        CallbackFree(this.vtbl.updatePageStatus)
    }
}
