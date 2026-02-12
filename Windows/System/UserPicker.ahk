#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUserPicker.ahk
#Include .\IUserPickerStatics.ahk
#Include ..\..\Guid.ahk

/**
 * Contains methods and properties for allowing a user to select a user account in multi-user scenarios.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.userpicker
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class UserPicker extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUserPicker

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUserPicker.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Determines if UserPicker is supported.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.userpicker.issupported
     */
    static IsSupported() {
        if (!UserPicker.HasProp("__IUserPickerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.UserPicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUserPickerStatics.IID)
            UserPicker.__IUserPickerStatics := IUserPickerStatics(factoryPtr)
        }

        return UserPicker.__IUserPickerStatics.IsSupported()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets whether picking guest accounts is allowed.
     * @see https://learn.microsoft.com/uwp/api/windows.system.userpicker.allowguestaccounts
     * @type {Boolean} 
     */
    AllowGuestAccounts {
        get => this.get_AllowGuestAccounts()
        set => this.put_AllowGuestAccounts(value)
    }

    /**
     * Gets or sets a suggested user for the picker to indicate in the UI.
     * @see https://learn.microsoft.com/uwp/api/windows.system.userpicker.suggestedselecteduser
     * @type {User} 
     */
    SuggestedSelectedUser {
        get => this.get_SuggestedSelectedUser()
        set => this.put_SuggestedSelectedUser(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new UserPicker.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.System.UserPicker")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowGuestAccounts() {
        if (!this.HasProp("__IUserPicker")) {
            if ((queryResult := this.QueryInterface(IUserPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserPicker := IUserPicker(outPtr)
        }

        return this.__IUserPicker.get_AllowGuestAccounts()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AllowGuestAccounts(value) {
        if (!this.HasProp("__IUserPicker")) {
            if ((queryResult := this.QueryInterface(IUserPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserPicker := IUserPicker(outPtr)
        }

        return this.__IUserPicker.put_AllowGuestAccounts(value)
    }

    /**
     * 
     * @returns {User} 
     */
    get_SuggestedSelectedUser() {
        if (!this.HasProp("__IUserPicker")) {
            if ((queryResult := this.QueryInterface(IUserPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserPicker := IUserPicker(outPtr)
        }

        return this.__IUserPicker.get_SuggestedSelectedUser()
    }

    /**
     * 
     * @param {User} value 
     * @returns {HRESULT} 
     */
    put_SuggestedSelectedUser(value) {
        if (!this.HasProp("__IUserPicker")) {
            if ((queryResult := this.QueryInterface(IUserPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserPicker := IUserPicker(outPtr)
        }

        return this.__IUserPicker.put_SuggestedSelectedUser(value)
    }

    /**
     * Displays a dialog for the user to pick a user account. The selected account is signed in, paired with the [IGameController](../windows.gaming.input/igamecontroller.md) that selected it, and becomes obtainable using the [User](user.md) class. This method is only supported for multi-user devices and apps, and will throw an exception if called from a single user device or app.
     * @returns {IAsyncOperation<User>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.userpicker.picksingleuserasync
     */
    PickSingleUserAsync() {
        if (!this.HasProp("__IUserPicker")) {
            if ((queryResult := this.QueryInterface(IUserPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserPicker := IUserPicker(outPtr)
        }

        return this.__IUserPicker.PickSingleUserAsync()
    }

;@endregion Instance Methods
}
