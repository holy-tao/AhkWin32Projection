#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUserDataStorageItemProtectionInfo.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains information about the protection of a user data storage item.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.dataprotection.userdatastorageitemprotectioninfo
 * @namespace Windows.Security.DataProtection
 * @version WindowsRuntime 1.4
 */
class UserDataStorageItemProtectionInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUserDataStorageItemProtectionInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUserDataStorageItemProtectionInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Current availability of the storage item.
     * @see https://learn.microsoft.com/uwp/api/windows.security.dataprotection.userdatastorageitemprotectioninfo.availability
     * @type {Integer} 
     */
    Availability {
        get => this.get_Availability()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Availability() {
        if (!this.HasProp("__IUserDataStorageItemProtectionInfo")) {
            if ((queryResult := this.QueryInterface(IUserDataStorageItemProtectionInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataStorageItemProtectionInfo := IUserDataStorageItemProtectionInfo(outPtr)
        }

        return this.__IUserDataStorageItemProtectionInfo.get_Availability()
    }

;@endregion Instance Methods
}
