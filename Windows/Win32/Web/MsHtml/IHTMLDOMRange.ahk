#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\IHTMLRectCollection.ahk" { IHTMLRectCollection }
#Import ".\IHTMLRect.ahk" { IHTMLRect }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\IHTMLDOMNode.ahk" { IHTMLDOMNode }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLDOMRange extends IDispatch {
    /**
     * The interface identifier for IHTMLDOMRange
     * @type {Guid}
     */
    static IID := Guid("{305104ae-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLDOMRange
     * @type {Guid}
     */
    static CLSID := Guid("{305106c3-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLDOMRange interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_startContainer          : IntPtr
        get_startOffset             : IntPtr
        get_endContainer            : IntPtr
        get_endOffset               : IntPtr
        get_collapsed               : IntPtr
        get_commonAncestorContainer : IntPtr
        setStart                    : IntPtr
        setEnd                      : IntPtr
        setStartBefore              : IntPtr
        setStartAfter               : IntPtr
        setEndBefore                : IntPtr
        setEndAfter                 : IntPtr
        collapse                    : IntPtr
        selectNode                  : IntPtr
        selectNodeContents          : IntPtr
        compareBoundaryPoints       : IntPtr
        deleteContents              : IntPtr
        extractContents             : IntPtr
        cloneContents               : IntPtr
        insertNode                  : IntPtr
        surroundContents            : IntPtr
        cloneRange                  : IntPtr
        toString                    : IntPtr
        detach                      : IntPtr
        getClientRects              : IntPtr
        getBoundingClientRect       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLDOMRange.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IHTMLDOMNode} 
     */
    startContainer {
        get => this.get_startContainer()
    }

    /**
     * @type {Integer} 
     */
    startOffset {
        get => this.get_startOffset()
    }

    /**
     * @type {IHTMLDOMNode} 
     */
    endContainer {
        get => this.get_endContainer()
    }

    /**
     * @type {Integer} 
     */
    endOffset {
        get => this.get_endOffset()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    collapsed {
        get => this.get_collapsed()
    }

    /**
     * @type {IHTMLDOMNode} 
     */
    commonAncestorContainer {
        get => this.get_commonAncestorContainer()
    }

    /**
     * 
     * @returns {IHTMLDOMNode} 
     */
    get_startContainer() {
        result := ComCall(7, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLDOMNode(p)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_startOffset() {
        result := ComCall(8, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IHTMLDOMNode} 
     */
    get_endContainer() {
        result := ComCall(9, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLDOMNode(p)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_endOffset() {
        result := ComCall(10, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_collapsed() {
        result := ComCall(11, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IHTMLDOMNode} 
     */
    get_commonAncestorContainer() {
        result := ComCall(12, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLDOMNode(p)
    }

    /**
     * 
     * @param {IDispatch} refNode 
     * @param {Integer} offset 
     * @returns {HRESULT} 
     */
    setStart(refNode, offset) {
        result := ComCall(13, this, "ptr", refNode, "int", offset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDispatch} refNode 
     * @param {Integer} offset 
     * @returns {HRESULT} 
     */
    setEnd(refNode, offset) {
        result := ComCall(14, this, "ptr", refNode, "int", offset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDispatch} refNode 
     * @returns {HRESULT} 
     */
    setStartBefore(refNode) {
        result := ComCall(15, this, "ptr", refNode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDispatch} refNode 
     * @returns {HRESULT} 
     */
    setStartAfter(refNode) {
        result := ComCall(16, this, "ptr", refNode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDispatch} refNode 
     * @returns {HRESULT} 
     */
    setEndBefore(refNode) {
        result := ComCall(17, this, "ptr", refNode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDispatch} refNode 
     * @returns {HRESULT} 
     */
    setEndAfter(refNode) {
        result := ComCall(18, this, "ptr", refNode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} toStart 
     * @returns {HRESULT} 
     */
    collapse(toStart) {
        result := ComCall(19, this, VARIANT_BOOL, toStart, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDispatch} refNode 
     * @returns {HRESULT} 
     */
    selectNode(refNode) {
        result := ComCall(20, this, "ptr", refNode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDispatch} refNode 
     * @returns {HRESULT} 
     */
    selectNodeContents(refNode) {
        result := ComCall(21, this, "ptr", refNode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} how 
     * @param {IDispatch} sourceRange 
     * @returns {Integer} 
     */
    compareBoundaryPoints(how, sourceRange) {
        result := ComCall(22, this, "short", how, "ptr", sourceRange, "int*", &compareResult := 0, "HRESULT")
        return compareResult
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    deleteContents() {
        result := ComCall(23, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    extractContents() {
        result := ComCall(24, this, "ptr*", &ppDocumentFragment := 0, "HRESULT")
        return IDispatch(ppDocumentFragment)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    cloneContents() {
        result := ComCall(25, this, "ptr*", &ppDocumentFragment := 0, "HRESULT")
        return IDispatch(ppDocumentFragment)
    }

    /**
     * 
     * @param {IDispatch} newNode 
     * @returns {HRESULT} 
     */
    insertNode(newNode) {
        result := ComCall(26, this, "ptr", newNode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDispatch} newParent 
     * @returns {HRESULT} 
     */
    surroundContents(newParent) {
        result := ComCall(27, this, "ptr", newParent, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IHTMLDOMRange} 
     */
    cloneRange() {
        result := ComCall(28, this, "ptr*", &ppClonedRange := 0, "HRESULT")
        return IHTMLDOMRange(ppClonedRange)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    toString() {
        pRangeString := BSTR.Owned()
        result := ComCall(29, this, BSTR.Ptr, pRangeString, "HRESULT")
        return pRangeString
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    detach() {
        result := ComCall(30, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IHTMLRectCollection} 
     */
    getClientRects() {
        result := ComCall(31, this, "ptr*", &ppRectCol := 0, "HRESULT")
        return IHTMLRectCollection(ppRectCol)
    }

    /**
     * 
     * @returns {IHTMLRect} 
     */
    getBoundingClientRect() {
        result := ComCall(32, this, "ptr*", &ppRect := 0, "HRESULT")
        return IHTMLRect(ppRect)
    }

    Query(iid) {
        if (IHTMLDOMRange.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_startContainer := CallbackCreate(GetMethod(implObj, "get_startContainer"), flags, 2)
        this.vtbl.get_startOffset := CallbackCreate(GetMethod(implObj, "get_startOffset"), flags, 2)
        this.vtbl.get_endContainer := CallbackCreate(GetMethod(implObj, "get_endContainer"), flags, 2)
        this.vtbl.get_endOffset := CallbackCreate(GetMethod(implObj, "get_endOffset"), flags, 2)
        this.vtbl.get_collapsed := CallbackCreate(GetMethod(implObj, "get_collapsed"), flags, 2)
        this.vtbl.get_commonAncestorContainer := CallbackCreate(GetMethod(implObj, "get_commonAncestorContainer"), flags, 2)
        this.vtbl.setStart := CallbackCreate(GetMethod(implObj, "setStart"), flags, 3)
        this.vtbl.setEnd := CallbackCreate(GetMethod(implObj, "setEnd"), flags, 3)
        this.vtbl.setStartBefore := CallbackCreate(GetMethod(implObj, "setStartBefore"), flags, 2)
        this.vtbl.setStartAfter := CallbackCreate(GetMethod(implObj, "setStartAfter"), flags, 2)
        this.vtbl.setEndBefore := CallbackCreate(GetMethod(implObj, "setEndBefore"), flags, 2)
        this.vtbl.setEndAfter := CallbackCreate(GetMethod(implObj, "setEndAfter"), flags, 2)
        this.vtbl.collapse := CallbackCreate(GetMethod(implObj, "collapse"), flags, 2)
        this.vtbl.selectNode := CallbackCreate(GetMethod(implObj, "selectNode"), flags, 2)
        this.vtbl.selectNodeContents := CallbackCreate(GetMethod(implObj, "selectNodeContents"), flags, 2)
        this.vtbl.compareBoundaryPoints := CallbackCreate(GetMethod(implObj, "compareBoundaryPoints"), flags, 4)
        this.vtbl.deleteContents := CallbackCreate(GetMethod(implObj, "deleteContents"), flags, 1)
        this.vtbl.extractContents := CallbackCreate(GetMethod(implObj, "extractContents"), flags, 2)
        this.vtbl.cloneContents := CallbackCreate(GetMethod(implObj, "cloneContents"), flags, 2)
        this.vtbl.insertNode := CallbackCreate(GetMethod(implObj, "insertNode"), flags, 2)
        this.vtbl.surroundContents := CallbackCreate(GetMethod(implObj, "surroundContents"), flags, 2)
        this.vtbl.cloneRange := CallbackCreate(GetMethod(implObj, "cloneRange"), flags, 2)
        this.vtbl.toString := CallbackCreate(GetMethod(implObj, "toString"), flags, 2)
        this.vtbl.detach := CallbackCreate(GetMethod(implObj, "detach"), flags, 1)
        this.vtbl.getClientRects := CallbackCreate(GetMethod(implObj, "getClientRects"), flags, 2)
        this.vtbl.getBoundingClientRect := CallbackCreate(GetMethod(implObj, "getBoundingClientRect"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_startContainer)
        CallbackFree(this.vtbl.get_startOffset)
        CallbackFree(this.vtbl.get_endContainer)
        CallbackFree(this.vtbl.get_endOffset)
        CallbackFree(this.vtbl.get_collapsed)
        CallbackFree(this.vtbl.get_commonAncestorContainer)
        CallbackFree(this.vtbl.setStart)
        CallbackFree(this.vtbl.setEnd)
        CallbackFree(this.vtbl.setStartBefore)
        CallbackFree(this.vtbl.setStartAfter)
        CallbackFree(this.vtbl.setEndBefore)
        CallbackFree(this.vtbl.setEndAfter)
        CallbackFree(this.vtbl.collapse)
        CallbackFree(this.vtbl.selectNode)
        CallbackFree(this.vtbl.selectNodeContents)
        CallbackFree(this.vtbl.compareBoundaryPoints)
        CallbackFree(this.vtbl.deleteContents)
        CallbackFree(this.vtbl.extractContents)
        CallbackFree(this.vtbl.cloneContents)
        CallbackFree(this.vtbl.insertNode)
        CallbackFree(this.vtbl.surroundContents)
        CallbackFree(this.vtbl.cloneRange)
        CallbackFree(this.vtbl.toString)
        CallbackFree(this.vtbl.detach)
        CallbackFree(this.vtbl.getClientRects)
        CallbackFree(this.vtbl.getBoundingClientRect)
    }
}
