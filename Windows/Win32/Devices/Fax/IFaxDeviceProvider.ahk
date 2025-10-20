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
     * 
     * @param {Pointer<BSTR>} pbstrFriendlyName 
     * @returns {HRESULT} 
     */
    get_FriendlyName(pbstrFriendlyName) {
        result := ComCall(7, this, "ptr", pbstrFriendlyName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrImageName 
     * @returns {HRESULT} 
     */
    get_ImageName(pbstrImageName) {
        result := ComCall(8, this, "ptr", pbstrImageName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrUniqueName 
     * @returns {HRESULT} 
     */
    get_UniqueName(pbstrUniqueName) {
        result := ComCall(9, this, "ptr", pbstrUniqueName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrTapiProviderName 
     * @returns {HRESULT} 
     */
    get_TapiProviderName(pbstrTapiProviderName) {
        result := ComCall(10, this, "ptr", pbstrTapiProviderName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plMajorVersion 
     * @returns {HRESULT} 
     */
    get_MajorVersion(plMajorVersion) {
        result := ComCall(11, this, "int*", plMajorVersion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plMinorVersion 
     * @returns {HRESULT} 
     */
    get_MinorVersion(plMinorVersion) {
        result := ComCall(12, this, "int*", plMinorVersion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plMajorBuild 
     * @returns {HRESULT} 
     */
    get_MajorBuild(plMajorBuild) {
        result := ComCall(13, this, "int*", plMajorBuild, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plMinorBuild 
     * @returns {HRESULT} 
     */
    get_MinorBuild(plMinorBuild) {
        result := ComCall(14, this, "int*", plMinorBuild, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbDebug 
     * @returns {HRESULT} 
     */
    get_Debug(pbDebug) {
        result := ComCall(15, this, "ptr", pbDebug, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pStatus 
     * @returns {HRESULT} 
     */
    get_Status(pStatus) {
        result := ComCall(16, this, "int*", pStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plInitErrorCode 
     * @returns {HRESULT} 
     */
    get_InitErrorCode(plInitErrorCode) {
        result := ComCall(17, this, "int*", plInitErrorCode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvDeviceIds 
     * @returns {HRESULT} 
     */
    get_DeviceIds(pvDeviceIds) {
        result := ComCall(18, this, "ptr", pvDeviceIds, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
