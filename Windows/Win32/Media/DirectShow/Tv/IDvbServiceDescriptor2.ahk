#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDvbServiceDescriptor.ahk" { IDvbServiceDescriptor }
#Import ".\DVB_STRCONV_MODE.ahk" { DVB_STRCONV_MODE }

/**
 * Implements methods that get the string values from fields in a Digital Video Broadcast (DVB) service descriptor. The service descriptor describes the service type, and provides the names of the service provider and the service in text form.
 * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nn-dvbsiparser-idvbservicedescriptor2
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IDvbServiceDescriptor2 extends IDvbServiceDescriptor {
    /**
     * The interface identifier for IDvbServiceDescriptor2
     * @type {Guid}
     */
    static IID := Guid("{d6c76506-85ab-487c-9b2b-36416511e4a2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDvbServiceDescriptor2 interfaces
    */
    struct Vtbl extends IDvbServiceDescriptor.Vtbl {
        GetServiceProviderNameW : IntPtr
        GetServiceNameW         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDvbServiceDescriptor2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets a string containing the service provider name from a Digital Video Broadcast (DVB) service descriptor.
     * @param {DVB_STRCONV_MODE} convMode 
     * @returns {BSTR} Receives the service provider name string as a <b>BSTR</b>. The caller must free the string by calling <b>SysFreeString</b>.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbservicedescriptor2-getserviceprovidernamew
     */
    GetServiceProviderNameW(convMode) {
        pbstrName := BSTR.Owned()
        result := ComCall(11, this, DVB_STRCONV_MODE, convMode, BSTR.Ptr, pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * Gets a string containing the service name from a Digital Video Broadcast (DVB) service descriptor.
     * @param {DVB_STRCONV_MODE} convMode 
     * @returns {BSTR} Receives the service name string as a <b>BSTR</b>. The caller must free the string by calling <b>SysFreeString</b>.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbservicedescriptor2-getservicenamew
     */
    GetServiceNameW(convMode) {
        pbstrName := BSTR.Owned()
        result := ComCall(12, this, DVB_STRCONV_MODE, convMode, BSTR.Ptr, pbstrName, "HRESULT")
        return pbstrName
    }

    Query(iid) {
        if (IDvbServiceDescriptor2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetServiceProviderNameW := CallbackCreate(GetMethod(implObj, "GetServiceProviderNameW"), flags, 3)
        this.vtbl.GetServiceNameW := CallbackCreate(GetMethod(implObj, "GetServiceNameW"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetServiceProviderNameW)
        CallbackFree(this.vtbl.GetServiceNameW)
    }
}
