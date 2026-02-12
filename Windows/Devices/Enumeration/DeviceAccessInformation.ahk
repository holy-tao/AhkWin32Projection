#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDeviceAccessInformation.ahk
#Include .\IDeviceAccessInformation2.ahk
#Include .\IDeviceAccessInformationStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\DeviceAccessInformation.ahk
#Include .\DeviceAccessChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Contains the information about access to a device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceaccessinformation
 * @namespace Windows.Devices.Enumeration
 * @version WindowsRuntime 1.4
 */
class DeviceAccessInformation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDeviceAccessInformation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDeviceAccessInformation.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a [DeviceAccessInformation](deviceaccessinformation.md) object based on a device id.
     * @param {HSTRING} deviceId Id of the device to get [DeviceAccessInformation](deviceaccessinformation.md) about.
     * @returns {DeviceAccessInformation} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceaccessinformation.createfromid
     */
    static CreateFromId(deviceId) {
        if (!DeviceAccessInformation.HasProp("__IDeviceAccessInformationStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Enumeration.DeviceAccessInformation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDeviceAccessInformationStatics.IID)
            DeviceAccessInformation.__IDeviceAccessInformationStatics := IDeviceAccessInformationStatics(factoryPtr)
        }

        return DeviceAccessInformation.__IDeviceAccessInformationStatics.CreateFromId(deviceId)
    }

    /**
     * Initializes a [DeviceAccessInformation](deviceaccessinformation.md) object based on a device class id.
     * @param {Guid} deviceClassId Id of the device class to get [DeviceAccessInformation](deviceaccessinformation.md) about.
     * @returns {DeviceAccessInformation} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceaccessinformation.createfromdeviceclassid
     */
    static CreateFromDeviceClassId(deviceClassId) {
        if (!DeviceAccessInformation.HasProp("__IDeviceAccessInformationStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Enumeration.DeviceAccessInformation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDeviceAccessInformationStatics.IID)
            DeviceAccessInformation.__IDeviceAccessInformationStatics := IDeviceAccessInformationStatics(factoryPtr)
        }

        return DeviceAccessInformation.__IDeviceAccessInformationStatics.CreateFromDeviceClassId(deviceClassId)
    }

    /**
     * Initializes a [DeviceAccessInformation](deviceaccessinformation.md) object based on a given [DeviceClass](deviceclass.md).
     * @param {Integer} deviceClass_ Device class to get [DeviceAccessInformation](deviceaccessinformation.md) about.
     * @returns {DeviceAccessInformation} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceaccessinformation.createfromdeviceclass
     */
    static CreateFromDeviceClass(deviceClass_) {
        if (!DeviceAccessInformation.HasProp("__IDeviceAccessInformationStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Enumeration.DeviceAccessInformation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDeviceAccessInformationStatics.IID)
            DeviceAccessInformation.__IDeviceAccessInformationStatics := IDeviceAccessInformationStatics(factoryPtr)
        }

        return DeviceAccessInformation.__IDeviceAccessInformationStatics.CreateFromDeviceClass(deviceClass_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * The current device access status.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceaccessinformation.currentstatus
     * @type {Integer} 
     */
    CurrentStatus {
        get => this.get_CurrentStatus()
    }

    /**
     * @type {Boolean} 
     */
    UserPromptRequired {
        get => this.get_UserPromptRequired()
    }

    /**
     * Raised when access to a device has changed.
     * @type {TypedEventHandler<DeviceAccessInformation, DeviceAccessChangedEventArgs>}
    */
    OnAccessChanged {
        get {
            if(!this.HasProp("__OnAccessChanged")){
                this.__OnAccessChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{4c71d028-b793-5bce-ae59-fa77f45a40d8}"),
                    DeviceAccessInformation,
                    DeviceAccessChangedEventArgs
                )
                this.__OnAccessChangedToken := this.add_AccessChanged(this.__OnAccessChanged.iface)
            }
            return this.__OnAccessChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnAccessChangedToken")) {
            this.remove_AccessChanged(this.__OnAccessChangedToken)
            this.__OnAccessChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<DeviceAccessInformation, DeviceAccessChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AccessChanged(handler) {
        if (!this.HasProp("__IDeviceAccessInformation")) {
            if ((queryResult := this.QueryInterface(IDeviceAccessInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccessInformation := IDeviceAccessInformation(outPtr)
        }

        return this.__IDeviceAccessInformation.add_AccessChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_AccessChanged(cookie) {
        if (!this.HasProp("__IDeviceAccessInformation")) {
            if ((queryResult := this.QueryInterface(IDeviceAccessInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccessInformation := IDeviceAccessInformation(outPtr)
        }

        return this.__IDeviceAccessInformation.remove_AccessChanged(cookie)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CurrentStatus() {
        if (!this.HasProp("__IDeviceAccessInformation")) {
            if ((queryResult := this.QueryInterface(IDeviceAccessInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccessInformation := IDeviceAccessInformation(outPtr)
        }

        return this.__IDeviceAccessInformation.get_CurrentStatus()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_UserPromptRequired() {
        if (!this.HasProp("__IDeviceAccessInformation2")) {
            if ((queryResult := this.QueryInterface(IDeviceAccessInformation2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceAccessInformation2 := IDeviceAccessInformation2(outPtr)
        }

        return this.__IDeviceAccessInformation2.get_UserPromptRequired()
    }

;@endregion Instance Methods
}
