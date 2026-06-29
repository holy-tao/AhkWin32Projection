#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISVGUseElement.ahk" { ISVGUseElement }
#Import ".\ISVGElementInstanceList.ahk" { ISVGElementInstanceList }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISVGElement.ahk" { ISVGElement }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct ISVGElementInstance extends IDispatch {
    /**
     * The interface identifier for ISVGElementInstance
     * @type {Guid}
     */
    static IID := Guid("{305104ee-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGElementInstance
     * @type {Guid}
     */
    static CLSID := Guid("{30510575-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISVGElementInstance interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_correspondingElement    : IntPtr
        get_correspondingUseElement : IntPtr
        get_parentNode              : IntPtr
        get_childNodes              : IntPtr
        get_firstChild              : IntPtr
        get_lastChild               : IntPtr
        get_previousSibling         : IntPtr
        get_nextSibling             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISVGElementInstance.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {ISVGElement} 
     */
    correspondingElement {
        get => this.get_correspondingElement()
    }

    /**
     * @type {ISVGUseElement} 
     */
    correspondingUseElement {
        get => this.get_correspondingUseElement()
    }

    /**
     * @type {ISVGElementInstance} 
     */
    parentNode {
        get => this.get_parentNode()
    }

    /**
     * @type {ISVGElementInstanceList} 
     */
    childNodes {
        get => this.get_childNodes()
    }

    /**
     * @type {ISVGElementInstance} 
     */
    firstChild {
        get => this.get_firstChild()
    }

    /**
     * @type {ISVGElementInstance} 
     */
    lastChild {
        get => this.get_lastChild()
    }

    /**
     * @type {ISVGElementInstance} 
     */
    previousSibling {
        get => this.get_previousSibling()
    }

    /**
     * @type {ISVGElementInstance} 
     */
    nextSibling {
        get => this.get_nextSibling()
    }

    /**
     * 
     * @returns {ISVGElement} 
     */
    get_correspondingElement() {
        result := ComCall(7, this, "ptr*", &p := 0, "HRESULT")
        return ISVGElement(p)
    }

    /**
     * 
     * @returns {ISVGUseElement} 
     */
    get_correspondingUseElement() {
        result := ComCall(8, this, "ptr*", &p := 0, "HRESULT")
        return ISVGUseElement(p)
    }

    /**
     * 
     * @returns {ISVGElementInstance} 
     */
    get_parentNode() {
        result := ComCall(9, this, "ptr*", &p := 0, "HRESULT")
        return ISVGElementInstance(p)
    }

    /**
     * 
     * @returns {ISVGElementInstanceList} 
     */
    get_childNodes() {
        result := ComCall(10, this, "ptr*", &p := 0, "HRESULT")
        return ISVGElementInstanceList(p)
    }

    /**
     * 
     * @returns {ISVGElementInstance} 
     */
    get_firstChild() {
        result := ComCall(11, this, "ptr*", &p := 0, "HRESULT")
        return ISVGElementInstance(p)
    }

    /**
     * 
     * @returns {ISVGElementInstance} 
     */
    get_lastChild() {
        result := ComCall(12, this, "ptr*", &p := 0, "HRESULT")
        return ISVGElementInstance(p)
    }

    /**
     * 
     * @returns {ISVGElementInstance} 
     */
    get_previousSibling() {
        result := ComCall(13, this, "ptr*", &p := 0, "HRESULT")
        return ISVGElementInstance(p)
    }

    /**
     * 
     * @returns {ISVGElementInstance} 
     */
    get_nextSibling() {
        result := ComCall(14, this, "ptr*", &p := 0, "HRESULT")
        return ISVGElementInstance(p)
    }

    Query(iid) {
        if (ISVGElementInstance.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_correspondingElement := CallbackCreate(GetMethod(implObj, "get_correspondingElement"), flags, 2)
        this.vtbl.get_correspondingUseElement := CallbackCreate(GetMethod(implObj, "get_correspondingUseElement"), flags, 2)
        this.vtbl.get_parentNode := CallbackCreate(GetMethod(implObj, "get_parentNode"), flags, 2)
        this.vtbl.get_childNodes := CallbackCreate(GetMethod(implObj, "get_childNodes"), flags, 2)
        this.vtbl.get_firstChild := CallbackCreate(GetMethod(implObj, "get_firstChild"), flags, 2)
        this.vtbl.get_lastChild := CallbackCreate(GetMethod(implObj, "get_lastChild"), flags, 2)
        this.vtbl.get_previousSibling := CallbackCreate(GetMethod(implObj, "get_previousSibling"), flags, 2)
        this.vtbl.get_nextSibling := CallbackCreate(GetMethod(implObj, "get_nextSibling"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_correspondingElement)
        CallbackFree(this.vtbl.get_correspondingUseElement)
        CallbackFree(this.vtbl.get_parentNode)
        CallbackFree(this.vtbl.get_childNodes)
        CallbackFree(this.vtbl.get_firstChild)
        CallbackFree(this.vtbl.get_lastChild)
        CallbackFree(this.vtbl.get_previousSibling)
        CallbackFree(this.vtbl.get_nextSibling)
    }
}
