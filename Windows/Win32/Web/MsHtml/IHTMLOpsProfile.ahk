#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLOpsProfile extends IDispatch {
    /**
     * The interface identifier for IHTMLOpsProfile
     * @type {Guid}
     */
    static IID := Guid("{3050f401-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLOpsProfile interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        addRequest     : IntPtr
        clearRequest   : IntPtr
        doRequest      : IntPtr
        getAttribute   : IntPtr
        setAttribute   : IntPtr
        commitChanges  : IntPtr
        addReadRequest : IntPtr
        doReadRequest  : IntPtr
        doWriteRequest : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLOpsProfile.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {VARIANT} reserved 
     * @returns {VARIANT_BOOL} 
     */
    addRequest(name, reserved) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(7, this, BSTR, name, VARIANT, reserved, VARIANT_BOOL.Ptr, &success := 0, "HRESULT")
        return success
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    clearRequest() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} usage 
     * @param {VARIANT} fname 
     * @param {VARIANT} domain 
     * @param {VARIANT} _path 
     * @param {VARIANT} expire 
     * @param {VARIANT} reserved 
     * @returns {HRESULT} 
     */
    doRequest(usage, fname, domain, _path, expire, reserved) {
        result := ComCall(9, this, VARIANT, usage, VARIANT, fname, VARIANT, domain, VARIANT, _path, VARIANT, expire, VARIANT, reserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {BSTR} 
     */
    getAttribute(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        value := BSTR.Owned()
        result := ComCall(10, this, BSTR, name, BSTR.Ptr, value, "HRESULT")
        return value
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {BSTR} value 
     * @param {VARIANT} prefs 
     * @returns {VARIANT_BOOL} 
     */
    setAttribute(name, value, prefs) {
        name := name is String ? BSTR.Alloc(name).Value : name
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(11, this, BSTR, name, BSTR, value, VARIANT, prefs, VARIANT_BOOL.Ptr, &success := 0, "HRESULT")
        return success
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    commitChanges() {
        result := ComCall(12, this, VARIANT_BOOL.Ptr, &success := 0, "HRESULT")
        return success
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {VARIANT} reserved 
     * @returns {VARIANT_BOOL} 
     */
    addReadRequest(name, reserved) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(13, this, BSTR, name, VARIANT, reserved, VARIANT_BOOL.Ptr, &success := 0, "HRESULT")
        return success
    }

    /**
     * 
     * @param {VARIANT} usage 
     * @param {VARIANT} fname 
     * @param {VARIANT} domain 
     * @param {VARIANT} _path 
     * @param {VARIANT} expire 
     * @param {VARIANT} reserved 
     * @returns {HRESULT} 
     */
    doReadRequest(usage, fname, domain, _path, expire, reserved) {
        result := ComCall(14, this, VARIANT, usage, VARIANT, fname, VARIANT, domain, VARIANT, _path, VARIANT, expire, VARIANT, reserved, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    doWriteRequest() {
        result := ComCall(15, this, VARIANT_BOOL.Ptr, &success := 0, "HRESULT")
        return success
    }

    Query(iid) {
        if (IHTMLOpsProfile.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.addRequest := CallbackCreate(GetMethod(implObj, "addRequest"), flags, 4)
        this.vtbl.clearRequest := CallbackCreate(GetMethod(implObj, "clearRequest"), flags, 1)
        this.vtbl.doRequest := CallbackCreate(GetMethod(implObj, "doRequest"), flags, 7)
        this.vtbl.getAttribute := CallbackCreate(GetMethod(implObj, "getAttribute"), flags, 3)
        this.vtbl.setAttribute := CallbackCreate(GetMethod(implObj, "setAttribute"), flags, 5)
        this.vtbl.commitChanges := CallbackCreate(GetMethod(implObj, "commitChanges"), flags, 2)
        this.vtbl.addReadRequest := CallbackCreate(GetMethod(implObj, "addReadRequest"), flags, 4)
        this.vtbl.doReadRequest := CallbackCreate(GetMethod(implObj, "doReadRequest"), flags, 7)
        this.vtbl.doWriteRequest := CallbackCreate(GetMethod(implObj, "doWriteRequest"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.addRequest)
        CallbackFree(this.vtbl.clearRequest)
        CallbackFree(this.vtbl.doRequest)
        CallbackFree(this.vtbl.getAttribute)
        CallbackFree(this.vtbl.setAttribute)
        CallbackFree(this.vtbl.commitChanges)
        CallbackFree(this.vtbl.addReadRequest)
        CallbackFree(this.vtbl.doReadRequest)
        CallbackFree(this.vtbl.doWriteRequest)
    }
}
