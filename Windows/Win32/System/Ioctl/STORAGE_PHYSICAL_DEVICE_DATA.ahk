#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\STORAGE_DEVICE_FORM_FACTOR.ahk" { STORAGE_DEVICE_FORM_FACTOR }
#Import ".\STORAGE_SPEC_VERSION.ahk" { STORAGE_SPEC_VERSION }
#Import ".\STORAGE_COMPONENT_HEALTH_STATUS.ahk" { STORAGE_COMPONENT_HEALTH_STATUS }
#Import ".\STORAGE_PROTOCOL_TYPE.ahk" { STORAGE_PROTOCOL_TYPE }

/**
 * Describes a physical storage device.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-storage_physical_device_data
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_PHYSICAL_DEVICE_DATA {
    #StructPack 8

    /**
     * Specifies the device ID.
     */
    DeviceId : UInt32

    /**
     * Value(s) of bitmask from STORAGE_COMPONENT_ROLE_xxx
     */
    Role : UInt32

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ne-winioctl-storage_component_health_status">STORAGE_COMPONENT_HEALTH_STATUS</a> enumeration.
     */
    HealthStatus : STORAGE_COMPONENT_HEALTH_STATUS

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ne-winioctl-storage_protocol_type">STORAGE_PROTOCOL_TYPE</a> enumeration.
     */
    CommandProtocol : STORAGE_PROTOCOL_TYPE

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-storage_spec_version">STORAGE_SPEC_VERSION</a> structure that specifies the supported storage spec version. For example: SBC 3, SATA 3.2, NVMe 1.2
     */
    SpecVersion : STORAGE_SPEC_VERSION

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ne-winioctl-storage_device_form_factor">STORAGE_DEVICE_FORM_FACTOR</a> enumeration.
     */
    FormFactor : STORAGE_DEVICE_FORM_FACTOR

    /**
     * Specifies the device vendor.
     */
    Vendor : Int8[8]

    /**
     * Specifies the device model.
     */
    Model : Int8[40]

    /**
     * Specifies the firmware revision of the device.
     */
    FirmwareRevision : Int8[16]

    /**
     * In units of kilobytes (1024 bytes).
     */
    Capacity : Int64

    /**
     * Reserved for future use.
     */
    PhysicalLocation : Int8[32]

    Reserved : UInt32[2]

}
