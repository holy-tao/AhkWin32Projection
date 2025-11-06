#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
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
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdeviceprovider-get_friendlyname
     */
    get_FriendlyName() {
        pbstrFriendlyName := BSTR()
        result := ComCall(7, this, "ptr", pbstrFriendlyName, "HRESULT")
        return pbstrFriendlyName
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdeviceprovider-get_imagename
     */
    get_ImageName() {
        pbstrImageName := BSTR()
        result := ComCall(8, this, "ptr", pbstrImageName, "HRESULT")
        return pbstrImageName
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdeviceprovider-get_uniquename
     */
    get_UniqueName() {
        pbstrUniqueName := BSTR()
        result := ComCall(9, this, "ptr", pbstrUniqueName, "HRESULT")
        return pbstrUniqueName
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdeviceprovider-get_tapiprovidername
     */
    get_TapiProviderName() {
        pbstrTapiProviderName := BSTR()
        result := ComCall(10, this, "ptr", pbstrTapiProviderName, "HRESULT")
        return pbstrTapiProviderName
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdeviceprovider-get_majorversion
     */
    get_MajorVersion() {
        result := ComCall(11, this, "int*", &plMajorVersion := 0, "HRESULT")
        return plMajorVersion
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdeviceprovider-get_minorversion
     */
    get_MinorVersion() {
        result := ComCall(12, this, "int*", &plMinorVersion := 0, "HRESULT")
        return plMinorVersion
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdeviceprovider-get_majorbuild
     */
    get_MajorBuild() {
        result := ComCall(13, this, "int*", &plMajorBuild := 0, "HRESULT")
        return plMajorBuild
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdeviceprovider-get_minorbuild
     */
    get_MinorBuild() {
        result := ComCall(14, this, "int*", &plMinorBuild := 0, "HRESULT")
        return plMinorBuild
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdeviceprovider-get_debug
     */
    get_Debug() {
        result := ComCall(15, this, "short*", &pbDebug := 0, "HRESULT")
        return pbDebug
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdeviceprovider-get_status
     */
    get_Status() {
        result := ComCall(16, this, "int*", &pStatus := 0, "HRESULT")
        return pStatus
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdeviceprovider-get_initerrorcode
     */
    get_InitErrorCode() {
        result := ComCall(17, this, "int*", &plInitErrorCode := 0, "HRESULT")
        return plInitErrorCode
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdeviceprovider-get_deviceids
     */
    get_DeviceIds() {
        pvDeviceIds := VARIANT()
        result := ComCall(18, this, "ptr", pvDeviceIds, "HRESULT")
        return pvDeviceIds
    }
}
