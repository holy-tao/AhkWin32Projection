#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUserInformationStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents information about the user, such as name and account picture.
  * 
  * > [!IMPORTANT]
  * > The UserInformation class is not supported on Windows 10 or later. Use the [User](../windows.system/user.md) class instead. See Remarks.
 * @remarks
 * > [!IMPORTANT]
 * > The UserInformation class is not supported on Windows 10 or later. Use the [User](../windows.system/user.md) class instead.
 * 
 * 
 * 
 * > **Windows 10**
 * > Apps compiled for Windows 8 that use the UserInformation class no longer return user information when running on Windows 10. This is because in Windows 10, apps do not have access to user information without explicit user consent, unlike in Windows 8 where this permission is granted by default.
 * 
 * If you have a Windows 8 app that uses the UserInformation class, you should migrate your app to the Universal Windows Platform (UWP) and access the [User](../windows.system/user.md) class instead. Universal Windows Platform (UWP) app that access user information are now expected to declare a new capability, uap:userAccountInformation, and call new APIs, [Windows.System.User.FindAllAsync](../windows.system/user_findallasync_1333355945.md) and [User.GetPropertiesAsync](../windows.system/user_getpropertiesasync_1952817514.md), to get the data.
 * 
 * When users install the app, they are prompted to allow access to their user information. If the user allows the app to access the information, the app appears listed in the **Privacy** page of the Windows 10  **Settings**  UI (**Settings** &gt; **Privacy** &gt; **Account info**). This allows Windows 10 users to enable access to user information on a per-app basis.
 * 
 * You can also enable access to user information without additional code modification by deploying a group policy change, which is particularly useful for business and enterprise customers. To allow access to user information on Windows 10, enable the following group policy setting and set it to "Always On": Computer Configuration > Administrative Templates > System > User Profiles > User management of sharing user name, account picture, and domain information with apps (not desktop apps). For more info, download [Group Policy Settings Reference for Windows and Windows Server](https://www.microsoft.com/download/details.aspx?id=25250).
 * 
 * > **Windows 8**
 * > To be launched in account picture mode and to set the user's picture without additional prompting, an app must register as an account picture provider by including the following in the [Extensions](/uwp/schemas/appxpackage/appxmanifestschema/element-1-extensions) section of the app manifest.
 * @see https://learn.microsoft.com/uwp/api/windows.system.userprofile.userinformation
 * @namespace Windows.System.UserProfile
 * @version WindowsRuntime 1.4
 */
class UserInformation extends IInspectable {
;@region Static Properties
    /**
     * Determines if the user's account picture can be changed.
     * 
     * > [!IMPORTANT]
     * > The [UserInformation](userinformation.md) class is not supported on Windows 10 or later. Use the [User](../windows.system/user.md) class instead. See Remarks in the [UserInformation](userinformation.md) class documentation.
     * @remarks
     * > [!IMPORTANT]
     * > The [UserInformation](userinformation.md) class is not supported on Windows 10 or later. Use the [User](../windows.system/user.md) class instead. See Remarks in the [UserInformation](userinformation.md) class documentation.
     * @see https://learn.microsoft.com/uwp/api/windows.system.userprofile.userinformation.accountpicturechangeenabled
     * @type {Boolean} 
     */
    static AccountPictureChangeEnabled {
        get => UserInformation.get_AccountPictureChangeEnabled()
    }

    /**
     * Allows you to see if your app is allowed to access the user's information.
     * 
     * > [!IMPORTANT]
     * > The [UserInformation](userinformation.md) class is not supported on Windows 10 or later. Use the [User](../windows.system/user.md) class instead. See Remarks in the [UserInformation](userinformation.md) class documentation.
     * @remarks
     * > [!IMPORTANT]
     * > The [UserInformation](userinformation.md) class is not supported on Windows 10 or later. Use the [User](../windows.system/user.md) class instead. See Remarks in the [UserInformation](userinformation.md) class documentation.
     * 
     * If this property is **false**, the [GetDisplayNameAsync](userinformation_getdisplaynameasync_1284689900.md), [GetDomainNameAsync](userinformation_getdomainnameasync_60434329.md), [GetFirstNameAsync](userinformation_getfirstnameasync_2069619498.md), and [GetLastNameAsync](userinformation_getlastnameasync_1125932066.md) methods return an empty string, while the [GetAccountPicture](userinformation_getaccountpicture_1542251334.md) and [GetSessionInitiationProtocolUriAsync](userinformation_getsessioninitiationprotocoluriasync_350596171.md) methods return a null value.
     * @see https://learn.microsoft.com/uwp/api/windows.system.userprofile.userinformation.nameaccessallowed
     * @type {Boolean} 
     */
    static NameAccessAllowed {
        get => UserInformation.get_NameAccessAllowed()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Boolean} 
     */
    static get_AccountPictureChangeEnabled() {
        if (!UserInformation.HasProp("__IUserInformationStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.UserProfile.UserInformation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUserInformationStatics.IID)
            UserInformation.__IUserInformationStatics := IUserInformationStatics(factoryPtr)
        }

        return UserInformation.__IUserInformationStatics.get_AccountPictureChangeEnabled()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    static get_NameAccessAllowed() {
        if (!UserInformation.HasProp("__IUserInformationStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.UserProfile.UserInformation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUserInformationStatics.IID)
            UserInformation.__IUserInformationStatics := IUserInformationStatics(factoryPtr)
        }

        return UserInformation.__IUserInformationStatics.get_NameAccessAllowed()
    }

    /**
     * Gets the account picture for the user.
     * 
     * > [!IMPORTANT]
     * > The [UserInformation](userinformation.md) class is not supported on Windows 10 or later. Use the [User](../windows.system/user.md) class instead. See Remarks in the [UserInformation](userinformation.md) class documentation.
     * @remarks
     * > [!IMPORTANT]
     * > The [UserInformation](userinformation.md) class is not supported on Windows 10 or later. Use the [User](../windows.system/user.md) class instead. See Remarks in the [UserInformation](userinformation.md) class documentation.
     * 
     * Access to the account picture can be blocked by privacy settings (for example, if the [UserInformation.NameAccessAllowed](userinformation_nameaccessallowed.md) property is false). If access is blocked, this method returns a null value.
     * 
     * This method does not throw an exception.
     * @param {Integer} kind An enumeration that you can use to determine what type of image you want (small, large, and so on).
     * @returns {IStorageFile} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.userprofile.userinformation.getaccountpicture
     */
    static GetAccountPicture(kind) {
        if (!UserInformation.HasProp("__IUserInformationStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.UserProfile.UserInformation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUserInformationStatics.IID)
            UserInformation.__IUserInformationStatics := IUserInformationStatics(factoryPtr)
        }

        return UserInformation.__IUserInformationStatics.GetAccountPicture(kind)
    }

    /**
     * Sets the picture for the user's account using an [IStorageFile](../windows.storage/istoragefile.md) object.
     * 
     * > [!IMPORTANT]
     * > The [UserInformation](userinformation.md) class is not supported on Windows 10 or later. Use the [User](../windows.system/user.md) class instead. See Remarks in the [UserInformation](userinformation.md) class documentation.
     * @remarks
     * > [!IMPORTANT]
     * > The [UserInformation](userinformation.md) class is not supported on Windows 10 or later. Use the [User](../windows.system/user.md) class instead. See Remarks in the [UserInformation](userinformation.md) class documentation.
     * @param {IStorageFile} image_ A file that contains the image.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.userprofile.userinformation.setaccountpictureasync
     */
    static SetAccountPictureAsync(image_) {
        if (!UserInformation.HasProp("__IUserInformationStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.UserProfile.UserInformation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUserInformationStatics.IID)
            UserInformation.__IUserInformationStatics := IUserInformationStatics(factoryPtr)
        }

        return UserInformation.__IUserInformationStatics.SetAccountPictureAsync(image_)
    }

    /**
     * Sets the pictures for the user's account using an [IStorageFile](../windows.storage/istoragefile.md) object. Supports adding a small image, large image, and video.
     * 
     * > [!IMPORTANT]
     * > The [UserInformation](userinformation.md) class is not supported on Windows 10 or later. Use the [User](../windows.system/user.md) class instead. See Remarks in the [UserInformation](userinformation.md) class documentation.
     * @remarks
     * > [!IMPORTANT]
     * > The [UserInformation](userinformation.md) class is not supported on Windows 10 or later. Use the [User](../windows.system/user.md) class instead. See Remarks in the [UserInformation](userinformation.md) class documentation.
     * @param {IStorageFile} smallImage A small version of the image.
     * @param {IStorageFile} largeImage A large version of the image.
     * @param {IStorageFile} video A video.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.userprofile.userinformation.setaccountpicturesasync
     */
    static SetAccountPicturesAsync(smallImage, largeImage, video) {
        if (!UserInformation.HasProp("__IUserInformationStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.UserProfile.UserInformation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUserInformationStatics.IID)
            UserInformation.__IUserInformationStatics := IUserInformationStatics(factoryPtr)
        }

        return UserInformation.__IUserInformationStatics.SetAccountPicturesAsync(smallImage, largeImage, video)
    }

    /**
     * Sets the picture for the user's account using an [IRandomAccessStream](../windows.storage.streams/irandomaccessstream.md) object.
     * 
     * > [!IMPORTANT]
     * > The [UserInformation](userinformation.md) class is not supported on Windows 10 or later. Use the [User](../windows.system/user.md) class instead. See Remarks in the [UserInformation](userinformation.md) class documentation.
     * @remarks
     * > [!IMPORTANT]
     * > The [UserInformation](userinformation.md) class is not supported on Windows 10 or later. Use the [User](../windows.system/user.md) class instead. See Remarks in the [UserInformation](userinformation.md) class documentation.
     * @param {IRandomAccessStream} image_ The image.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.userprofile.userinformation.setaccountpicturefromstreamasync
     */
    static SetAccountPictureFromStreamAsync(image_) {
        if (!UserInformation.HasProp("__IUserInformationStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.UserProfile.UserInformation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUserInformationStatics.IID)
            UserInformation.__IUserInformationStatics := IUserInformationStatics(factoryPtr)
        }

        return UserInformation.__IUserInformationStatics.SetAccountPictureFromStreamAsync(image_)
    }

    /**
     * Sets the pictures for the user's account using an [IRandomAccessStream](../windows.storage.streams/irandomaccessstream.md) object. Supports adding a small image, large image, and video.
     * 
     * > [!IMPORTANT]
     * > The [UserInformation](userinformation.md) class is not supported on Windows 10 or later. Use the [User](../windows.system/user.md) class instead. See Remarks in the [UserInformation](userinformation.md) class documentation.
     * @remarks
     * > [!IMPORTANT]
     * > The [UserInformation](userinformation.md) class is not supported on Windows 10 or later. Use the [User](../windows.system/user.md) class instead. See Remarks in the [UserInformation](userinformation.md) class documentation.
     * @param {IRandomAccessStream} smallImage A small version of the image.
     * @param {IRandomAccessStream} largeImage A large version of the image.
     * @param {IRandomAccessStream} video A video.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.userprofile.userinformation.setaccountpicturesfromstreamsasync
     */
    static SetAccountPicturesFromStreamsAsync(smallImage, largeImage, video) {
        if (!UserInformation.HasProp("__IUserInformationStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.UserProfile.UserInformation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUserInformationStatics.IID)
            UserInformation.__IUserInformationStatics := IUserInformationStatics(factoryPtr)
        }

        return UserInformation.__IUserInformationStatics.SetAccountPicturesFromStreamsAsync(smallImage, largeImage, video)
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} changeHandler 
     * @returns {EventRegistrationToken} 
     */
    static add_AccountPictureChanged(changeHandler) {
        if (!UserInformation.HasProp("__IUserInformationStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.UserProfile.UserInformation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUserInformationStatics.IID)
            UserInformation.__IUserInformationStatics := IUserInformationStatics(factoryPtr)
        }

        return UserInformation.__IUserInformationStatics.add_AccountPictureChanged(changeHandler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_AccountPictureChanged(token) {
        if (!UserInformation.HasProp("__IUserInformationStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.UserProfile.UserInformation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUserInformationStatics.IID)
            UserInformation.__IUserInformationStatics := IUserInformationStatics(factoryPtr)
        }

        return UserInformation.__IUserInformationStatics.remove_AccountPictureChanged(token)
    }

    /**
     * Gets the display name for the user account.
     * 
     * > [!IMPORTANT]
     * > The [UserInformation](userinformation.md) class is not supported on Windows 10 or later. Use the [User](../windows.system/user.md) class instead. See Remarks in the [UserInformation](userinformation.md) class documentation.
     * @remarks
     * > [!IMPORTANT]
     * > The [UserInformation](userinformation.md) class is not supported on Windows 10 or later. Use the [User](../windows.system/user.md) class instead. See Remarks in the [UserInformation](userinformation.md) class documentation.
     * 
     * Access to the display name can be blocked by privacy settings (for example, if the [UserInformation.NameAccessAllowed](userinformation_nameaccessallowed.md) property is false). If access is blocked, this method returns an empty string.
     * 
     * This method does not throw an exception.
     * @returns {IAsyncOperation<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.userprofile.userinformation.getdisplaynameasync
     */
    static GetDisplayNameAsync() {
        if (!UserInformation.HasProp("__IUserInformationStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.UserProfile.UserInformation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUserInformationStatics.IID)
            UserInformation.__IUserInformationStatics := IUserInformationStatics(factoryPtr)
        }

        return UserInformation.__IUserInformationStatics.GetDisplayNameAsync()
    }

    /**
     * Gets the user's first name.
     * 
     * > [!IMPORTANT]
     * > The [UserInformation](userinformation.md) class is not supported on Windows 10 or later. Use the [User](../windows.system/user.md) class instead. See Remarks in the [UserInformation](userinformation.md) class documentation.
     * @remarks
     * > [!IMPORTANT]
     * > The [UserInformation](userinformation.md) class is not supported on Windows 10 or later. Use the [User](../windows.system/user.md) class instead. See Remarks in the [UserInformation](userinformation.md) class documentation.
     * 
     * Access to the user's first name can be blocked by privacy settings (for example, if the [UserInformation.NameAccessAllowed](userinformation_nameaccessallowed.md) property is false). If access is blocked, this method returns an empty string.
     * 
     * This method does not throw an exception.
     * @returns {IAsyncOperation<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.userprofile.userinformation.getfirstnameasync
     */
    static GetFirstNameAsync() {
        if (!UserInformation.HasProp("__IUserInformationStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.UserProfile.UserInformation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUserInformationStatics.IID)
            UserInformation.__IUserInformationStatics := IUserInformationStatics(factoryPtr)
        }

        return UserInformation.__IUserInformationStatics.GetFirstNameAsync()
    }

    /**
     * Gets the user's last name.
     * 
     * > [!IMPORTANT]
     * > The [UserInformation](userinformation.md) class is not supported on Windows 10 or later. Use the [User](../windows.system/user.md) class instead. See Remarks in the [UserInformation](userinformation.md) class documentation.
     * @remarks
     * > [!IMPORTANT]
     * > The [UserInformation](userinformation.md) class is not supported on Windows 10 or later. Use the [User](../windows.system/user.md) class instead. See Remarks in the [UserInformation](userinformation.md) class documentation.
     * 
     * Access to the user's last name can be blocked by privacy settings (for example, if the [UserInformation.NameAccessAllowed](userinformation_nameaccessallowed.md) property is false). If access is blocked, this method returns an empty string.
     * 
     * This method does not throw an exception.
     * @returns {IAsyncOperation<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.userprofile.userinformation.getlastnameasync
     */
    static GetLastNameAsync() {
        if (!UserInformation.HasProp("__IUserInformationStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.UserProfile.UserInformation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUserInformationStatics.IID)
            UserInformation.__IUserInformationStatics := IUserInformationStatics(factoryPtr)
        }

        return UserInformation.__IUserInformationStatics.GetLastNameAsync()
    }

    /**
     * Gets the principal name for the user. This name is the User Principal Name (typically the user's address, although this is not always true.)
     * 
     * > [!IMPORTANT]
     * > The [UserInformation](userinformation.md) class is not supported on Windows 10 or later. Use the [User](../windows.system/user.md) class instead. See Remarks in the [UserInformation](userinformation.md) class documentation.
     * @remarks
     * > [!IMPORTANT]
     * > The [UserInformation](userinformation.md) class is not supported on Windows 10 or later. Use the [User](../windows.system/user.md) class instead. See Remarks in the [UserInformation](userinformation.md) class documentation.
     * 
     * Only domain users have a principal name. Access to the principal name can be blocked by privacy settings (for example, if the [UserInformation.NameAccessAllowed](userinformation_nameaccessallowed.md) property is false). If access is blocked, this method returns an empty string.
     * 
     * This method requires the [enterpriseAuthentication](/windows/uwp/packaging/app-capability-declarations) capability.
     * 
     * This method does not throw an exception.
     * @returns {IAsyncOperation<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.userprofile.userinformation.getprincipalnameasync
     */
    static GetPrincipalNameAsync() {
        if (!UserInformation.HasProp("__IUserInformationStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.UserProfile.UserInformation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUserInformationStatics.IID)
            UserInformation.__IUserInformationStatics := IUserInformationStatics(factoryPtr)
        }

        return UserInformation.__IUserInformationStatics.GetPrincipalNameAsync()
    }

    /**
     * Gets the Uniform Resource Identifier (URI) of the session initiation protocol for the user.
     * 
     * > [!IMPORTANT]
     * > The [UserInformation](userinformation.md) class is not supported on Windows 10 or later. Use the [User](../windows.system/user.md) class instead. See Remarks in the [UserInformation](userinformation.md) class documentation.
     * @remarks
     * > [!IMPORTANT]
     * > The [UserInformation](userinformation.md) class is not supported on Windows 10 or later. Use the [User](../windows.system/user.md) class instead. See Remarks in the [UserInformation](userinformation.md) class documentation.
     * 
     * Access to the Uniform Resource Identifier (URI) of the session initiation protocol for the user can be blocked by privacy settings (for example, if the [UserInformation.NameAccessAllowed](userinformation_nameaccessallowed.md) property is false). If access is blocked, this method returns a null value.
     * 
     * This method does not throw an exception.
     * @returns {IAsyncOperation<Uri>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.userprofile.userinformation.getsessioninitiationprotocoluriasync
     */
    static GetSessionInitiationProtocolUriAsync() {
        if (!UserInformation.HasProp("__IUserInformationStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.UserProfile.UserInformation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUserInformationStatics.IID)
            UserInformation.__IUserInformationStatics := IUserInformationStatics(factoryPtr)
        }

        return UserInformation.__IUserInformationStatics.GetSessionInitiationProtocolUriAsync()
    }

    /**
     * Gets the domain name for the user.
     * 
     * > [!IMPORTANT]
     * > The [UserInformation](userinformation.md) class is not supported on Windows 10 or later. Use the [User](../windows.system/user.md) class instead. See Remarks in the [UserInformation](userinformation.md) class documentation.
     * @remarks
     * > [!IMPORTANT]
     * > The [UserInformation](userinformation.md) class is not supported on Windows 10 or later. Use the [User](../windows.system/user.md) class instead. See Remarks in the [UserInformation](userinformation.md) class documentation.
     * 
     * Access to the domain name can be blocked by privacy settings (for example, if the [UserInformation.NameAccessAllowed](userinformation_nameaccessallowed.md) property is false). If access is blocked, this method returns an empty string.
     * 
     * This method does not throw an exception.
     * @returns {IAsyncOperation<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.userprofile.userinformation.getdomainnameasync
     */
    static GetDomainNameAsync() {
        if (!UserInformation.HasProp("__IUserInformationStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.UserProfile.UserInformation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUserInformationStatics.IID)
            UserInformation.__IUserInformationStatics := IUserInformationStatics(factoryPtr)
        }

        return UserInformation.__IUserInformationStatics.GetDomainNameAsync()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
