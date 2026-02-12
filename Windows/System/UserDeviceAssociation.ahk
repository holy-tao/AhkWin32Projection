#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUserDeviceAssociationStatics.ahk
#Include ..\..\Guid.ahk

/**
 * Contains methods for querying for an association between a user and a device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.userdeviceassociation
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class UserDeviceAssociation extends IInspectable {
;@region Static Methods
    /**
     * Finds the user associated with a device.
     * @param {HSTRING} deviceId The Id of the device.
     * @returns {User} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.userdeviceassociation.finduserfromdeviceid
     */
    static FindUserFromDeviceId(deviceId) {
        if (!UserDeviceAssociation.HasProp("__IUserDeviceAssociationStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.UserDeviceAssociation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUserDeviceAssociationStatics.IID)
            UserDeviceAssociation.__IUserDeviceAssociationStatics := IUserDeviceAssociationStatics(factoryPtr)
        }

        return UserDeviceAssociation.__IUserDeviceAssociationStatics.FindUserFromDeviceId(deviceId)
    }

    /**
     * 
     * @param {EventHandler<UserDeviceAssociationChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_UserDeviceAssociationChanged(handler) {
        if (!UserDeviceAssociation.HasProp("__IUserDeviceAssociationStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.UserDeviceAssociation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUserDeviceAssociationStatics.IID)
            UserDeviceAssociation.__IUserDeviceAssociationStatics := IUserDeviceAssociationStatics(factoryPtr)
        }

        return UserDeviceAssociation.__IUserDeviceAssociationStatics.add_UserDeviceAssociationChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_UserDeviceAssociationChanged(token) {
        if (!UserDeviceAssociation.HasProp("__IUserDeviceAssociationStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.UserDeviceAssociation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUserDeviceAssociationStatics.IID)
            UserDeviceAssociation.__IUserDeviceAssociationStatics := IUserDeviceAssociationStatics(factoryPtr)
        }

        return UserDeviceAssociation.__IUserDeviceAssociationStatics.remove_UserDeviceAssociationChanged(token)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
