#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStorageDeviceStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides methods for accessing the storage functionality of a portable device that supports WPD. Removable storage devices include:
  * 
  * + USB mass storage flash drives and cameras
  * + Media Transfer Protocol (MTP) music players, phones, and cameras
  * + Picture Transfer Protocol (PTP) cameras
 * @remarks
 * To access the device services, you must declare the device service in the capabilities section of the app manifest file. For a list of the GUIDs representing the device services, see [Windows.Devices.Portable](windows_devices_portable.md).
 * @see https://learn.microsoft.com/uwp/api/windows.devices.portable.storagedevice
 * @namespace Windows.Devices.Portable
 * @version WindowsRuntime 1.4
 */
class StorageDevice extends IInspectable {
;@region Static Methods
    /**
     * Gets a [StorageFolder](../windows.storage/storagefolder.md) object from a DeviceInformation Id for a removable storage device.
     * @remarks
     * Pass the selector string from [GetDeviceSelector](storagedevice_getdeviceselector_838466080.md) to the Windows.Devices.Enumeration API to get a collection of [DeviceInformation](../windows.devices.enumeration/deviceinformation.md) objects representing storage devices. Select the [DeviceInformation](../windows.devices.enumeration/deviceinformation.md) object for the storage you want to access, and use its [Id](../windows.devices.enumeration/deviceinformation_id.md) property as the *deviceInformationId* parameter to FromId.
     * @param {HSTRING} deviceId The [DeviceInformation](../windows.devices.enumeration/deviceinformation.md) ID that identifies the removable storage device. This id can be retrieved from [Windows.Devices.Enumeration](../windows.devices.enumeration/windows_devices_enumeration.md) or the [DeviceInformationId](../windows.applicationmodel.activation/deviceactivatedeventargs_deviceinformationid.md) property of the AutoPlay device event arguments. For more information, see [Quickstart: Register an app for an AutoPlay device](/previous-versions/windows/apps/jj160497(v=win.10)). In order for FromId to succeed, the app must declare both the removableStorage capability as shown in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations) and file type associations for the files it wishes to access on the device as shown in [How to handle file activation](/previous-versions/windows/apps/hh452684(v=win.10)). For more information, see the [Removable Storage sample](https://github.com/microsoftarchive/msdn-code-gallery-microsoft/tree/master/Official%20Windows%20Platform%20Sample/Windows%208.1%20Store%20app%20samples/%5BC%23%5D-Windows%208.1%20Store%20app%20samples/Removable%20storage%20sample).
     * @returns {StorageFolder} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.portable.storagedevice.fromid
     */
    static FromId(deviceId) {
        if (!StorageDevice.HasProp("__IStorageDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Portable.StorageDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStorageDeviceStatics.IID)
            StorageDevice.__IStorageDeviceStatics := IStorageDeviceStatics(factoryPtr)
        }

        return StorageDevice.__IStorageDeviceStatics.FromId(deviceId)
    }

    /**
     * An Advanced Query Syntax (AQS) string for identifying removable storage devices. This string is passed to the [FindAllAsync](../windows.devices.enumeration/deviceinformation_findallasync_1257462890.md) or [CreateWatcher](../windows.devices.enumeration/deviceinformation_createwatcher_1506431823.md) method.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.portable.storagedevice.getdeviceselector
     */
    static GetDeviceSelector() {
        if (!StorageDevice.HasProp("__IStorageDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Portable.StorageDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStorageDeviceStatics.IID)
            StorageDevice.__IStorageDeviceStatics := IStorageDeviceStatics(factoryPtr)
        }

        return StorageDevice.__IStorageDeviceStatics.GetDeviceSelector()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
