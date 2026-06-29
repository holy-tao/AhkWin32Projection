#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\STORAGE_SPEC_VERSION.ahk" { STORAGE_SPEC_VERSION }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\STORAGE_COMPONENT_HEALTH_STATUS.ahk" { STORAGE_COMPONENT_HEALTH_STATUS }
#Import ".\STORAGE_PROTOCOL_TYPE.ahk" { STORAGE_PROTOCOL_TYPE }

/**
 * Describes a physical storage adapter.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-storage_physical_adapter_data
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_PHYSICAL_ADAPTER_DATA {
    #StructPack 4

    /**
     * Specifies the adapter ID.
     */
    AdapterId : UInt32

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ne-winioctl-storage_component_health_status">STORAGE_COMPONENT_HEALTH_STATUS</a>-typed value.
     */
    HealthStatus : STORAGE_COMPONENT_HEALTH_STATUS

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ne-winioctl-storage_protocol_type">STORAGE_PROTOCOL_TYPE</a>-typed value.
     */
    CommandProtocol : STORAGE_PROTOCOL_TYPE

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-storage_spec_version">STORAGE_SPEC_VERSION</a>-typed value that specifies the supported storage spec version (for example, AHCI 1.3.1).
     */
    SpecVersion : STORAGE_SPEC_VERSION

    /**
     * Specifies the adapter vendor.
     */
    Vendor : Int8[8]

    /**
     * Specifies the adapter model.
     */
    Model : Int8[40]

    /**
     * Specifies the firmware revision.
     */
    FirmwareRevision : Int8[16]

    /**
     * Reserved for future use.
     */
    PhysicalLocation : Int8[32]

    /**
     * Indicates whether an expander is connected.
     */
    ExpanderConnected : BOOLEAN

    /**
     * Reserved.
     */
    Reserved0 : Int8[3]

    /**
     * Reserved.
     */
    Reserved1 : UInt32[3]

}
