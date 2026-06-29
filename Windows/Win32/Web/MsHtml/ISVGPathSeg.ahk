#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct ISVGPathSeg extends IDispatch {
    /**
     * The interface identifier for ISVGPathSeg
     * @type {Guid}
     */
    static IID := Guid("{305104fc-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGPathSeg
     * @type {Guid}
     */
    static CLSID := Guid("{305105b3-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISVGPathSeg interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_pathSegType         : IntPtr
        get_pathSegType         : IntPtr
        get_pathSegTypeAsLetter : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISVGPathSeg.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    pathSegType {
        get => this.get_pathSegType()
        set => this.put_pathSegType(value)
    }

    /**
     * @type {BSTR} 
     */
    pathSegTypeAsLetter {
        get => this.get_pathSegTypeAsLetter()
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_pathSegType(v) {
        result := ComCall(7, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_pathSegType() {
        result := ComCall(8, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_pathSegTypeAsLetter() {
        p := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (ISVGPathSeg.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_pathSegType := CallbackCreate(GetMethod(implObj, "put_pathSegType"), flags, 2)
        this.vtbl.get_pathSegType := CallbackCreate(GetMethod(implObj, "get_pathSegType"), flags, 2)
        this.vtbl.get_pathSegTypeAsLetter := CallbackCreate(GetMethod(implObj, "get_pathSegTypeAsLetter"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_pathSegType)
        CallbackFree(this.vtbl.get_pathSegType)
        CallbackFree(this.vtbl.get_pathSegTypeAsLetter)
    }
}
