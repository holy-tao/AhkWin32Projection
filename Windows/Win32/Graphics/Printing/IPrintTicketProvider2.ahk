#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IPrintTicketProvider.ahk" { IPrintTicketProvider }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Data\Xml\MsXml\IXMLDOMDocument2.ahk" { IXMLDOMDocument2 }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IPrintTicketProvider2 extends IPrintTicketProvider {
    /**
     * The interface identifier for IPrintTicketProvider2
     * @type {Guid}
     */
    static IID := Guid("{b8a70ab2-3dfc-4fec-a074-511b13c651cb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrintTicketProvider2 interfaces
    */
    struct Vtbl extends IPrintTicketProvider.Vtbl {
        GetPrintDeviceCapabilities : IntPtr
        GetPrintDeviceResources    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrintTicketProvider2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IXMLDOMDocument2} pPrintTicket 
     * @returns {IXMLDOMDocument2} 
     */
    GetPrintDeviceCapabilities(pPrintTicket) {
        result := ComCall(10, this, "ptr", pPrintTicket, "ptr*", &ppDeviceCapabilities := 0, "HRESULT")
        return IXMLDOMDocument2(ppDeviceCapabilities)
    }

    /**
     * 
     * @param {PWSTR} pszLocaleName 
     * @param {IXMLDOMDocument2} pPrintTicket 
     * @returns {IXMLDOMDocument2} 
     */
    GetPrintDeviceResources(pszLocaleName, pPrintTicket) {
        pszLocaleName := pszLocaleName is String ? StrPtr(pszLocaleName) : pszLocaleName

        result := ComCall(11, this, "ptr", pszLocaleName, "ptr", pPrintTicket, "ptr*", &ppDeviceResources := 0, "HRESULT")
        return IXMLDOMDocument2(ppDeviceResources)
    }

    Query(iid) {
        if (IPrintTicketProvider2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPrintDeviceCapabilities := CallbackCreate(GetMethod(implObj, "GetPrintDeviceCapabilities"), flags, 3)
        this.vtbl.GetPrintDeviceResources := CallbackCreate(GetMethod(implObj, "GetPrintDeviceResources"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPrintDeviceCapabilities)
        CallbackFree(this.vtbl.GetPrintDeviceResources)
    }
}
