#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IServiceDeviceStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides methods for identifying a device service for a portable device that supports WPD (Windows Portable Devices) for device enumeration.
 * @remarks
 * To access these services, you must declare the device service in the device capabilities section of the app manifest file.  For a list of the GUIDs representing the device services, see [Windows.Devices.Portable](/uwp/api/Windows.Devices.Portable). To access the device services, you must declare the device service in the capabilities section of the app manifest file. For a list of the GUIDs representing the device services, see [Windows.Devices.Portable](windows_devices_portable.md).
 * 
 * The [GetDeviceSelector](servicedevice_getdeviceselector_1045577800.md) and [GetDeviceSelectorFromServiceId](servicedevice_getdeviceselectorfromserviceid_818600602.md) methods get selector strings that are passed to the [Windows.Devices.Enumeration](../windows.devices.enumeration/windows_devices_enumeration.md) API to find portable device services. The [Enumerating Common Devices](/previous-versions/windows/apps/hh464974(v=win.10)) tutorial explains how to use selector strings to discover available devices.
 * 
 * Examples of device services are the Media Transfer Protocol (MTP) device services that allow access to device status, contacts, calendar, tasks, and ringtones on a device. For more information, see [MTP Device Services for Windows](/previous-versions/windows/hardware/design/dn613966(v=vs.85)).
 * 
 * The [Portable Device Services Sample](https://github.com/microsoft/Windows-classic-samples/tree/340d6c8c537919663cb122d1a3cf76bed91c06f8/Samples/PortableDeviceServices) demonstrates how to access the device service once you have discovered it.
 * 
 * > [!NOTE]
 * > Access to a device service using this API is only available to Microsoft Store device apps given privileged access to a device by the device manufacturer. For more information about Microsoft Store device apps, see [Windows 8 Device Experience: .](http://msdn.microsoft.com/en-us/library/windows/hardware/br259108.aspx)
 * @see https://learn.microsoft.com/uwp/api/windows.devices.portable.servicedevice
 * @namespace Windows.Devices.Portable
 * @version WindowsRuntime 1.4
 */
class ServiceDevice extends IInspectable {
;@region Static Methods
    /**
     * Returns an Advanced Query Syntax (AQS) string that is used to enumerate device services of the specified [ServiceDeviceType](servicedevicetype.md). This string is passed to the [FindAllAsync](../windows.devices.enumeration/deviceinformation_findallasync_1257462890.md) or [CreateWatcher](../windows.devices.enumeration/deviceinformation_createwatcher_1506431823.md) method.
     * @param {Integer} serviceType The type of service to identify.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.portable.servicedevice.getdeviceselector
     */
    static GetDeviceSelector(serviceType) {
        if (!ServiceDevice.HasProp("__IServiceDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Portable.ServiceDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IServiceDeviceStatics.IID)
            ServiceDevice.__IServiceDeviceStatics := IServiceDeviceStatics(factoryPtr)
        }

        return ServiceDevice.__IServiceDeviceStatics.GetDeviceSelector(serviceType)
    }

    /**
     * An Advanced Query Syntax (AQS) string for identifying a device service by its GUIDs. This string is passed to the [FindAllAsync](../windows.devices.enumeration/deviceinformation_findallasync_1257462890.md) or [CreateWatcher](../windows.devices.enumeration/deviceinformation_createwatcher_1506431823.md) method.
     * @param {Guid} serviceId The service identifier.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.portable.servicedevice.getdeviceselectorfromserviceid
     */
    static GetDeviceSelectorFromServiceId(serviceId) {
        if (!ServiceDevice.HasProp("__IServiceDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Portable.ServiceDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IServiceDeviceStatics.IID)
            ServiceDevice.__IServiceDeviceStatics := IServiceDeviceStatics(factoryPtr)
        }

        return ServiceDevice.__IServiceDeviceStatics.GetDeviceSelectorFromServiceId(serviceId)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
