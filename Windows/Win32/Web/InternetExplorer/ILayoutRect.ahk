#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
export default struct ILayoutRect extends IDispatch {
    /**
     * The interface identifier for ILayoutRect
     * @type {Guid}
     */
    static IID := Guid("{3050f665-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ILayoutRect interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_nextRect        : IntPtr
        get_nextRect        : IntPtr
        put_contentSrc      : IntPtr
        get_contentSrc      : IntPtr
        put_honorPageBreaks : IntPtr
        get_honorPageBreaks : IntPtr
        put_honorPageRules  : IntPtr
        get_honorPageRules  : IntPtr
        put_nextRectElement : IntPtr
        get_nextRectElement : IntPtr
        get_contentDocument : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ILayoutRect.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    nextRect {
        get => this.get_nextRect()
        set => this.put_nextRect(value)
    }

    /**
     * @type {VARIANT} 
     */
    contentSrc {
        get => this.get_contentSrc()
        set => this.put_contentSrc(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    honorPageBreaks {
        get => this.get_honorPageBreaks()
        set => this.put_honorPageBreaks(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    honorPageRules {
        get => this.get_honorPageRules()
        set => this.put_honorPageRules(value)
    }

    /**
     * @type {IDispatch} 
     */
    nextRectElement {
        get => this.get_nextRectElement()
        set => this.put_nextRectElement(value)
    }

    /**
     * @type {IDispatch} 
     */
    contentDocument {
        get => this.get_contentDocument()
    }

    /**
     * 
     * @param {BSTR} bstrElementId 
     * @returns {HRESULT} 
     */
    put_nextRect(bstrElementId) {
        bstrElementId := bstrElementId is String ? BSTR.Alloc(bstrElementId).Value : bstrElementId

        result := ComCall(7, this, BSTR, bstrElementId, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_nextRect() {
        pbstrElementId := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, pbstrElementId, "HRESULT")
        return pbstrElementId
    }

    /**
     * 
     * @param {VARIANT} varContentSrc 
     * @returns {HRESULT} 
     */
    put_contentSrc(varContentSrc) {
        result := ComCall(9, this, VARIANT, varContentSrc, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_contentSrc() {
        pvarContentSrc := VARIANT()
        result := ComCall(10, this, VARIANT.Ptr, pvarContentSrc, "HRESULT")
        return pvarContentSrc
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_honorPageBreaks(v) {
        result := ComCall(11, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_honorPageBreaks() {
        result := ComCall(12, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_honorPageRules(v) {
        result := ComCall(13, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_honorPageRules() {
        result := ComCall(14, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {IDispatch} pElem 
     * @returns {HRESULT} 
     */
    put_nextRectElement(pElem) {
        result := ComCall(15, this, "ptr", pElem, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_nextRectElement() {
        result := ComCall(16, this, "ptr*", &ppElem := 0, "HRESULT")
        return IDispatch(ppElem)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_contentDocument() {
        result := ComCall(17, this, "ptr*", &pDoc := 0, "HRESULT")
        return IDispatch(pDoc)
    }

    Query(iid) {
        if (ILayoutRect.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_nextRect := CallbackCreate(GetMethod(implObj, "put_nextRect"), flags, 2)
        this.vtbl.get_nextRect := CallbackCreate(GetMethod(implObj, "get_nextRect"), flags, 2)
        this.vtbl.put_contentSrc := CallbackCreate(GetMethod(implObj, "put_contentSrc"), flags, 2)
        this.vtbl.get_contentSrc := CallbackCreate(GetMethod(implObj, "get_contentSrc"), flags, 2)
        this.vtbl.put_honorPageBreaks := CallbackCreate(GetMethod(implObj, "put_honorPageBreaks"), flags, 2)
        this.vtbl.get_honorPageBreaks := CallbackCreate(GetMethod(implObj, "get_honorPageBreaks"), flags, 2)
        this.vtbl.put_honorPageRules := CallbackCreate(GetMethod(implObj, "put_honorPageRules"), flags, 2)
        this.vtbl.get_honorPageRules := CallbackCreate(GetMethod(implObj, "get_honorPageRules"), flags, 2)
        this.vtbl.put_nextRectElement := CallbackCreate(GetMethod(implObj, "put_nextRectElement"), flags, 2)
        this.vtbl.get_nextRectElement := CallbackCreate(GetMethod(implObj, "get_nextRectElement"), flags, 2)
        this.vtbl.get_contentDocument := CallbackCreate(GetMethod(implObj, "get_contentDocument"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_nextRect)
        CallbackFree(this.vtbl.get_nextRect)
        CallbackFree(this.vtbl.put_contentSrc)
        CallbackFree(this.vtbl.get_contentSrc)
        CallbackFree(this.vtbl.put_honorPageBreaks)
        CallbackFree(this.vtbl.get_honorPageBreaks)
        CallbackFree(this.vtbl.put_honorPageRules)
        CallbackFree(this.vtbl.get_honorPageRules)
        CallbackFree(this.vtbl.put_nextRectElement)
        CallbackFree(this.vtbl.get_nextRectElement)
        CallbackFree(this.vtbl.get_contentDocument)
    }
}
