#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Enables the caller to specify additional HTTP headers sent in HTTP requests to a device.
 * @remarks
 * This interface is obtained by calling QueryInterface on the same object that provides an implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nn-upnp-iupnpdevicefinder">IUPnPDeviceFinder</a> or <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nn-upnp-iupnpdescriptiondocument">IUPnPDescriptionDocument</a> interfaces, after which <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nf-upnp-iupnphttpheadercontrol-addrequestheaders">AddRequestHeaders</a> can be called on it.
 * @see https://learn.microsoft.com/windows/win32/api/upnp/nn-upnp-iupnphttpheadercontrol
 * @namespace Windows.Win32.Devices.Enumeration.Pnp
 */
export default struct IUPnPHttpHeaderControl extends IUnknown {
    /**
     * The interface identifier for IUPnPHttpHeaderControl
     * @type {Guid}
     */
    static IID := Guid("{0405af4f-8b5c-447c-80f2-b75984a31f3c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUPnPHttpHeaderControl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddRequestHeaders : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUPnPHttpHeaderControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Adds the supplied HTTP header to an HTTP request.
     * @param {BSTR} bstrHttpHeaders String value that contains the HTTP header to attach to the request. For example, "User-Agent: DLNADOC/1.50\r\n".
     * 
     * 
     * <div class="alert"><b>Note</b>  For Windows 7 and Windows Server 2008 R2, only the User Agent HTTP header is supported.</div>
     * <div> </div>
     * @returns {HRESULT} If the method succeeds, the return value is S_OK. Otherwise, the method returns one of the COM error codes defined in WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnphttpheadercontrol-addrequestheaders
     */
    AddRequestHeaders(bstrHttpHeaders) {
        bstrHttpHeaders := bstrHttpHeaders is String ? BSTR.Alloc(bstrHttpHeaders).Value : bstrHttpHeaders

        result := ComCall(3, this, BSTR, bstrHttpHeaders, "HRESULT")
        return result
    }

    Query(iid) {
        if (IUPnPHttpHeaderControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddRequestHeaders := CallbackCreate(GetMethod(implObj, "AddRequestHeaders"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddRequestHeaders)
    }
}
