#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IPrintManagerTemplatePrinter extends IDispatch {
    /**
     * The interface identifier for IPrintManagerTemplatePrinter
     * @type {Guid}
     */
    static IID := Guid("{f633be14-9eff-4c4d-929e-05717b21b3e6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrintManagerTemplatePrinter interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        startPrint              : IntPtr
        drawPreviewPage         : IntPtr
        setPageCount            : IntPtr
        invalidatePreview       : IntPtr
        getPrintTaskOptionValue : IntPtr
        endPrint                : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrintManagerTemplatePrinter.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    startPrint() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDispatch} pElemDisp 
     * @param {Integer} nPage 
     * @returns {HRESULT} 
     */
    drawPreviewPage(pElemDisp, nPage) {
        result := ComCall(8, this, "ptr", pElemDisp, "int", nPage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nPage 
     * @returns {HRESULT} 
     */
    setPageCount(nPage) {
        result := ComCall(9, this, "int", nPage, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    invalidatePreview() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrKey 
     * @returns {VARIANT} 
     */
    getPrintTaskOptionValue(bstrKey) {
        bstrKey := bstrKey is String ? BSTR.Alloc(bstrKey).Value : bstrKey

        pvarin := VARIANT()
        result := ComCall(11, this, BSTR, bstrKey, VARIANT.Ptr, pvarin, "HRESULT")
        return pvarin
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    endPrint() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPrintManagerTemplatePrinter.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.startPrint := CallbackCreate(GetMethod(implObj, "startPrint"), flags, 1)
        this.vtbl.drawPreviewPage := CallbackCreate(GetMethod(implObj, "drawPreviewPage"), flags, 3)
        this.vtbl.setPageCount := CallbackCreate(GetMethod(implObj, "setPageCount"), flags, 2)
        this.vtbl.invalidatePreview := CallbackCreate(GetMethod(implObj, "invalidatePreview"), flags, 1)
        this.vtbl.getPrintTaskOptionValue := CallbackCreate(GetMethod(implObj, "getPrintTaskOptionValue"), flags, 3)
        this.vtbl.endPrint := CallbackCreate(GetMethod(implObj, "endPrint"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.startPrint)
        CallbackFree(this.vtbl.drawPreviewPage)
        CallbackFree(this.vtbl.setPageCount)
        CallbackFree(this.vtbl.invalidatePreview)
        CallbackFree(this.vtbl.getPrintTaskOptionValue)
        CallbackFree(this.vtbl.endPrint)
    }
}
