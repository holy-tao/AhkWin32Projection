#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Implements methods that get data from a Digital Video Broadcast (DVB) service descriptor.
 * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nn-dvbsiparser-idvbservicedescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IDvbServiceDescriptor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDvbServiceDescriptor
     * @type {Guid}
     */
    static IID => Guid("{f9c7fbcf-e2d6-464d-b32d-2ef526e49290}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTag", "GetLength", "GetServiceType", "GetServiceProviderName", "GetServiceProviderNameW", "GetServiceName", "GetProcessedServiceName", "GetServiceNameEmphasized"]

    /**
     * Gets the tag identifying a Digital Video Broadcast (DVB) service descriptor.
     * @returns {Integer} Receives the service descriptor tag. This value is 0x48 for service descriptors.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbservicedescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the length of a Digital Video Broadcast (DVB) service descriptor.
     * @returns {Integer} Receives the descriptor length, in bytes.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbservicedescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the service_type field value from a Digital Video Broadcast (DVB) service descriptor.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbservicedescriptor-getservicetype
     */
    GetServiceType() {
        result := ComCall(5, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the service provider name from a Digital Video Broadcast (DVB) service descriptor.
     * @returns {Pointer<Integer>} Pointer to a buffer that receives the service provider name. The caller is responsible for freeing this memory.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbservicedescriptor-getserviceprovidername
     */
    GetServiceProviderName() {
        result := ComCall(6, this, "ptr*", &pszName := 0, "HRESULT")
        return pszName
    }

    /**
     * Gets the service provider name string from a Digital Video Broadcast (DVB) service descriptor.
     * @returns {BSTR} Pointer to a buffer that receives the service provider name string. The caller is responsible for freeing this memory.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbservicedescriptor-getserviceprovidernamew
     */
    GetServiceProviderNameW() {
        pbstrName := BSTR()
        result := ComCall(7, this, "ptr", pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * Gets the service_name field from a Digital Video Broadcast (DVB) service descriptor.
     * @returns {Pointer<Integer>} Pointer to a memory block that receives the service name. The caller is responsible for releasing this memory.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbservicedescriptor-getservicename
     */
    GetServiceName() {
        result := ComCall(8, this, "ptr*", &pszName := 0, "HRESULT")
        return pszName
    }

    /**
     * Gets the processed service name from a Digital Video Broadcast (DVB) service descriptor.
     * @returns {BSTR} Pointer to a buffer that receives the service name. The caller is responsible for freeing this memory.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbservicedescriptor-getprocessedservicename
     */
    GetProcessedServiceName() {
        pbstrName := BSTR()
        result := ComCall(9, this, "ptr", pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * Gets the emphasized service name from a Digital Video Broadcast (DVB) service descriptor.
     * @returns {BSTR} Pointer to a buffer that receives the service name. The caller is responsible for freeing this memory.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbservicedescriptor-getservicenameemphasized
     */
    GetServiceNameEmphasized() {
        pbstrName := BSTR()
        result := ComCall(10, this, "ptr", pbstrName, "HRESULT")
        return pbstrName
    }
}
