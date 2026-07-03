#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides a method to obtain the entire XML device description document for a specific device.
 * @remarks
 * This interface is obtained by calling QueryInterface on the same object that provides an implementation of <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nn-upnp-iupnpdevice">IUPnPDevice</a>, after which <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nf-upnp-iupnpdevicedocumentaccessex-getdocument">GetDocument</a> can be called on it.
 * @see https://learn.microsoft.com/windows/win32/api/upnp/nn-upnp-iupnpdevicedocumentaccessex
 * @namespace Windows.Win32.Devices.Enumeration.Pnp
 */
export default struct IUPnPDeviceDocumentAccessEx extends IUnknown {
    /**
     * The interface identifier for IUPnPDeviceDocumentAccessEx
     * @type {Guid}
     */
    static IID := Guid("{c4bc4050-6178-4bd1-a4b8-6398321f3247}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUPnPDeviceDocumentAccessEx interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDocument : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUPnPDeviceDocumentAccessEx.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the XML device description document for a UPnP device.
     * @remarks
     * <div class="alert"><b>Note</b>  This method does not support scripting.</div>
     * <div> </div>
     * @returns {BSTR} Receives the XML device description document for the device.
     * 
     * After obtaining the XML device document, the memory for this parameter must be free by passing it to SysFreeString.
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevicedocumentaccessex-getdocument
     */
    GetDocument() {
        pbstrDocument := BSTR.Owned()
        result := ComCall(3, this, BSTR.Ptr, pbstrDocument, "HRESULT")
        return pbstrDocument
    }

    Query(iid) {
        if (IUPnPDeviceDocumentAccessEx.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDocument := CallbackCreate(GetMethod(implObj, "GetDocument"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDocument)
    }
}
