#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class IOMMU_DEVICE_CREATION_CONFIGURATION_TYPE extends Win32Enum {

    /**
     * Native name: IommuDeviceCreationConfigTypeNone
     * @type {Integer (Int32)}
     */
    static ConfigTypeNone => 0

    /**
     * Native name: IommuDeviceCreationConfigTypeAcpi
     * @type {Integer (Int32)}
     */
    static ConfigTypeAcpi => 1

    /**
     * Native name: IommuDeviceCreationConfigTypeDeviceId
     * @type {Integer (Int32)}
     */
    static ConfigTypeDeviceId => 2

    /**
     * Native name: IommuDeviceCreationConfigTypeMax
     * @type {Integer (Int32)}
     */
    static ConfigTypeMax => 3
}
