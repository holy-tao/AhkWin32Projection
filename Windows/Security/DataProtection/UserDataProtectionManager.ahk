#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUserDataProtectionManager.ahk
#Include .\IUserDataProtectionManagerStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\UserDataProtectionManager.ahk
#Include .\UserDataAvailabilityStateChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Provides static methods to instantiate UserDataProtectionManager for the current or provided user. An instance of UserDataProtectionManager provides methods to protect / unprotect files and buffers.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.dataprotection.userdataprotectionmanager
 * @namespace Windows.Security.DataProtection
 * @version WindowsRuntime 1.4
 */
class UserDataProtectionManager extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUserDataProtectionManager

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUserDataProtectionManager.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Returns a UserDataProtectionManager instance for the current or default user. Caller must check if the returned object is null. If a null object is returned, UserDataProtectionManager is not supported on the system.
     * @returns {UserDataProtectionManager} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.dataprotection.userdataprotectionmanager.trygetdefault
     */
    static TryGetDefault() {
        if (!UserDataProtectionManager.HasProp("__IUserDataProtectionManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.DataProtection.UserDataProtectionManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUserDataProtectionManagerStatics.IID)
            UserDataProtectionManager.__IUserDataProtectionManagerStatics := IUserDataProtectionManagerStatics(factoryPtr)
        }

        return UserDataProtectionManager.__IUserDataProtectionManagerStatics.TryGetDefault()
    }

    /**
     * Returns a UserDataProtectionManager instance for the specified user object. Windows.System.User.FindAllAsync() can be used to find users on the system. Caller must check if the returned object is null. If it null, UserDataProtectionManager is not supported on the system.
     * @param {User} user_ 
     * @returns {UserDataProtectionManager} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.dataprotection.userdataprotectionmanager.trygetforuser
     */
    static TryGetForUser(user_) {
        if (!UserDataProtectionManager.HasProp("__IUserDataProtectionManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.DataProtection.UserDataProtectionManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUserDataProtectionManagerStatics.IID)
            UserDataProtectionManager.__IUserDataProtectionManagerStatics := IUserDataProtectionManagerStatics(factoryPtr)
        }

        return UserDataProtectionManager.__IUserDataProtectionManagerStatics.TryGetForUser(user_)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnDataAvailabilityStateChangedToken")) {
            this.remove_DataAvailabilityStateChanged(this.__OnDataAvailabilityStateChangedToken)
            this.__OnDataAvailabilityStateChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * Protects a storage item to the specified availability.
     * @param {IStorageItem} storageItem 
     * @param {Integer} availability 
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.dataprotection.userdataprotectionmanager.protectstorageitemasync
     */
    ProtectStorageItemAsync(storageItem, availability) {
        if (!this.HasProp("__IUserDataProtectionManager")) {
            if ((queryResult := this.QueryInterface(IUserDataProtectionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataProtectionManager := IUserDataProtectionManager(outPtr)
        }

        return this.__IUserDataProtectionManager.ProtectStorageItemAsync(storageItem, availability)
    }

    /**
     * Gets the current protection information for a storage item.
     * @param {IStorageItem} storageItem Storage item to query protection from.
     * @returns {IAsyncOperation<UserDataStorageItemProtectionInfo>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.dataprotection.userdataprotectionmanager.getstorageitemprotectioninfoasync
     */
    GetStorageItemProtectionInfoAsync(storageItem) {
        if (!this.HasProp("__IUserDataProtectionManager")) {
            if ((queryResult := this.QueryInterface(IUserDataProtectionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataProtectionManager := IUserDataProtectionManager(outPtr)
        }

        return this.__IUserDataProtectionManager.GetStorageItemProtectionInfoAsync(storageItem)
    }

    /**
     * Protects a buffer to a specified availability.
     * @param {IBuffer} unprotectedBuffer 
     * @param {Integer} availability 
     * @returns {IAsyncOperation<IBuffer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.dataprotection.userdataprotectionmanager.protectbufferasync
     */
    ProtectBufferAsync(unprotectedBuffer, availability) {
        if (!this.HasProp("__IUserDataProtectionManager")) {
            if ((queryResult := this.QueryInterface(IUserDataProtectionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataProtectionManager := IUserDataProtectionManager(outPtr)
        }

        return this.__IUserDataProtectionManager.ProtectBufferAsync(unprotectedBuffer, availability)
    }

    /**
     * Unprotect a buffer that has been protected using 'ProtectBufferAsync'.
     * @param {IBuffer} protectedBuffer The protected buffer.
     * @returns {IAsyncOperation<UserDataBufferUnprotectResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.dataprotection.userdataprotectionmanager.unprotectbufferasync
     */
    UnprotectBufferAsync(protectedBuffer) {
        if (!this.HasProp("__IUserDataProtectionManager")) {
            if ((queryResult := this.QueryInterface(IUserDataProtectionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataProtectionManager := IUserDataProtectionManager(outPtr)
        }

        return this.__IUserDataProtectionManager.UnprotectBufferAsync(protectedBuffer)
    }

    /**
     * Allows querying whether data protected to a specified availability will continue to stay available for a reasonable duration from now.
     * @param {Integer} availability 
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.dataprotection.userdataprotectionmanager.iscontinueddataavailabilityexpected
     */
    IsContinuedDataAvailabilityExpected(availability) {
        if (!this.HasProp("__IUserDataProtectionManager")) {
            if ((queryResult := this.QueryInterface(IUserDataProtectionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataProtectionManager := IUserDataProtectionManager(outPtr)
        }

        return this.__IUserDataProtectionManager.IsContinuedDataAvailabilityExpected(availability)
    }

    /**
     * 
     * @param {TypedEventHandler<UserDataProtectionManager, UserDataAvailabilityStateChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DataAvailabilityStateChanged(handler) {
        if (!this.HasProp("__IUserDataProtectionManager")) {
            if ((queryResult := this.QueryInterface(IUserDataProtectionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataProtectionManager := IUserDataProtectionManager(outPtr)
        }

        return this.__IUserDataProtectionManager.add_DataAvailabilityStateChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DataAvailabilityStateChanged(token) {
        if (!this.HasProp("__IUserDataProtectionManager")) {
            if ((queryResult := this.QueryInterface(IUserDataProtectionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataProtectionManager := IUserDataProtectionManager(outPtr)
        }

        return this.__IUserDataProtectionManager.remove_DataAvailabilityStateChanged(token)
    }

;@endregion Instance Methods
}
