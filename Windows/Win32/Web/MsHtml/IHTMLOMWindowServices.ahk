#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLOMWindowServices extends IUnknown {
    /**
     * The interface identifier for IHTMLOMWindowServices
     * @type {Guid}
     */
    static IID := Guid("{3050f5fc-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLOMWindowServices interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        moveTo   : IntPtr
        moveBy   : IntPtr
        resizeTo : IntPtr
        resizeBy : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLOMWindowServices.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @returns {HRESULT} 
     */
    moveTo(x, y) {
        result := ComCall(3, this, "int", x, "int", y, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @returns {HRESULT} 
     */
    moveBy(x, y) {
        result := ComCall(4, this, "int", x, "int", y, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @returns {HRESULT} 
     */
    resizeTo(x, y) {
        result := ComCall(5, this, "int", x, "int", y, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @returns {HRESULT} 
     */
    resizeBy(x, y) {
        result := ComCall(6, this, "int", x, "int", y, "HRESULT")
        return result
    }

    Query(iid) {
        if (IHTMLOMWindowServices.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.moveTo := CallbackCreate(GetMethod(implObj, "moveTo"), flags, 3)
        this.vtbl.moveBy := CallbackCreate(GetMethod(implObj, "moveBy"), flags, 3)
        this.vtbl.resizeTo := CallbackCreate(GetMethod(implObj, "resizeTo"), flags, 3)
        this.vtbl.resizeBy := CallbackCreate(GetMethod(implObj, "resizeBy"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.moveTo)
        CallbackFree(this.vtbl.moveBy)
        CallbackFree(this.vtbl.resizeTo)
        CallbackFree(this.vtbl.resizeBy)
    }
}
