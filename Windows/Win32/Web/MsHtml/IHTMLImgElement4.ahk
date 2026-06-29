#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLImgElement4 extends IDispatch {
    /**
     * The interface identifier for IHTMLImgElement4
     * @type {Guid}
     */
    static IID := Guid("{305107f6-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLImgElement4 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_naturalWidth  : IntPtr
        get_naturalHeight : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLImgElement4.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    naturalWidth {
        get => this.get_naturalWidth()
    }

    /**
     * @type {Integer} 
     */
    naturalHeight {
        get => this.get_naturalHeight()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_naturalWidth() {
        result := ComCall(7, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_naturalHeight() {
        result := ComCall(8, this, "int*", &p := 0, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLImgElement4.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_naturalWidth := CallbackCreate(GetMethod(implObj, "get_naturalWidth"), flags, 2)
        this.vtbl.get_naturalHeight := CallbackCreate(GetMethod(implObj, "get_naturalHeight"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_naturalWidth)
        CallbackFree(this.vtbl.get_naturalHeight)
    }
}
