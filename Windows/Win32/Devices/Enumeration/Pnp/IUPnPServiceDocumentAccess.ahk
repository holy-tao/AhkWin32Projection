#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Use this interface to retrieve and provide the Service Control Protocol Description (SCPD) document to a UPnP control point application to expose actions supported by the service and provide information about state variables.
 * @see https://learn.microsoft.com/windows/win32/api/upnp/nn-upnp-iupnpservicedocumentaccess
 * @namespace Windows.Win32.Devices.Enumeration.Pnp
 */
export default struct IUPnPServiceDocumentAccess extends IUnknown {
    /**
     * The interface identifier for IUPnPServiceDocumentAccess
     * @type {Guid}
     */
    static IID := Guid("{21905529-0a5e-4589-825d-7e6d87ea6998}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUPnPServiceDocumentAccess interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDocumentURL : IntPtr
        GetDocument    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUPnPServiceDocumentAccess.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * GetDocumentURL method retrieves the Service Control Protocol Description (SCPD) URL for a service object. Using this URL, the UPnP control point can download the complete SCPD document.
     * @returns {BSTR} The URL to the complete SCPD document.
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpservicedocumentaccess-getdocumenturl
     */
    GetDocumentURL() {
        pbstrDocUrl := BSTR.Owned()
        result := ComCall(3, this, BSTR.Ptr, pbstrDocUrl, "HRESULT")
        return pbstrDocUrl
    }

    /**
     * GetDocument method retrieves the Service Control Protocol Description (SCPD) document for a service object.
     * @returns {BSTR} The  complete SCPD document.
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpservicedocumentaccess-getdocument
     */
    GetDocument() {
        pbstrDoc := BSTR.Owned()
        result := ComCall(4, this, BSTR.Ptr, pbstrDoc, "HRESULT")
        return pbstrDoc
    }

    Query(iid) {
        if (IUPnPServiceDocumentAccess.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDocumentURL := CallbackCreate(GetMethod(implObj, "GetDocumentURL"), flags, 2)
        this.vtbl.GetDocument := CallbackCreate(GetMethod(implObj, "GetDocument"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDocumentURL)
        CallbackFree(this.vtbl.GetDocument)
    }
}
