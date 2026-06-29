#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IPrintManagerTemplatePrinter.ahk" { IPrintManagerTemplatePrinter }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IPrintManagerTemplatePrinter2 extends IPrintManagerTemplatePrinter {
    /**
     * The interface identifier for IPrintManagerTemplatePrinter2
     * @type {Guid}
     */
    static IID := Guid("{c6403497-7493-4f09-8016-54b03e9bda69}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrintManagerTemplatePrinter2 interfaces
    */
    struct Vtbl extends IPrintManagerTemplatePrinter.Vtbl {
        get_showHeaderFooter : IntPtr
        get_shrinkToFit      : IntPtr
        get_percentScale     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrintManagerTemplatePrinter2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    showHeaderFooter {
        get => this.get_showHeaderFooter()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    shrinkToFit {
        get => this.get_shrinkToFit()
    }

    /**
     * @type {Float} 
     */
    percentScale {
        get => this.get_percentScale()
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_showHeaderFooter() {
        result := ComCall(13, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_shrinkToFit() {
        result := ComCall(14, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Float} 
     */
    get_percentScale() {
        result := ComCall(15, this, "float*", &p := 0, "HRESULT")
        return p
    }

    Query(iid) {
        if (IPrintManagerTemplatePrinter2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_showHeaderFooter := CallbackCreate(GetMethod(implObj, "get_showHeaderFooter"), flags, 2)
        this.vtbl.get_shrinkToFit := CallbackCreate(GetMethod(implObj, "get_shrinkToFit"), flags, 2)
        this.vtbl.get_percentScale := CallbackCreate(GetMethod(implObj, "get_percentScale"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_showHeaderFooter)
        CallbackFree(this.vtbl.get_shrinkToFit)
        CallbackFree(this.vtbl.get_percentScale)
    }
}
