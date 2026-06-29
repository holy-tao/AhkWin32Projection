#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IDOMNodeIterator extends IDispatch {
    /**
     * The interface identifier for IDOMNodeIterator
     * @type {Guid}
     */
    static IID := Guid("{30510746-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDOMNodeIterator interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_root                   : IntPtr
        get_whatToShow             : IntPtr
        get_filter                 : IntPtr
        get_expandEntityReferences : IntPtr
        nextNode                   : IntPtr
        previousNode               : IntPtr
        detach                     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDOMNodeIterator.Vtbl()
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
     * @returns {IDispatch} 
     */
    nextNode() {
        result := ComCall(11, this, "ptr*", &ppRetNode := 0, "HRESULT")
        return IDispatch(ppRetNode)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    previousNode() {
        result := ComCall(12, this, "ptr*", &ppRetNode := 0, "HRESULT")
        return IDispatch(ppRetNode)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    detach() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDOMNodeIterator.IID.Equals(iid)) {
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
        this.vtbl.nextNode := CallbackCreate(GetMethod(implObj, "nextNode"), flags, 2)
        this.vtbl.previousNode := CallbackCreate(GetMethod(implObj, "previousNode"), flags, 2)
        this.vtbl.detach := CallbackCreate(GetMethod(implObj, "detach"), flags, 1)
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
        CallbackFree(this.vtbl.nextNode)
        CallbackFree(this.vtbl.previousNode)
        CallbackFree(this.vtbl.detach)
    }
}
