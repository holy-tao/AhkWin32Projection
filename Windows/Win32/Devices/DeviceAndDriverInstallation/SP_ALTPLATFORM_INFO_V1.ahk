#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\System\Diagnostics\Debug\VER_PLATFORM.ahk" { VER_PLATFORM }

/**
 * This structure is used to pass information for an alternate platform to SetupQueryInfOriginalFileInformation.
 * @see https://learn.microsoft.com/windows/win32/api/setupapi/ns-setupapi-sp_altplatform_info_v1
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @architecture X64, Arm64
 */
export default struct SP_ALTPLATFORM_INFO_V1 {
    #StructPack 4

    /**
     * Size of this structure, in bytes.
     */
    cbSize : UInt32 := this.Size

    Platform : VER_PLATFORM

    /**
     * Major version of the operating system.
     */
    MajorVersion : UInt32

    /**
     * Minor version of the operating system.
     */
    MinorVersion : UInt32

    /**
     * Processor architecture. This must be PROCESSOR_ARCHITECTURE_INTEL, PROCESSOR_ARCHITECTURE_ALPHA, PROCESSOR_ARCHITECTURE_IA64, PROCESSOR_ARCHITECTURE_ALPHA64.
     */
    ProcessorArchitecture : UInt16

    /**
     * Must be set to zero.
     */
    Reserved : UInt16

}
