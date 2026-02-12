#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUser.ahk
#Include .\IUser2.ahk
#Include .\IUserStatics2.ahk
#Include .\IUserStatics.ahk
#Include ..\..\Guid.ahk

/**
 * Represents a user.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.user
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class User extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUser

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUser.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets an object representing the default user account.
     * @returns {User} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.user.getdefault
     */
    static GetDefault() {
        if (!User.HasProp("__IUserStatics2")) {
            activatableClassId := HSTRING.Create("Windows.System.User")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUserStatics2.IID)
            User.__IUserStatics2 := IUserStatics2(factoryPtr)
        }

        return User.__IUserStatics2.GetDefault()
    }

    /**
     * Creates a [UserWatcher](userwatcher.md) which enumerates users and raises events when the collection of users changes or when a user’s authentication state changes.
     * @returns {UserWatcher} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.user.createwatcher
     */
    static CreateWatcher() {
        if (!User.HasProp("__IUserStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.User")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUserStatics.IID)
            User.__IUserStatics := IUserStatics(factoryPtr)
        }

        return User.__IUserStatics.CreateWatcher()
    }

    /**
     * Finds all users of a given type asynchronously.
     * @returns {IAsyncOperation<IVectorView<User>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.user.findallasync
     */
    static FindAllAsync() {
        if (!User.HasProp("__IUserStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.User")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUserStatics.IID)
            User.__IUserStatics := IUserStatics(factoryPtr)
        }

        return User.__IUserStatics.FindAllAsync()
    }

    /**
     * Finds all users of a given type and authentication status asynchronously.
     * @param {Integer} type The type of users to find.
     * @returns {IAsyncOperation<IVectorView<User>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.user.findallasync
     */
    static FindAllAsyncByType(type) {
        if (!User.HasProp("__IUserStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.User")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUserStatics.IID)
            User.__IUserStatics := IUserStatics(factoryPtr)
        }

        return User.__IUserStatics.FindAllAsyncByType(type)
    }

    /**
     * Finds all users asynchronously.
     * @param {Integer} type 
     * @param {Integer} status_ 
     * @returns {IAsyncOperation<IVectorView<User>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.user.findallasync
     */
    static FindAllAsyncByTypeAndStatus(type, status_) {
        if (!User.HasProp("__IUserStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.User")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUserStatics.IID)
            User.__IUserStatics := IUserStatics(factoryPtr)
        }

        return User.__IUserStatics.FindAllAsyncByTypeAndStatus(type, status_)
    }

    /**
     * Gets a user with a given Id.
     * @param {HSTRING} nonRoamableId The Id of the user to get.
     * @returns {User} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.user.getfromid
     */
    static GetFromId(nonRoamableId) {
        if (!User.HasProp("__IUserStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.User")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUserStatics.IID)
            User.__IUserStatics := IUserStatics(factoryPtr)
        }

        return User.__IUserStatics.GetFromId(nonRoamableId)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the user's non-roamable id.
     * @remarks
     * In a multi-user app, you might need to remember what user the app was working with prior to the app being de-activated or suspended. You can save the NonRoamableId, then use it as a key to retrieve the user object again on activation (see User.GetFromId).   
     * 
     * The NonRoamableId for a user object is a string that is unique to the device, app, and user. It can’t roam to other devices or other apps. In addition, if the user logs in remotely, resulting in a different User.Type value, the NonRoamableId is different.
     * @see https://learn.microsoft.com/uwp/api/windows.system.user.nonroamableid
     * @type {HSTRING} 
     */
    NonRoamableId {
        get => this.get_NonRoamableId()
    }

    /**
     * Gets the authentication status of the user.
     * @see https://learn.microsoft.com/uwp/api/windows.system.user.authenticationstatus
     * @type {Integer} 
     */
    AuthenticationStatus {
        get => this.get_AuthenticationStatus()
    }

    /**
     * Gets the user type.
     * @see https://learn.microsoft.com/uwp/api/windows.system.user.type
     * @type {Integer} 
     */
    Type {
        get => this.get_Type()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_NonRoamableId() {
        if (!this.HasProp("__IUser")) {
            if ((queryResult := this.QueryInterface(IUser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUser := IUser(outPtr)
        }

        return this.__IUser.get_NonRoamableId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AuthenticationStatus() {
        if (!this.HasProp("__IUser")) {
            if ((queryResult := this.QueryInterface(IUser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUser := IUser(outPtr)
        }

        return this.__IUser.get_AuthenticationStatus()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Type() {
        if (!this.HasProp("__IUser")) {
            if ((queryResult := this.QueryInterface(IUser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUser := IUser(outPtr)
        }

        return this.__IUser.get_Type()
    }

    /**
     * Gets a property for the user. Use the [KnownUserProperties](knownuserproperties.md) class to obtain property names.
     * @remarks
     * See the [GetPropertiesAsync](user_getpropertiesasync_1952817514.md) method for details on supported properties.
     * @param {HSTRING} value The property to get.
     * @returns {IAsyncOperation<IInspectable>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.user.getpropertyasync
     */
    GetPropertyAsync(value) {
        if (!this.HasProp("__IUser")) {
            if ((queryResult := this.QueryInterface(IUser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUser := IUser(outPtr)
        }

        return this.__IUser.GetPropertyAsync(value)
    }

    /**
     * Gets properties for the user.
     * @remarks
     * Not all properties are available for all users. The following table summarizes which properties are available under various conditions.
     * 
     * Property | Local account   not domain joined | Local account   domain joined | MSA account | AAD account
     * -- | -- | -- | -- | --
     * AccountName | Not available | Not available | Not available | Not available
     * DisplayName | Not available | Not available | Not available | Available if domain joined
     * DomainName | Not available | Available | Not available | Available
     * FirstName | Available | Available | Available | Available
     * GuestHost | Available on XBOX | Available on XBOX | Available on XBOX | Available on XBOX
     * LastName | Available | Available | Available | Available
     * PrincipalName | Not available | Available | Not available | Available if domain joined
     * ProviderName | Not available | Not available | Not available | Not available
     * SessionInitiationProtocolUri | Not available | Available | Not available | Available if domain joined
     * @param {IVectorView<HSTRING>} values The properties to get. Use the [KnownUserProperties](knownuserproperties.md) class to obtain property names.
     * @returns {IAsyncOperation<IPropertySet>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.user.getpropertiesasync
     */
    GetPropertiesAsync(values) {
        if (!this.HasProp("__IUser")) {
            if ((queryResult := this.QueryInterface(IUser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUser := IUser(outPtr)
        }

        return this.__IUser.GetPropertiesAsync(values)
    }

    /**
     * Gets a user's picture asynchronously.
     * @param {Integer} desiredSize The desired size of the user's picture to return.
     * @returns {IAsyncOperation<IRandomAccessStreamReference>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.user.getpictureasync
     */
    GetPictureAsync(desiredSize) {
        if (!this.HasProp("__IUser")) {
            if ((queryResult := this.QueryInterface(IUser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUser := IUser(outPtr)
        }

        return this.__IUser.GetPictureAsync(desiredSize)
    }

    /**
     * Retrieves a value indicating whether the user belongs to the specified user age consent group.
     * @remarks
     * The information returned from this API allows you to design a more suitable experience for children and minors using your app.
     * 
     * This API requires the **UserAccountInformation** capability. For more information, see [App capability declarations](/windows/uwp/packaging/app-capability-declarations).
     * @param {Integer} consentGroup A value from the [UserAgeConsentGroup](userageconsentgroup.md) indicating the age consent group for which user membership is queried.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.user.checkuserageconsentgroupasync
     */
    CheckUserAgeConsentGroupAsync(consentGroup) {
        if (!this.HasProp("__IUser2")) {
            if ((queryResult := this.QueryInterface(IUser2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUser2 := IUser2(outPtr)
        }

        return this.__IUser2.CheckUserAgeConsentGroupAsync(consentGroup)
    }

;@endregion Instance Methods
}
