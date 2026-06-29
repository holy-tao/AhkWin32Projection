#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IHTMLTableSection.ahk" { IHTMLTableSection }
#Import ".\IHTMLTableCaption.ahk" { IHTMLTableCaption }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLTable4 extends IDispatch {
    /**
     * The interface identifier for IHTMLTable4
     * @type {Guid}
     */
    static IID := Guid("{305106c2-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLTable4 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        putref_tHead   : IntPtr
        get_tHead      : IntPtr
        putref_tFoot   : IntPtr
        get_tFoot      : IntPtr
        putref_caption : IntPtr
        get_caption    : IntPtr
        insertRow      : IntPtr
        deleteRow      : IntPtr
        createTBody    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLTable4.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IHTMLTableSection} 
     */
    tHead {
        get => this.get_tHead()
    }

    /**
     * @type {IHTMLTableSection} 
     */
    tFoot {
        get => this.get_tFoot()
    }

    /**
     * @type {IHTMLTableCaption} 
     */
    caption {
        get => this.get_caption()
    }

    /**
     * 
     * @param {IHTMLTableSection} v 
     * @returns {HRESULT} 
     */
    putref_tHead(v) {
        result := ComCall(7, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IHTMLTableSection} 
     */
    get_tHead() {
        result := ComCall(8, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLTableSection(p)
    }

    /**
     * 
     * @param {IHTMLTableSection} v 
     * @returns {HRESULT} 
     */
    putref_tFoot(v) {
        result := ComCall(9, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IHTMLTableSection} 
     */
    get_tFoot() {
        result := ComCall(10, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLTableSection(p)
    }

    /**
     * 
     * @param {IHTMLTableCaption} v 
     * @returns {HRESULT} 
     */
    putref_caption(v) {
        result := ComCall(11, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IHTMLTableCaption} 
     */
    get_caption() {
        result := ComCall(12, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLTableCaption(p)
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {IDispatch} 
     */
    insertRow(index) {
        result := ComCall(13, this, "int", index, "ptr*", &row := 0, "HRESULT")
        return IDispatch(row)
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {HRESULT} 
     */
    deleteRow(index) {
        result := ComCall(14, this, "int", index, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IHTMLTableSection} 
     */
    createTBody() {
        result := ComCall(15, this, "ptr*", &tbody := 0, "HRESULT")
        return IHTMLTableSection(tbody)
    }

    Query(iid) {
        if (IHTMLTable4.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.putref_tHead := CallbackCreate(GetMethod(implObj, "putref_tHead"), flags, 2)
        this.vtbl.get_tHead := CallbackCreate(GetMethod(implObj, "get_tHead"), flags, 2)
        this.vtbl.putref_tFoot := CallbackCreate(GetMethod(implObj, "putref_tFoot"), flags, 2)
        this.vtbl.get_tFoot := CallbackCreate(GetMethod(implObj, "get_tFoot"), flags, 2)
        this.vtbl.putref_caption := CallbackCreate(GetMethod(implObj, "putref_caption"), flags, 2)
        this.vtbl.get_caption := CallbackCreate(GetMethod(implObj, "get_caption"), flags, 2)
        this.vtbl.insertRow := CallbackCreate(GetMethod(implObj, "insertRow"), flags, 3)
        this.vtbl.deleteRow := CallbackCreate(GetMethod(implObj, "deleteRow"), flags, 2)
        this.vtbl.createTBody := CallbackCreate(GetMethod(implObj, "createTBody"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.putref_tHead)
        CallbackFree(this.vtbl.get_tHead)
        CallbackFree(this.vtbl.putref_tFoot)
        CallbackFree(this.vtbl.get_tFoot)
        CallbackFree(this.vtbl.putref_caption)
        CallbackFree(this.vtbl.get_caption)
        CallbackFree(this.vtbl.insertRow)
        CallbackFree(this.vtbl.deleteRow)
        CallbackFree(this.vtbl.createTBody)
    }
}
