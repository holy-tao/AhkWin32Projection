#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the status associated with a call to [ReplaceDeviceProperties](ippprintdevice_replacedeviceproperties_1875570505.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.replacedevicepropertiesstatus
 * @namespace Windows.Devices.Printers
 * @version WindowsRuntime 1.4
 */
class ReplaceDevicePropertiesStatus extends Win32Enum{

    /**
     * The call succeeded.
     * @type {Integer (Int32)}
     */
    static Succeeded => 0

    /**
     * Access to the device properties was denied.
     * @type {Integer (Int32)}
     */
    static AccessDenied => 1

    /**
     * Another failure occurred. More information about the failure may be obtained by checking the [ExtendedError](replacedevicepropertiesresult_extendederror.md) property.
     * @type {Integer (Int32)}
     */
    static OtherFailure => 2
}
