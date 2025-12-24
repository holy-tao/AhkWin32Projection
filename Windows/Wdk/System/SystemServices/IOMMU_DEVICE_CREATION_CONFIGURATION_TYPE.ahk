#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class IOMMU_DEVICE_CREATION_CONFIGURATION_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static IommuDeviceCreationConfigTypeNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static IommuDeviceCreationConfigTypeAcpi => 1

    /**
     * @type {Integer (Int32)}
     */
    static IommuDeviceCreationConfigTypeDeviceId => 2

    /**
     * @type {Integer (Int32)}
     */
    static IommuDeviceCreationConfigTypeMax => 3
}
