#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Gdi\DEVMODEA.ahk" { DEVMODEA }
#Import ".\PRINTER_HANDLE.ahk" { PRINTER_HANDLE }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\SHIMOPTS.ahk" { SHIMOPTS }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Data\Xml\MsXml\IXMLDOMDocument2.ahk" { IXMLDOMDocument2 }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IPrintTicketProvider extends IUnknown {
    /**
     * The interface identifier for IPrintTicketProvider
     * @type {Guid}
     */
    static IID := Guid("{bb5116db-0a23-4c3a-a6b6-89e5558dfb5d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrintTicketProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetSupportedVersions        : IntPtr
        BindPrinter                 : IntPtr
        QueryDeviceNamespace        : IntPtr
        ConvertPrintTicketToDevMode : IntPtr
        ConvertDevModeToPrintTicket : IntPtr
        GetPrintCapabilities        : IntPtr
        ValidatePrintTicket         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrintTicketProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {Pointer<Pointer<Integer>>} ppVersions 
     * @param {Pointer<Integer>} cVersions 
     * @returns {HRESULT} 
     */
    GetSupportedVersions(hPrinter, ppVersions, cVersions) {
        ppVersionsMarshal := ppVersions is VarRef ? "ptr*" : "ptr"
        cVersionsMarshal := cVersions is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, PRINTER_HANDLE, hPrinter, ppVersionsMarshal, ppVersions, cVersionsMarshal, cVersions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PRINTER_HANDLE} hPrinter 
     * @param {Integer} _version 
     * @param {Pointer<SHIMOPTS>} pOptions 
     * @param {Pointer<Integer>} pDevModeFlags 
     * @param {Pointer<Integer>} cNamespaces 
     * @param {Pointer<Pointer<BSTR>>} ppNamespaces 
     * @returns {HRESULT} 
     */
    BindPrinter(hPrinter, _version, pOptions, pDevModeFlags, cNamespaces, ppNamespaces) {
        pOptionsMarshal := pOptions is VarRef ? "int*" : "ptr"
        pDevModeFlagsMarshal := pDevModeFlags is VarRef ? "uint*" : "ptr"
        cNamespacesMarshal := cNamespaces is VarRef ? "int*" : "ptr"
        ppNamespacesMarshal := ppNamespaces is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, PRINTER_HANDLE, hPrinter, "int", _version, pOptionsMarshal, pOptions, pDevModeFlagsMarshal, pDevModeFlags, cNamespacesMarshal, cNamespaces, ppNamespacesMarshal, ppNamespaces, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pDefaultNamespace 
     * @returns {HRESULT} 
     */
    QueryDeviceNamespace(pDefaultNamespace) {
        result := ComCall(5, this, BSTR.Ptr, pDefaultNamespace, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IXMLDOMDocument2} pPrintTicket 
     * @param {Integer} cbDevmodeIn 
     * @param {Pointer<DEVMODEA>} pDevmodeIn 
     * @param {Pointer<Integer>} pcbDevmodeOut 
     * @param {Pointer<Pointer<DEVMODEA>>} ppDevmodeOut 
     * @returns {HRESULT} 
     */
    ConvertPrintTicketToDevMode(pPrintTicket, cbDevmodeIn, pDevmodeIn, pcbDevmodeOut, ppDevmodeOut) {
        pcbDevmodeOutMarshal := pcbDevmodeOut is VarRef ? "uint*" : "ptr"
        ppDevmodeOutMarshal := ppDevmodeOut is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, "ptr", pPrintTicket, "uint", cbDevmodeIn, DEVMODEA.Ptr, pDevmodeIn, pcbDevmodeOutMarshal, pcbDevmodeOut, ppDevmodeOutMarshal, ppDevmodeOut, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cbDevmode 
     * @param {Pointer<DEVMODEA>} pDevmode 
     * @param {IXMLDOMDocument2} pPrintTicket 
     * @returns {HRESULT} 
     */
    ConvertDevModeToPrintTicket(cbDevmode, pDevmode, pPrintTicket) {
        result := ComCall(7, this, "uint", cbDevmode, DEVMODEA.Ptr, pDevmode, "ptr", pPrintTicket, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IXMLDOMDocument2} pPrintTicket 
     * @returns {IXMLDOMDocument2} 
     */
    GetPrintCapabilities(pPrintTicket) {
        result := ComCall(8, this, "ptr", pPrintTicket, "ptr*", &ppCapabilities := 0, "HRESULT")
        return IXMLDOMDocument2(ppCapabilities)
    }

    /**
     * 
     * @param {IXMLDOMDocument2} pBaseTicket 
     * @returns {HRESULT} 
     */
    ValidatePrintTicket(pBaseTicket) {
        result := ComCall(9, this, "ptr", pBaseTicket, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPrintTicketProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSupportedVersions := CallbackCreate(GetMethod(implObj, "GetSupportedVersions"), flags, 4)
        this.vtbl.BindPrinter := CallbackCreate(GetMethod(implObj, "BindPrinter"), flags, 7)
        this.vtbl.QueryDeviceNamespace := CallbackCreate(GetMethod(implObj, "QueryDeviceNamespace"), flags, 2)
        this.vtbl.ConvertPrintTicketToDevMode := CallbackCreate(GetMethod(implObj, "ConvertPrintTicketToDevMode"), flags, 6)
        this.vtbl.ConvertDevModeToPrintTicket := CallbackCreate(GetMethod(implObj, "ConvertDevModeToPrintTicket"), flags, 4)
        this.vtbl.GetPrintCapabilities := CallbackCreate(GetMethod(implObj, "GetPrintCapabilities"), flags, 3)
        this.vtbl.ValidatePrintTicket := CallbackCreate(GetMethod(implObj, "ValidatePrintTicket"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSupportedVersions)
        CallbackFree(this.vtbl.BindPrinter)
        CallbackFree(this.vtbl.QueryDeviceNamespace)
        CallbackFree(this.vtbl.ConvertPrintTicketToDevMode)
        CallbackFree(this.vtbl.ConvertDevModeToPrintTicket)
        CallbackFree(this.vtbl.GetPrintCapabilities)
        CallbackFree(this.vtbl.ValidatePrintTicket)
    }
}
