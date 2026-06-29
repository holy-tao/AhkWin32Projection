#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Implements methods that get data from a Digital Video Broadcast (DVB) service descriptor.
 * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nn-dvbsiparser-idvbservicedescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IDvbServiceDescriptor extends IUnknown {
    /**
     * The interface identifier for IDvbServiceDescriptor
     * @type {Guid}
     */
    static IID := Guid("{f9c7fbcf-e2d6-464d-b32d-2ef526e49290}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDvbServiceDescriptor interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetTag                   : IntPtr
        GetLength                : IntPtr
        GetServiceType           : IntPtr
        GetServiceProviderName   : IntPtr
        GetServiceProviderNameW  : IntPtr
        GetServiceName           : IntPtr
        GetProcessedServiceName  : IntPtr
        GetServiceNameEmphasized : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDvbServiceDescriptor.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the tag identifying a Digital Video Broadcast (DVB) service descriptor.
     * @returns {Integer} Receives the service descriptor tag. This value is 0x48 for service descriptors.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbservicedescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the length of a Digital Video Broadcast (DVB) service descriptor.
     * @returns {Integer} Receives the descriptor length, in bytes.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbservicedescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the service_type field value from a Digital Video Broadcast (DVB) service descriptor.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbservicedescriptor-getservicetype
     */
    GetServiceType() {
        result := ComCall(5, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the service provider name from a Digital Video Broadcast (DVB) service descriptor.
     * @returns {Pointer<Integer>} Pointer to a buffer that receives the service provider name. The caller is responsible for freeing this memory.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbservicedescriptor-getserviceprovidername
     */
    GetServiceProviderName() {
        result := ComCall(6, this, "ptr*", &pszName := 0, "HRESULT")
        return pszName
    }

    /**
     * Gets the service provider name string from a Digital Video Broadcast (DVB) service descriptor.
     * @returns {BSTR} Pointer to a buffer that receives the service provider name string. The caller is responsible for freeing this memory.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbservicedescriptor-getserviceprovidernamew
     */
    GetServiceProviderNameW() {
        pbstrName := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * Gets the service_name field from a Digital Video Broadcast (DVB) service descriptor.
     * @returns {Pointer<Integer>} Pointer to a memory block that receives the service name. The caller is responsible for releasing this memory.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbservicedescriptor-getservicename
     */
    GetServiceName() {
        result := ComCall(8, this, "ptr*", &pszName := 0, "HRESULT")
        return pszName
    }

    /**
     * Gets the processed service name from a Digital Video Broadcast (DVB) service descriptor.
     * @remarks
     * This method calls <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-idvbservicedescriptor2-getservicenamew">IDvbServiceDescriptor2::GetServiceNameW</a> to get the processed  service name. It is provided to maintain compatibility with  the original DVB service descriptor specification.
     * @returns {BSTR} Pointer to a buffer that receives the service name. The caller is responsible for freeing this memory.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbservicedescriptor-getprocessedservicename
     */
    GetProcessedServiceName() {
        pbstrName := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * Gets the emphasized service name from a Digital Video Broadcast (DVB) service descriptor.
     * @remarks
     * This method calls <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-idvbservicedescriptor-getserviceprovidernamew">IDvbServiceDescriptor::GetServiceProviderNameW</a> to get the emphasized service name. It is provided to maintain compatibility with  the original DVB service descriptor specification.
     * @returns {BSTR} Pointer to a buffer that receives the service name. The caller is responsible for freeing this memory.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbservicedescriptor-getservicenameemphasized
     */
    GetServiceNameEmphasized() {
        pbstrName := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, pbstrName, "HRESULT")
        return pbstrName
    }

    Query(iid) {
        if (IDvbServiceDescriptor.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetTag := CallbackCreate(GetMethod(implObj, "GetTag"), flags, 2)
        this.vtbl.GetLength := CallbackCreate(GetMethod(implObj, "GetLength"), flags, 2)
        this.vtbl.GetServiceType := CallbackCreate(GetMethod(implObj, "GetServiceType"), flags, 2)
        this.vtbl.GetServiceProviderName := CallbackCreate(GetMethod(implObj, "GetServiceProviderName"), flags, 2)
        this.vtbl.GetServiceProviderNameW := CallbackCreate(GetMethod(implObj, "GetServiceProviderNameW"), flags, 2)
        this.vtbl.GetServiceName := CallbackCreate(GetMethod(implObj, "GetServiceName"), flags, 2)
        this.vtbl.GetProcessedServiceName := CallbackCreate(GetMethod(implObj, "GetProcessedServiceName"), flags, 2)
        this.vtbl.GetServiceNameEmphasized := CallbackCreate(GetMethod(implObj, "GetServiceNameEmphasized"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetTag)
        CallbackFree(this.vtbl.GetLength)
        CallbackFree(this.vtbl.GetServiceType)
        CallbackFree(this.vtbl.GetServiceProviderName)
        CallbackFree(this.vtbl.GetServiceProviderNameW)
        CallbackFree(this.vtbl.GetServiceName)
        CallbackFree(this.vtbl.GetProcessedServiceName)
        CallbackFree(this.vtbl.GetServiceNameEmphasized)
    }
}
