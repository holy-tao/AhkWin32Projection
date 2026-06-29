#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\PRINTER_HANDLE.ahk" { PRINTER_HANDLE }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IPrinterPropertyBag.ahk" { IPrinterPropertyBag }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IPrinterQueue extends IDispatch {
    /**
     * The interface identifier for IPrinterQueue
     * @type {Guid}
     */
    static IID := Guid("{3580a828-07fe-4b94-ac1a-757d9d2d3056}")

    /**
     * The class identifier for PrinterQueue
     * @type {Guid}
     */
    static CLSID := Guid("{eb54c230-798c-4c9e-b461-29fad04039b1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrinterQueue interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Handle    : IntPtr
        get_Name      : IntPtr
        SendBidiQuery : IntPtr
        GetProperties : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrinterQueue.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {PRINTER_HANDLE} 
     */
    Handle {
        get => this.get_Handle()
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * 
     * @returns {PRINTER_HANDLE} 
     */
    get_Handle() {
        phPrinter := PRINTER_HANDLE.Owned()
        result := ComCall(7, this, PRINTER_HANDLE.Ptr, phPrinter, "HRESULT")
        return phPrinter
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Name() {
        pbstrName := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * 
     * @param {BSTR} bstrBidiQuery 
     * @returns {HRESULT} 
     */
    SendBidiQuery(bstrBidiQuery) {
        bstrBidiQuery := bstrBidiQuery is String ? BSTR.Alloc(bstrBidiQuery).Value : bstrBidiQuery

        result := ComCall(9, this, BSTR, bstrBidiQuery, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IPrinterPropertyBag} 
     */
    GetProperties() {
        result := ComCall(10, this, "ptr*", &ppPropertyBag := 0, "HRESULT")
        return IPrinterPropertyBag(ppPropertyBag)
    }

    Query(iid) {
        if (IPrinterQueue.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Handle := CallbackCreate(GetMethod(implObj, "get_Handle"), flags, 2)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.SendBidiQuery := CallbackCreate(GetMethod(implObj, "SendBidiQuery"), flags, 2)
        this.vtbl.GetProperties := CallbackCreate(GetMethod(implObj, "GetProperties"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Handle)
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.SendBidiQuery)
        CallbackFree(this.vtbl.GetProperties)
    }
}
