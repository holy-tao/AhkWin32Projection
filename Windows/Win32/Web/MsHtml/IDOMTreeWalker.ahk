#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IDOMTreeWalker extends IDispatch {
    /**
     * The interface identifier for IDOMTreeWalker
     * @type {Guid}
     */
    static IID := Guid("{30510748-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDOMTreeWalker interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_root                   : IntPtr
        get_whatToShow             : IntPtr
        get_filter                 : IntPtr
        get_expandEntityReferences : IntPtr
        putref_currentNode         : IntPtr
        get_currentNode            : IntPtr
        parentNode                 : IntPtr
        firstChild                 : IntPtr
        lastChild                  : IntPtr
        previousSibling            : IntPtr
        nextSibling                : IntPtr
        previousNode               : IntPtr
        nextNode                   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDOMTreeWalker.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IDispatch} 
     */
    root {
        get => this.get_root()
    }

    /**
     * @type {Integer} 
     */
    whatToShow {
        get => this.get_whatToShow()
    }

    /**
     * @type {IDispatch} 
     */
    filter {
        get => this.get_filter()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    expandEntityReferences {
        get => this.get_expandEntityReferences()
    }

    /**
     * @type {IDispatch} 
     */
    currentNode {
        get => this.get_currentNode()
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_root() {
        result := ComCall(7, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_whatToShow() {
        result := ComCall(8, this, "uint*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_filter() {
        result := ComCall(9, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_expandEntityReferences() {
        result := ComCall(10, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {IDispatch} v 
     * @returns {HRESULT} 
     */
    putref_currentNode(v) {
        result := ComCall(11, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_currentNode() {
        result := ComCall(12, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    parentNode() {
        result := ComCall(13, this, "ptr*", &ppRetNode := 0, "HRESULT")
        return IDispatch(ppRetNode)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    firstChild() {
        result := ComCall(14, this, "ptr*", &ppRetNode := 0, "HRESULT")
        return IDispatch(ppRetNode)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    lastChild() {
        result := ComCall(15, this, "ptr*", &ppRetNode := 0, "HRESULT")
        return IDispatch(ppRetNode)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    previousSibling() {
        result := ComCall(16, this, "ptr*", &ppRetNode := 0, "HRESULT")
        return IDispatch(ppRetNode)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    nextSibling() {
        result := ComCall(17, this, "ptr*", &ppRetNode := 0, "HRESULT")
        return IDispatch(ppRetNode)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    previousNode() {
        result := ComCall(18, this, "ptr*", &ppRetNode := 0, "HRESULT")
        return IDispatch(ppRetNode)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    nextNode() {
        result := ComCall(19, this, "ptr*", &ppRetNode := 0, "HRESULT")
        return IDispatch(ppRetNode)
    }

    Query(iid) {
        if (IDOMTreeWalker.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_root := CallbackCreate(GetMethod(implObj, "get_root"), flags, 2)
        this.vtbl.get_whatToShow := CallbackCreate(GetMethod(implObj, "get_whatToShow"), flags, 2)
        this.vtbl.get_filter := CallbackCreate(GetMethod(implObj, "get_filter"), flags, 2)
        this.vtbl.get_expandEntityReferences := CallbackCreate(GetMethod(implObj, "get_expandEntityReferences"), flags, 2)
        this.vtbl.putref_currentNode := CallbackCreate(GetMethod(implObj, "putref_currentNode"), flags, 2)
        this.vtbl.get_currentNode := CallbackCreate(GetMethod(implObj, "get_currentNode"), flags, 2)
        this.vtbl.parentNode := CallbackCreate(GetMethod(implObj, "parentNode"), flags, 2)
        this.vtbl.firstChild := CallbackCreate(GetMethod(implObj, "firstChild"), flags, 2)
        this.vtbl.lastChild := CallbackCreate(GetMethod(implObj, "lastChild"), flags, 2)
        this.vtbl.previousSibling := CallbackCreate(GetMethod(implObj, "previousSibling"), flags, 2)
        this.vtbl.nextSibling := CallbackCreate(GetMethod(implObj, "nextSibling"), flags, 2)
        this.vtbl.previousNode := CallbackCreate(GetMethod(implObj, "previousNode"), flags, 2)
        this.vtbl.nextNode := CallbackCreate(GetMethod(implObj, "nextNode"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_root)
        CallbackFree(this.vtbl.get_whatToShow)
        CallbackFree(this.vtbl.get_filter)
        CallbackFree(this.vtbl.get_expandEntityReferences)
        CallbackFree(this.vtbl.putref_currentNode)
        CallbackFree(this.vtbl.get_currentNode)
        CallbackFree(this.vtbl.parentNode)
        CallbackFree(this.vtbl.firstChild)
        CallbackFree(this.vtbl.lastChild)
        CallbackFree(this.vtbl.previousSibling)
        CallbackFree(this.vtbl.nextSibling)
        CallbackFree(this.vtbl.previousNode)
        CallbackFree(this.vtbl.nextNode)
    }
}
