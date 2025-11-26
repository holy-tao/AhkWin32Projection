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
     * @type {VARIANT_BOOL} 
     */
    userHomeMediaSharingState {
        get => this.get_userHomeMediaSharingState()
        set => this.put_userHomeMediaSharingState(value)
    }

    /**
     * @type {BSTR} 
     */
    userHomeMediaSharingLibraryName {
        get => this.get_userHomeMediaSharingLibraryName()
        set => this.put_userHomeMediaSharingLibraryName(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    computerHomeMediaSharingAllowedState {
        get => this.get_computerHomeMediaSharingAllowedState()
        set => this.put_computerHomeMediaSharingAllowedState(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    userInternetMediaSharingState {
        get => this.get_userInternetMediaSharingState()
        set => this.put_userInternetMediaSharingState(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    computerInternetMediaSharingAllowedState {
        get => this.get_computerInternetMediaSharingAllowedState()
        set => this.put_computerInternetMediaSharingAllowedState(value)
    }

    /**
     * @type {BSTR} 
     */
    internetMediaSharingSecurityGroup {
        get => this.get_internetMediaSharingSecurityGroup()
        set => this.put_internetMediaSharingSecurityGroup(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    allowSharingToAllDevices {
        get => this.get_allowSharingToAllDevices()
        set => this.put_allowSharingToAllDevices(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    customSettingsApplied {
        get => this.get_customSettingsApplied()
    }

    /**
     * The showShareMediaCPL method displays the media sharing page in the Control Panel and highlights a specified device.
     * @param {BSTR} device <b>BSTR</b>
     * @returns {HRESULT} This method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmlss/nf-wmlss-iwindowsmedialibrarysharingservices-showsharemediacpl
     */
    showShareMediaCPL(device) {
        device := device is String ? BSTR.Alloc(device).Value : device

        result := ComCall(7, this, "ptr", device, "HRESULT")
        return result
    }

    /**
     * The get_userHomeMediaSharingState method retrieves a value that indicates whether the current user's media library is shared on the home network.
     * @returns {VARIANT_BOOL} Pointer to a <b>VARIANT_BOOL</b> that receives <b>VARIANT_TRUE</b> if the media library is shared and <b>VARIANT_FALSE</b> if the media library is not shared.
     * @see https://docs.microsoft.com/windows/win32/api//wmlss/nf-wmlss-iwindowsmedialibrarysharingservices-get_userhomemediasharingstate
     */
    get_userHomeMediaSharingState() {
        result := ComCall(8, this, "short*", &sharingEnabled := 0, "HRESULT")
        return sharingEnabled
    }

    /**
     * The put_userHomeMediaSharingState method enables or disables sharing of the current user's media library on the home network.
     * @param {VARIANT_BOOL} sharingEnabled A <b>VARIANT_BOOL</b> that specifies whether sharing is enabled (<b>VARIANT_TRUE</b>) or disabled (<b>VARIANT_FALSE</b>) for the current user.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmlss/nf-wmlss-iwindowsmedialibrarysharingservices-put_userhomemediasharingstate
     */
    put_userHomeMediaSharingState(sharingEnabled) {
        result := ComCall(9, this, "short", sharingEnabled, "HRESULT")
        return result
    }

    /**
     * The get_userHomeMediaSharingLibraryName method retrieves the name of the current user's shared media library.
     * @returns {BSTR} Pointer to a <b>BSTR</b> that receives the library name.
     * @see https://docs.microsoft.com/windows/win32/api//wmlss/nf-wmlss-iwindowsmedialibrarysharingservices-get_userhomemediasharinglibraryname
     */
    get_userHomeMediaSharingLibraryName() {
        libraryName := BSTR()
        result := ComCall(10, this, "ptr", libraryName, "HRESULT")
        return libraryName
    }

    /**
     * The put_userHomeMediaSharingLibraryName method sets the name of the current user's shared media library.
     * @param {BSTR} libraryName A <b>BSTR</b> that specifies the library name.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmlss/nf-wmlss-iwindowsmedialibrarysharingservices-put_userhomemediasharinglibraryname
     */
    put_userHomeMediaSharingLibraryName(libraryName) {
        libraryName := libraryName is String ? BSTR.Alloc(libraryName).Value : libraryName

        result := ComCall(11, this, "ptr", libraryName, "HRESULT")
        return result
    }

    /**
     * The get_computerHomeMediaSharingAllowedState method retrieves a value that indicates whether media libraries on the computer are allowed to be shared on the home network.
     * @returns {VARIANT_BOOL} Pointer to a <b>VARIANT_BOOL</b> that receives <b>VARIANT_TRUE</b> if  media libraries are allowed to be shared and <b>VARIANT_FALSE</b> if media libraries are not allowed to be shared.
     * @see https://docs.microsoft.com/windows/win32/api//wmlss/nf-wmlss-iwindowsmedialibrarysharingservices-get_computerhomemediasharingallowedstate
     */
    get_computerHomeMediaSharingAllowedState() {
        result := ComCall(12, this, "short*", &sharingAllowed := 0, "HRESULT")
        return sharingAllowed
    }

    /**
     * The put_computerHomeMediaSharingAllowedState method specifies whether media libraries on the computer are allowed to be shared on the home network.
     * @param {VARIANT_BOOL} sharingAllowed A <b>VARIANT_BOOL</b> that specifies VARIANT_TRUE if media libraries are allowed to be shared  or <b>VARIANT_FALSE</b> if media libraries are not allowed to be shared.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmlss/nf-wmlss-iwindowsmedialibrarysharingservices-put_computerhomemediasharingallowedstate
     */
    put_computerHomeMediaSharingAllowedState(sharingAllowed) {
        result := ComCall(13, this, "short", sharingAllowed, "HRESULT")
        return result
    }

    /**
     * The get_userInternetMediaSharingState method retrieves a value that indicates whether the current user's media library is shared on the Internet.
     * @returns {VARIANT_BOOL} Pointer to a <b>VARIANT_BOOL</b> that receives <b>VARIANT_TRUE</b> if the media library is shared and <b>VARIANT_FALSE</b> if the media library is not shared.
     * @see https://docs.microsoft.com/windows/win32/api//wmlss/nf-wmlss-iwindowsmedialibrarysharingservices-get_userinternetmediasharingstate
     */
    get_userInternetMediaSharingState() {
        result := ComCall(14, this, "short*", &sharingEnabled := 0, "HRESULT")
        return sharingEnabled
    }

    /**
     * The put_userInternetMediaSharingState method enables or disables sharing of the current user's media library on the Internet.
     * @param {VARIANT_BOOL} sharingEnabled A <b>VARIANT_BOOL</b> that specifies whether sharing on the Internet is enabled (<b>VARIANT_TRUE</b>) or disabled (<b>VARIANT_FALSE</b>) for the current user.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmlss/nf-wmlss-iwindowsmedialibrarysharingservices-put_userinternetmediasharingstate
     */
    put_userInternetMediaSharingState(sharingEnabled) {
        result := ComCall(15, this, "short", sharingEnabled, "HRESULT")
        return result
    }

    /**
     * The get_computerInternetMediaSharingAllowedState method retrieves a value that indicates whether media libraries on the computer are allowed to be shared on the Internet.
     * @returns {VARIANT_BOOL} Pointer to a <b>VARIANT_BOOL</b> that receives <b>VARIANT_TRUE</b> if media libraries are allowed to be shared and <b>VARIANT_FALSE</b> if media libraries are not allowed to be shared.
     * @see https://docs.microsoft.com/windows/win32/api//wmlss/nf-wmlss-iwindowsmedialibrarysharingservices-get_computerinternetmediasharingallowedstate
     */
    get_computerInternetMediaSharingAllowedState() {
        result := ComCall(16, this, "short*", &sharingAllowed := 0, "HRESULT")
        return sharingAllowed
    }

    /**
     * The put_computerInternetMediaSharingAllowedState method specifies whether media libraries on the computer are allowed to be shared on the Internet.
     * @param {VARIANT_BOOL} sharingAllowed A <b>VARIANT_BOOL</b> that specifies whether sharing is allowed (<b>VARIANT_TRUE</b>) or not allowed (<b>VARIANT_FALSE</b>).
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmlss/nf-wmlss-iwindowsmedialibrarysharingservices-put_computerinternetmediasharingallowedstate
     */
    put_computerInternetMediaSharingAllowedState(sharingAllowed) {
        result := ComCall(17, this, "short", sharingAllowed, "HRESULT")
        return result
    }

    /**
     * The get_internetMediaSharingSecurityGroup method retrieves the name of the security group that is used to authenticate connections coming in over the Internet.
     * @returns {BSTR} A pointer to a <b>BSTR</b> that receives the name of the security group.
     * @see https://docs.microsoft.com/windows/win32/api//wmlss/nf-wmlss-iwindowsmedialibrarysharingservices-get_internetmediasharingsecuritygroup
     */
    get_internetMediaSharingSecurityGroup() {
        securityGroup := BSTR()
        result := ComCall(18, this, "ptr", securityGroup, "HRESULT")
        return securityGroup
    }

    /**
     * The put_internetMediaSharingSecurityGroup method specifies the name of the security group that is used to authenticate connections coming in over the Internet.
     * @param {BSTR} securityGroup A <b>BSTR</b> that specifies the name of the security group.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmlss/nf-wmlss-iwindowsmedialibrarysharingservices-put_internetmediasharingsecuritygroup
     */
    put_internetMediaSharingSecurityGroup(securityGroup) {
        securityGroup := securityGroup is String ? BSTR.Alloc(securityGroup).Value : securityGroup

        result := ComCall(19, this, "ptr", securityGroup, "HRESULT")
        return result
    }

    /**
     * The get_allowSharingToAllDevices method retrieves a value that indicates whether the current user's media library is shared with all devices on the home network.
     * @returns {VARIANT_BOOL} Pointer to a <b>VARIANT_BOOL</b> that receives <b>VARIANT_TRUE</b> if the media libray is shared with all devices and <b>VARIANT_FALSE</b> if the media library is not shared with at least one device.
     * @see https://docs.microsoft.com/windows/win32/api//wmlss/nf-wmlss-iwindowsmedialibrarysharingservices-get_allowsharingtoalldevices
     */
    get_allowSharingToAllDevices() {
        result := ComCall(20, this, "short*", &sharingEnabled := 0, "HRESULT")
        return sharingEnabled
    }

    /**
     * The put_allowSharingToAllDevices method allows or disallows sharing of the current user's media library with all devices on the home network.
     * @param {VARIANT_BOOL} sharingEnabled A <b>VARIANT_BOOL</b> that specifies whether sharing is allowed (<b>VARIANT_TRUE</b>) or not allowed (<b>VARIANT_FALSE</b>).
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmlss/nf-wmlss-iwindowsmedialibrarysharingservices-put_allowsharingtoalldevices
     */
    put_allowSharingToAllDevices(sharingEnabled) {
        result := ComCall(21, this, "short", sharingEnabled, "HRESULT")
        return result
    }

    /**
     * The setDefaultAuthorization method enables or disables access to all users' media libraries by a specified set of devices.
     * @param {BSTR} MACAddresses A <b>BSTR</b> that specifies the MAC addresses of the devices for which access will be enabled or disabled. The MAC addresses are delimited by commas.
     * @param {BSTR} friendlyName A <b>BSTR</b> that specifies a friendly name that applies to all devices listed in the <i>MACAddresses</i> parameter.
     * @param {VARIANT_BOOL} authorization A <b>VARIANT_BOOL</b> that specifies whether access by the set of devices is enabled (<b>VARIANT_TRUE</b>) or disabled (<b>VARIANT_FALSE</b>).
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmlss/nf-wmlss-iwindowsmedialibrarysharingservices-setdefaultauthorization
     */
    setDefaultAuthorization(MACAddresses, friendlyName, authorization) {
        MACAddresses := MACAddresses is String ? BSTR.Alloc(MACAddresses).Value : MACAddresses
        friendlyName := friendlyName is String ? BSTR.Alloc(friendlyName).Value : friendlyName

        result := ComCall(22, this, "ptr", MACAddresses, "ptr", friendlyName, "short", authorization, "HRESULT")
        return result
    }

    /**
     * The setAuthorizationState method enables or disables access to the current user's media library by a specified device.
     * @param {BSTR} MACAddress A <b>BSTR</b> that specifies the MAC address of the device for which access will be enabled or disabled.
     * @param {VARIANT_BOOL} authorizationState A <b>VARIANT_BOOL</b> that specifies whether access by the device is enabled (<b>VARIANT_TRUE</b>) or disabled (<b>VARIANT_FALSE</b>).
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmlss/nf-wmlss-iwindowsmedialibrarysharingservices-setauthorizationstate
     */
    setAuthorizationState(MACAddress, authorizationState) {
        MACAddress := MACAddress is String ? BSTR.Alloc(MACAddress).Value : MACAddress

        result := ComCall(23, this, "ptr", MACAddress, "short", authorizationState, "HRESULT")
        return result
    }

    /**
     * The getAllDevices method retrieves an IWindowsMediaLibrarySharingDevices interface that represents all of the media-sharing client devices on the home network.
     * @returns {IWindowsMediaLibrarySharingDevices} A pointer to a variable that receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmlss/nn-wmlss-iwindowsmedialibrarysharingdevices">IWindowsMediaLibrarySharingDevices</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//wmlss/nf-wmlss-iwindowsmedialibrarysharingservices-getalldevices
     */
    getAllDevices() {
        result := ComCall(24, this, "ptr*", &devices := 0, "HRESULT")
        return IWindowsMediaLibrarySharingDevices(devices)
    }

    /**
     * The get_customSettingsApplied method retrieves a value that indicates whether any custom media-sharing settings are in place for the current user.
     * @returns {VARIANT_BOOL} Pointer to a <b>VARIANT_BOOL</b> that receives <b>VARIANT_TRUE</b> if any custom settings are in place for the current user and <b>VARIANT_FALSE</b> if the default settings are in place for the current user.
     * @see https://docs.microsoft.com/windows/win32/api//wmlss/nf-wmlss-iwindowsmedialibrarysharingservices-get_customsettingsapplied
     */
    get_customSettingsApplied() {
        result := ComCall(25, this, "short*", &customSettingsApplied := 0, "HRESULT")
        return customSettingsApplied
    }
}
