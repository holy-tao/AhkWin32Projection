#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWindowsMediaLibrarySharingDevices.ahk
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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["showShareMediaCPL", "get_userHomeMediaSharingState", "put_userHomeMediaSharingState", "get_userHomeMediaSharingLibraryName", "put_userHomeMediaSharingLibraryName", "get_computerHomeMediaSharingAllowedState", "put_computerHomeMediaSharingAllowedState", "get_userInternetMediaSharingState", "put_userInternetMediaSharingState", "get_computerInternetMediaSharingAllowedState", "put_computerInternetMediaSharingAllowedState", "get_internetMediaSharingSecurityGroup", "put_internetMediaSharingSecurityGroup", "get_allowSharingToAllDevices", "put_allowSharingToAllDevices", "setDefaultAuthorization", "setAuthorizationState", "getAllDevices", "get_customSettingsApplied"]

    /**
     * 
     * @param {BSTR} device 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmlss/nf-wmlss-iwindowsmedialibrarysharingservices-showsharemediacpl
     */
    showShareMediaCPL(device) {
        device := device is String ? BSTR.Alloc(device).Value : device

        result := ComCall(7, this, "ptr", device, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wmlss/nf-wmlss-iwindowsmedialibrarysharingservices-get_userhomemediasharingstate
     */
    get_userHomeMediaSharingState() {
        result := ComCall(8, this, "short*", &sharingEnabled := 0, "HRESULT")
        return sharingEnabled
    }

    /**
     * 
     * @param {VARIANT_BOOL} sharingEnabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmlss/nf-wmlss-iwindowsmedialibrarysharingservices-put_userhomemediasharingstate
     */
    put_userHomeMediaSharingState(sharingEnabled) {
        result := ComCall(9, this, "short", sharingEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wmlss/nf-wmlss-iwindowsmedialibrarysharingservices-get_userhomemediasharinglibraryname
     */
    get_userHomeMediaSharingLibraryName() {
        libraryName := BSTR()
        result := ComCall(10, this, "ptr", libraryName, "HRESULT")
        return libraryName
    }

    /**
     * 
     * @param {BSTR} libraryName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmlss/nf-wmlss-iwindowsmedialibrarysharingservices-put_userhomemediasharinglibraryname
     */
    put_userHomeMediaSharingLibraryName(libraryName) {
        libraryName := libraryName is String ? BSTR.Alloc(libraryName).Value : libraryName

        result := ComCall(11, this, "ptr", libraryName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wmlss/nf-wmlss-iwindowsmedialibrarysharingservices-get_computerhomemediasharingallowedstate
     */
    get_computerHomeMediaSharingAllowedState() {
        result := ComCall(12, this, "short*", &sharingAllowed := 0, "HRESULT")
        return sharingAllowed
    }

    /**
     * 
     * @param {VARIANT_BOOL} sharingAllowed 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmlss/nf-wmlss-iwindowsmedialibrarysharingservices-put_computerhomemediasharingallowedstate
     */
    put_computerHomeMediaSharingAllowedState(sharingAllowed) {
        result := ComCall(13, this, "short", sharingAllowed, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wmlss/nf-wmlss-iwindowsmedialibrarysharingservices-get_userinternetmediasharingstate
     */
    get_userInternetMediaSharingState() {
        result := ComCall(14, this, "short*", &sharingEnabled := 0, "HRESULT")
        return sharingEnabled
    }

    /**
     * 
     * @param {VARIANT_BOOL} sharingEnabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmlss/nf-wmlss-iwindowsmedialibrarysharingservices-put_userinternetmediasharingstate
     */
    put_userInternetMediaSharingState(sharingEnabled) {
        result := ComCall(15, this, "short", sharingEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wmlss/nf-wmlss-iwindowsmedialibrarysharingservices-get_computerinternetmediasharingallowedstate
     */
    get_computerInternetMediaSharingAllowedState() {
        result := ComCall(16, this, "short*", &sharingAllowed := 0, "HRESULT")
        return sharingAllowed
    }

    /**
     * 
     * @param {VARIANT_BOOL} sharingAllowed 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmlss/nf-wmlss-iwindowsmedialibrarysharingservices-put_computerinternetmediasharingallowedstate
     */
    put_computerInternetMediaSharingAllowedState(sharingAllowed) {
        result := ComCall(17, this, "short", sharingAllowed, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wmlss/nf-wmlss-iwindowsmedialibrarysharingservices-get_internetmediasharingsecuritygroup
     */
    get_internetMediaSharingSecurityGroup() {
        securityGroup := BSTR()
        result := ComCall(18, this, "ptr", securityGroup, "HRESULT")
        return securityGroup
    }

    /**
     * 
     * @param {BSTR} securityGroup 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmlss/nf-wmlss-iwindowsmedialibrarysharingservices-put_internetmediasharingsecuritygroup
     */
    put_internetMediaSharingSecurityGroup(securityGroup) {
        securityGroup := securityGroup is String ? BSTR.Alloc(securityGroup).Value : securityGroup

        result := ComCall(19, this, "ptr", securityGroup, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wmlss/nf-wmlss-iwindowsmedialibrarysharingservices-get_allowsharingtoalldevices
     */
    get_allowSharingToAllDevices() {
        result := ComCall(20, this, "short*", &sharingEnabled := 0, "HRESULT")
        return sharingEnabled
    }

    /**
     * 
     * @param {VARIANT_BOOL} sharingEnabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmlss/nf-wmlss-iwindowsmedialibrarysharingservices-put_allowsharingtoalldevices
     */
    put_allowSharingToAllDevices(sharingEnabled) {
        result := ComCall(21, this, "short", sharingEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} MACAddresses 
     * @param {BSTR} friendlyName 
     * @param {VARIANT_BOOL} authorization 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmlss/nf-wmlss-iwindowsmedialibrarysharingservices-setdefaultauthorization
     */
    setDefaultAuthorization(MACAddresses, friendlyName, authorization) {
        MACAddresses := MACAddresses is String ? BSTR.Alloc(MACAddresses).Value : MACAddresses
        friendlyName := friendlyName is String ? BSTR.Alloc(friendlyName).Value : friendlyName

        result := ComCall(22, this, "ptr", MACAddresses, "ptr", friendlyName, "short", authorization, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} MACAddress 
     * @param {VARIANT_BOOL} authorizationState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmlss/nf-wmlss-iwindowsmedialibrarysharingservices-setauthorizationstate
     */
    setAuthorizationState(MACAddress, authorizationState) {
        MACAddress := MACAddress is String ? BSTR.Alloc(MACAddress).Value : MACAddress

        result := ComCall(23, this, "ptr", MACAddress, "short", authorizationState, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IWindowsMediaLibrarySharingDevices} 
     * @see https://learn.microsoft.com/windows/win32/api/wmlss/nf-wmlss-iwindowsmedialibrarysharingservices-getalldevices
     */
    getAllDevices() {
        result := ComCall(24, this, "ptr*", &devices := 0, "HRESULT")
        return IWindowsMediaLibrarySharingDevices(devices)
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wmlss/nf-wmlss-iwindowsmedialibrarysharingservices-get_customsettingsapplied
     */
    get_customSettingsApplied() {
        result := ComCall(25, this, "short*", &customSettingsApplied := 0, "HRESULT")
        return customSettingsApplied
    }
}
