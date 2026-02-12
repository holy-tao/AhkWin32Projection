#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUserDeviceAssociationChangedEventArgs.ahk
#Include ..\..\Guid.ahk

/**
 * Contains information about a [UserDeviceAssociationChanged](userdeviceassociation_userdeviceassociationchanged.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.userdeviceassociationchangedeventargs
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class UserDeviceAssociationChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUserDeviceAssociationChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUserDeviceAssociationChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the Id of the associated device.
     * @see https://learn.microsoft.com/uwp/api/windows.system.userdeviceassociationchangedeventargs.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * Gets the new user associated with the device.
     * @see https://learn.microsoft.com/uwp/api/windows.system.userdeviceassociationchangedeventargs.newuser
     * @type {User} 
     */
    NewUser {
        get => this.get_NewUser()
    }

    /**
     * Gets the old user previously associated with the device.
     * @see https://learn.microsoft.com/uwp/api/windows.system.userdeviceassociationchangedeventargs.olduser
     * @type {User} 
     */
    OldUser {
        get => this.get_OldUser()
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
    get_DeviceId() {
        if (!this.HasProp("__IUserDeviceAssociationChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IUserDeviceAssociationChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDeviceAssociationChangedEventArgs := IUserDeviceAssociationChangedEventArgs(outPtr)
        }

        return this.__IUserDeviceAssociationChangedEventArgs.get_DeviceId()
    }

    /**
     * 
     * @returns {User} 
     */
    get_NewUser() {
        if (!this.HasProp("__IUserDeviceAssociationChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IUserDeviceAssociationChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDeviceAssociationChangedEventArgs := IUserDeviceAssociationChangedEventArgs(outPtr)
        }

        return this.__IUserDeviceAssociationChangedEventArgs.get_NewUser()
    }

    /**
     * 
     * @returns {User} 
     */
    get_OldUser() {
        if (!this.HasProp("__IUserDeviceAssociationChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IUserDeviceAssociationChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDeviceAssociationChangedEventArgs := IUserDeviceAssociationChangedEventArgs(outPtr)
        }

        return this.__IUserDeviceAssociationChangedEventArgs.get_OldUser()
    }

;@endregion Instance Methods
}
