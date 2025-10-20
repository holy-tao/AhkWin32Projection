#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IWindowsMediaLibrarySharingServices interface defines methods that configure the sharing of media libraries among users on the local computer, users on the home network, and users on the Internet.
 * @remarks
 * 
  * To obtain an <b>IWindowsMediaLibrarySharingServices</b> interface, call <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a> to create a <b>WindowsMediaLibrarySharingServices</b> object.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wmlss/nn-wmlss-iwindowsmedialibrarysharingservices
 * @namespace Windows.Win32.Media.LibrarySharingServices
 * @version v4.0.30319
 */
class IWindowsMediaLibrarySharingServices extends IDispatch{
    /**
     * The interface identifier for IWindowsMediaLibrarySharingServices
     * @type {Guid}
     */
    static IID => Guid("{01f5f85e-0a81-40da-a7c8-21ef3af8440c}")

    /**
     * The class identifier for WindowsMediaLibrarySharingServices
     * @type {Guid}
     */
    static CLSID => Guid("{ad581b00-7b64-4e59-a38d-d2c5bf51ddb3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {BSTR} device 
     * @returns {HRESULT} 
     */
    showShareMediaCPL(device) {
        device := device is String ? BSTR.Alloc(device).Value : device

        result := ComCall(7, this, "ptr", device, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} sharingEnabled 
     * @returns {HRESULT} 
     */
    get_userHomeMediaSharingState(sharingEnabled) {
        result := ComCall(8, this, "ptr", sharingEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} sharingEnabled 
     * @returns {HRESULT} 
     */
    put_userHomeMediaSharingState(sharingEnabled) {
        result := ComCall(9, this, "short", sharingEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} libraryName 
     * @returns {HRESULT} 
     */
    get_userHomeMediaSharingLibraryName(libraryName) {
        result := ComCall(10, this, "ptr", libraryName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} libraryName 
     * @returns {HRESULT} 
     */
    put_userHomeMediaSharingLibraryName(libraryName) {
        libraryName := libraryName is String ? BSTR.Alloc(libraryName).Value : libraryName

        result := ComCall(11, this, "ptr", libraryName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} sharingAllowed 
     * @returns {HRESULT} 
     */
    get_computerHomeMediaSharingAllowedState(sharingAllowed) {
        result := ComCall(12, this, "ptr", sharingAllowed, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} sharingAllowed 
     * @returns {HRESULT} 
     */
    put_computerHomeMediaSharingAllowedState(sharingAllowed) {
        result := ComCall(13, this, "short", sharingAllowed, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} sharingEnabled 
     * @returns {HRESULT} 
     */
    get_userInternetMediaSharingState(sharingEnabled) {
        result := ComCall(14, this, "ptr", sharingEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} sharingEnabled 
     * @returns {HRESULT} 
     */
    put_userInternetMediaSharingState(sharingEnabled) {
        result := ComCall(15, this, "short", sharingEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} sharingAllowed 
     * @returns {HRESULT} 
     */
    get_computerInternetMediaSharingAllowedState(sharingAllowed) {
        result := ComCall(16, this, "ptr", sharingAllowed, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} sharingAllowed 
     * @returns {HRESULT} 
     */
    put_computerInternetMediaSharingAllowedState(sharingAllowed) {
        result := ComCall(17, this, "short", sharingAllowed, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} securityGroup 
     * @returns {HRESULT} 
     */
    get_internetMediaSharingSecurityGroup(securityGroup) {
        result := ComCall(18, this, "ptr", securityGroup, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} securityGroup 
     * @returns {HRESULT} 
     */
    put_internetMediaSharingSecurityGroup(securityGroup) {
        securityGroup := securityGroup is String ? BSTR.Alloc(securityGroup).Value : securityGroup

        result := ComCall(19, this, "ptr", securityGroup, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} sharingEnabled 
     * @returns {HRESULT} 
     */
    get_allowSharingToAllDevices(sharingEnabled) {
        result := ComCall(20, this, "ptr", sharingEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} sharingEnabled 
     * @returns {HRESULT} 
     */
    put_allowSharingToAllDevices(sharingEnabled) {
        result := ComCall(21, this, "short", sharingEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} MACAddresses 
     * @param {BSTR} friendlyName 
     * @param {VARIANT_BOOL} authorization 
     * @returns {HRESULT} 
     */
    setDefaultAuthorization(MACAddresses, friendlyName, authorization) {
        MACAddresses := MACAddresses is String ? BSTR.Alloc(MACAddresses).Value : MACAddresses
        friendlyName := friendlyName is String ? BSTR.Alloc(friendlyName).Value : friendlyName

        result := ComCall(22, this, "ptr", MACAddresses, "ptr", friendlyName, "short", authorization, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} MACAddress 
     * @param {VARIANT_BOOL} authorizationState 
     * @returns {HRESULT} 
     */
    setAuthorizationState(MACAddress, authorizationState) {
        MACAddress := MACAddress is String ? BSTR.Alloc(MACAddress).Value : MACAddress

        result := ComCall(23, this, "ptr", MACAddress, "short", authorizationState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWindowsMediaLibrarySharingDevices>} devices 
     * @returns {HRESULT} 
     */
    getAllDevices(devices) {
        result := ComCall(24, this, "ptr", devices, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} customSettingsApplied 
     * @returns {HRESULT} 
     */
    get_customSettingsApplied(customSettingsApplied) {
        result := ComCall(25, this, "ptr", customSettingsApplied, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
