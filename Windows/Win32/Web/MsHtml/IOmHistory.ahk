#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IOmHistory extends IDispatch {
    /**
     * The interface identifier for IOmHistory
     * @type {Guid}
     */
    static IID := Guid("{feceaaa2-8405-11cf-8ba1-00aa00476da6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IOmHistory interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_length : IntPtr
        back       : IntPtr
        forward    : IntPtr
        go         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IOmHistory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    length {
        get => this.get_length()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_length() {
        result := ComCall(7, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvargdistance 
     * @returns {HRESULT} 
     */
    back(pvargdistance) {
        result := ComCall(8, this, VARIANT.Ptr, pvargdistance, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvargdistance 
     * @returns {HRESULT} 
     */
    forward(pvargdistance) {
        result := ComCall(9, this, VARIANT.Ptr, pvargdistance, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvargdistance 
     * @returns {HRESULT} 
     */
    go(pvargdistance) {
        result := ComCall(10, this, VARIANT.Ptr, pvargdistance, "HRESULT")
        return result
    }

    Query(iid) {
        if (IOmHistory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_length := CallbackCreate(GetMethod(implObj, "get_length"), flags, 2)
        this.vtbl.back := CallbackCreate(GetMethod(implObj, "back"), flags, 2)
        this.vtbl.forward := CallbackCreate(GetMethod(implObj, "forward"), flags, 2)
        this.vtbl.go := CallbackCreate(GetMethod(implObj, "go"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_length)
        CallbackFree(this.vtbl.back)
        CallbackFree(this.vtbl.forward)
        CallbackFree(this.vtbl.go)
    }
}
