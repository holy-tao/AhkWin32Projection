#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IUPnPDeviceDocumentAccess interface enables an application to obtain the URL of the device description document.
 * @see https://learn.microsoft.com/windows/win32/api/upnp/nn-upnp-iupnpdevicedocumentaccess
 * @namespace Windows.Win32.Devices.Enumeration.Pnp
 */
export default struct IUPnPDeviceDocumentAccess extends IUnknown {
    /**
     * The interface identifier for IUPnPDeviceDocumentAccess
     * @type {Guid}
     */
    static IID := Guid("{e7772804-3287-418e-9072-cf2b47238981}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUPnPDeviceDocumentAccess interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDocumentURL : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUPnPDeviceDocumentAccess.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetDocumentURL method returns the URL from which the device description document can be loaded.
     * @remarks
     * This method does not support scripting.
     * @returns {BSTR} Receives the URL from which the device description document can be downloaded.
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevicedocumentaccess-getdocumenturl
     */
    GetDocumentURL() {
        pbstrDocument := BSTR.Owned()
        result := ComCall(3, this, BSTR.Ptr, pbstrDocument, "HRESULT")
        return pbstrDocument
    }

    Query(iid) {
        if (IUPnPDeviceDocumentAccess.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDocumentURL := CallbackCreate(GetMethod(implObj, "GetDocumentURL"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDocumentURL)
    }
}
