#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLMSImgElement extends IDispatch {
    /**
     * The interface identifier for IHTMLMSImgElement
     * @type {Guid}
     */
    static IID := Guid("{30510793-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLMSImgElement interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_msPlayToDisabled : IntPtr
        get_msPlayToDisabled : IntPtr
        put_msPlayToPrimary  : IntPtr
        get_msPlayToPrimary  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLMSImgElement.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    msPlayToDisabled {
        get => this.get_msPlayToDisabled()
        set => this.put_msPlayToDisabled(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    msPlayToPrimary {
        get => this.get_msPlayToPrimary()
        set => this.put_msPlayToPrimary(value)
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_msPlayToDisabled(v) {
        result := ComCall(7, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_msPlayToDisabled() {
        result := ComCall(8, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_msPlayToPrimary(v) {
        result := ComCall(9, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_msPlayToPrimary() {
        result := ComCall(10, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLMSImgElement.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_msPlayToDisabled := CallbackCreate(GetMethod(implObj, "put_msPlayToDisabled"), flags, 2)
        this.vtbl.get_msPlayToDisabled := CallbackCreate(GetMethod(implObj, "get_msPlayToDisabled"), flags, 2)
        this.vtbl.put_msPlayToPrimary := CallbackCreate(GetMethod(implObj, "put_msPlayToPrimary"), flags, 2)
        this.vtbl.get_msPlayToPrimary := CallbackCreate(GetMethod(implObj, "get_msPlayToPrimary"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_msPlayToDisabled)
        CallbackFree(this.vtbl.get_msPlayToDisabled)
        CallbackFree(this.vtbl.put_msPlayToPrimary)
        CallbackFree(this.vtbl.get_msPlayToPrimary)
    }
}
