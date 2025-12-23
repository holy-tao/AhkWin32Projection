#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DELETE\_OBJECT\_OPTIONS enumeration type describes options that are supported by a device when deleting an object.
 * @remarks
 * The application can retrieve the deletion options that the device supports by calling [**IPortableDeviceCapabilities::GetCommandOptions**](/windows/desktop/api/PortableDeviceApi/nf-portabledeviceapi-iportabledevicecapabilities-getcommandoptions) for the **WPD\_COMMAND\_OBJECT\_MANAGEMENT\_DELETE\_OBJECTS** command. It should examine the **WPD\_OPTION\_OBJECT\_MANAGEMENT\_RECURSIVE\_DELETE\_SUPPORTED** option value that this method returns in an [**IPortableDeviceValuesCollection**](iportabledevicevaluescollection.md) object.
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/delete-object-options
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class DELETE_OBJECT_OPTIONS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PORTABLE_DEVICE_DELETE_NO_RECURSION => 0

    /**
     * @type {Integer (Int32)}
     */
    static PORTABLE_DEVICE_DELETE_WITH_RECURSION => 1
}
