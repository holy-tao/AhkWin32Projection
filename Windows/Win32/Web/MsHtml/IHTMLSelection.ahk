#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\IHTMLDOMNode.ahk" { IHTMLDOMNode }
#Import ".\IHTMLDOMRange.ahk" { IHTMLDOMRange }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLSelection extends IDispatch {
    /**
     * The interface identifier for IHTMLSelection
     * @type {Guid}
     */
    static IID := Guid("{305104b6-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLSelection interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_anchorNode     : IntPtr
        get_anchorOffset   : IntPtr
        get_focusNode      : IntPtr
        get_focusOffset    : IntPtr
        get_isCollapsed    : IntPtr
        collapse           : IntPtr
        collapseToStart    : IntPtr
        collapseToEnd      : IntPtr
        selectAllChildren  : IntPtr
        deleteFromDocument : IntPtr
        get_rangeCount     : IntPtr
        getRangeAt         : IntPtr
        addRange           : IntPtr
        removeRange        : IntPtr
        removeAllRanges    : IntPtr
        toString           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLSelection.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IHTMLDOMNode} 
     */
    anchorNode {
        get => this.get_anchorNode()
    }

    /**
     * @type {Integer} 
     */
    anchorOffset {
        get => this.get_anchorOffset()
    }

    /**
     * @type {IHTMLDOMNode} 
     */
    focusNode {
        get => this.get_focusNode()
    }

    /**
     * @type {Integer} 
     */
    focusOffset {
        get => this.get_focusOffset()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    isCollapsed {
        get => this.get_isCollapsed()
    }

    /**
     * @type {Integer} 
     */
    rangeCount {
        get => this.get_rangeCount()
    }

    /**
     * 
     * @returns {IHTMLDOMNode} 
     */
    get_anchorNode() {
        result := ComCall(7, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLDOMNode(p)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_anchorOffset() {
        result := ComCall(8, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IHTMLDOMNode} 
     */
    get_focusNode() {
        result := ComCall(9, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLDOMNode(p)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_focusOffset() {
        result := ComCall(10, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_isCollapsed() {
        result := ComCall(11, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {IDispatch} parentNode 
     * @param {Integer} offfset 
     * @returns {HRESULT} 
     */
    collapse(parentNode, offfset) {
        result := ComCall(12, this, "ptr", parentNode, "int", offfset, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    collapseToStart() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    collapseToEnd() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDispatch} parentNode 
     * @returns {HRESULT} 
     */
    selectAllChildren(parentNode) {
        result := ComCall(15, this, "ptr", parentNode, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    deleteFromDocument() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_rangeCount() {
        result := ComCall(17, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {IHTMLDOMRange} 
     */
    getRangeAt(index) {
        result := ComCall(18, this, "int", index, "ptr*", &ppRange := 0, "HRESULT")
        return IHTMLDOMRange(ppRange)
    }

    /**
     * 
     * @param {IDispatch} range 
     * @returns {HRESULT} 
     */
    addRange(range) {
        result := ComCall(19, this, "ptr", range, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDispatch} range 
     * @returns {HRESULT} 
     */
    removeRange(range) {
        result := ComCall(20, this, "ptr", range, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    removeAllRanges() {
        result := ComCall(21, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    toString() {
        pSelectionString := BSTR.Owned()
        result := ComCall(22, this, BSTR.Ptr, pSelectionString, "HRESULT")
        return pSelectionString
    }

    Query(iid) {
        if (IHTMLSelection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_anchorNode := CallbackCreate(GetMethod(implObj, "get_anchorNode"), flags, 2)
        this.vtbl.get_anchorOffset := CallbackCreate(GetMethod(implObj, "get_anchorOffset"), flags, 2)
        this.vtbl.get_focusNode := CallbackCreate(GetMethod(implObj, "get_focusNode"), flags, 2)
        this.vtbl.get_focusOffset := CallbackCreate(GetMethod(implObj, "get_focusOffset"), flags, 2)
        this.vtbl.get_isCollapsed := CallbackCreate(GetMethod(implObj, "get_isCollapsed"), flags, 2)
        this.vtbl.collapse := CallbackCreate(GetMethod(implObj, "collapse"), flags, 3)
        this.vtbl.collapseToStart := CallbackCreate(GetMethod(implObj, "collapseToStart"), flags, 1)
        this.vtbl.collapseToEnd := CallbackCreate(GetMethod(implObj, "collapseToEnd"), flags, 1)
        this.vtbl.selectAllChildren := CallbackCreate(GetMethod(implObj, "selectAllChildren"), flags, 2)
        this.vtbl.deleteFromDocument := CallbackCreate(GetMethod(implObj, "deleteFromDocument"), flags, 1)
        this.vtbl.get_rangeCount := CallbackCreate(GetMethod(implObj, "get_rangeCount"), flags, 2)
        this.vtbl.getRangeAt := CallbackCreate(GetMethod(implObj, "getRangeAt"), flags, 3)
        this.vtbl.addRange := CallbackCreate(GetMethod(implObj, "addRange"), flags, 2)
        this.vtbl.removeRange := CallbackCreate(GetMethod(implObj, "removeRange"), flags, 2)
        this.vtbl.removeAllRanges := CallbackCreate(GetMethod(implObj, "removeAllRanges"), flags, 1)
        this.vtbl.toString := CallbackCreate(GetMethod(implObj, "toString"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_anchorNode)
        CallbackFree(this.vtbl.get_anchorOffset)
        CallbackFree(this.vtbl.get_focusNode)
        CallbackFree(this.vtbl.get_focusOffset)
        CallbackFree(this.vtbl.get_isCollapsed)
        CallbackFree(this.vtbl.collapse)
        CallbackFree(this.vtbl.collapseToStart)
        CallbackFree(this.vtbl.collapseToEnd)
        CallbackFree(this.vtbl.selectAllChildren)
        CallbackFree(this.vtbl.deleteFromDocument)
        CallbackFree(this.vtbl.get_rangeCount)
        CallbackFree(this.vtbl.getRangeAt)
        CallbackFree(this.vtbl.addRange)
        CallbackFree(this.vtbl.removeRange)
        CallbackFree(this.vtbl.removeAllRanges)
        CallbackFree(this.vtbl.toString)
    }
}
