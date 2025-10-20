#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IFaxDeviceProvider interface defines a configuration object used by a fax client application to retrieve information about a fax service provider (FSP) registered with the fax service.
 * @remarks
 * 
  * A default implementation of <b>IFaxDeviceProvider</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdeviceprovider">FaxDeviceProvider</a> object.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nn-faxcomex-ifaxdeviceprovider
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxDeviceProvider extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFaxDeviceProvider
     * @type {Guid}
     */
    static IID => Guid("{290eac63-83ec-449c-8417-f148df8c682a}")

    /**
     * The class identifier for FaxDeviceProvider
     * @type {Guid}
     */
    static CLSID => Guid("{17cf1aa3-f5eb-484a-9c9a-4440a5baabfc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FriendlyName", "get_ImageName", "get_UniqueName", "get_TapiProviderName", "get_MajorVersion", "get_MinorVersion", "get_MajorBuild", "get_MinorBuild", "get_Debug", "get_Status", "get_InitErrorCode", "get_DeviceIds"]

    /**
     * 
     * @param {Pointer<BSTR>} pbstrFriendlyName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdeviceprovider-get_friendlyname
     */
    get_FriendlyName(pbstrFriendlyName) {
        result := ComCall(7, this, "ptr", pbstrFriendlyName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrImageName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdeviceprovider-get_imagename
     */
    get_ImageName(pbstrImageName) {
        result := ComCall(8, this, "ptr", pbstrImageName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrUniqueName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdeviceprovider-get_uniquename
     */
    get_UniqueName(pbstrUniqueName) {
        result := ComCall(9, this, "ptr", pbstrUniqueName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrTapiProviderName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdeviceprovider-get_tapiprovidername
     */
    get_TapiProviderName(pbstrTapiProviderName) {
        result := ComCall(10, this, "ptr", pbstrTapiProviderName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plMajorVersion 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdeviceprovider-get_majorversion
     */
    get_MajorVersion(plMajorVersion) {
        result := ComCall(11, this, "int*", plMajorVersion, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plMinorVersion 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdeviceprovider-get_minorversion
     */
    get_MinorVersion(plMinorVersion) {
        result := ComCall(12, this, "int*", plMinorVersion, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plMajorBuild 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdeviceprovider-get_majorbuild
     */
    get_MajorBuild(plMajorBuild) {
        result := ComCall(13, this, "int*", plMajorBuild, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plMinorBuild 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdeviceprovider-get_minorbuild
     */
    get_MinorBuild(plMinorBuild) {
        result := ComCall(14, this, "int*", plMinorBuild, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbDebug 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdeviceprovider-get_debug
     */
    get_Debug(pbDebug) {
        result := ComCall(15, this, "ptr", pbDebug, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdeviceprovider-get_status
     */
    get_Status(pStatus) {
        result := ComCall(16, this, "int*", pStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plInitErrorCode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdeviceprovider-get_initerrorcode
     */
    get_InitErrorCode(plInitErrorCode) {
        result := ComCall(17, this, "int*", plInitErrorCode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvDeviceIds 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdeviceprovider-get_deviceids
     */
    get_DeviceIds(pvDeviceIds) {
        result := ComCall(18, this, "ptr", pvDeviceIds, "HRESULT")
        return result
    }
}
