#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Graphics\Gdi\HDC.ahk" { HDC }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLElementRender extends IUnknown {
    /**
     * The interface identifier for IHTMLElementRender
     * @type {Guid}
     */
    static IID := Guid("{3050f669-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLElementRender interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        DrawToDC           : IntPtr
        SetDocumentPrinter : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLElementRender.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {HDC} _hDC 
     * @returns {HRESULT} 
     */
    DrawToDC(_hDC) {
        result := ComCall(3, this, HDC, _hDC, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrPrinterName 
     * @param {HDC} _hDC 
     * @returns {HRESULT} 
     */
    SetDocumentPrinter(bstrPrinterName, _hDC) {
        bstrPrinterName := bstrPrinterName is String ? BSTR.Alloc(bstrPrinterName).Value : bstrPrinterName

        result := ComCall(4, this, BSTR, bstrPrinterName, HDC, _hDC, "HRESULT")
        return result
    }

    Query(iid) {
        if (IHTMLElementRender.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.DrawToDC := CallbackCreate(GetMethod(implObj, "DrawToDC"), flags, 2)
        this.vtbl.SetDocumentPrinter := CallbackCreate(GetMethod(implObj, "SetDocumentPrinter"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.DrawToDC)
        CallbackFree(this.vtbl.SetDocumentPrinter)
    }
}
