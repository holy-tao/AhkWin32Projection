#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ITemplatePrinter extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITemplatePrinter
     * @type {Guid}
     */
    static IID => Guid("{3050f6b4-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["startDoc", "stopDoc", "printBlankPage", "printPage", "ensurePrintDialogDefaults", "showPrintDialog", "showPageSetupDialog", "printNonNative", "printNonNativeFrames", "put_framesetDocument", "get_framesetDocument", "put_frameActive", "get_frameActive", "put_frameAsShown", "get_frameAsShown", "put_selection", "get_selection", "put_selectedPages", "get_selectedPages", "put_currentPage", "get_currentPage", "put_currentPageAvail", "get_currentPageAvail", "put_collate", "get_collate", "get_duplex", "put_copies", "get_copies", "put_pageFrom", "get_pageFrom", "put_pageTo", "get_pageTo", "put_tableOfLinks", "get_tableOfLinks", "put_allLinkedDocuments", "get_allLinkedDocuments", "put_header", "get_header", "put_footer", "get_footer", "put_marginLeft", "get_marginLeft", "put_marginRight", "get_marginRight", "put_marginTop", "get_marginTop", "put_marginBottom", "get_marginBottom", "get_pageWidth", "get_pageHeight", "get_unprintableLeft", "get_unprintableTop", "get_unprintableRight", "get_unprintableBottom", "updatePageStatus"]

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

        result := ComCall(7, this, "ptr", bstrTitle, "short*", &p := 0, "HRESULT")
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
        result := ComCall(11, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    showPrintDialog() {
        result := ComCall(12, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    showPageSetupDialog() {
        result := ComCall(13, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {IUnknown} pMarkup 
     * @returns {VARIANT_BOOL} 
     */
    printNonNative(pMarkup) {
        result := ComCall(14, this, "ptr", pMarkup, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {IUnknown} pMarkup 
     * @param {VARIANT_BOOL} fActiveFrame 
     * @returns {HRESULT} 
     */
    printNonNativeFrames(pMarkup, fActiveFrame) {
        result := ComCall(15, this, "ptr", pMarkup, "short", fActiveFrame, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_framesetDocument(v) {
        result := ComCall(16, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_framesetDocument() {
        result := ComCall(17, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_frameActive(v) {
        result := ComCall(18, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_frameActive() {
        result := ComCall(19, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_frameAsShown(v) {
        result := ComCall(20, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_frameAsShown() {
        result := ComCall(21, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_selection(v) {
        result := ComCall(22, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_selection() {
        result := ComCall(23, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_selectedPages(v) {
        result := ComCall(24, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_selectedPages() {
        result := ComCall(25, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_currentPage(v) {
        result := ComCall(26, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_currentPage() {
        result := ComCall(27, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_currentPageAvail(v) {
        result := ComCall(28, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_currentPageAvail() {
        result := ComCall(29, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_collate(v) {
        result := ComCall(30, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_collate() {
        result := ComCall(31, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_duplex() {
        result := ComCall(32, this, "short*", &p := 0, "HRESULT")
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
        result := ComCall(39, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_tableOfLinks() {
        result := ComCall(40, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_allLinkedDocuments(v) {
        result := ComCall(41, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_allLinkedDocuments() {
        result := ComCall(42, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_header(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(43, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_header() {
        p := BSTR()
        result := ComCall(44, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_footer(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(45, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_footer() {
        p := BSTR()
        result := ComCall(46, this, "ptr", p, "HRESULT")
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
}
