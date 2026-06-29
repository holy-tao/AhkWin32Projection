#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\System\Diagnostics\Debug\VER_PLATFORM.ahk" { VER_PLATFORM }
#Import "..\..\System\SystemInformation\PROCESSOR_ARCHITECTURE.ahk" { PROCESSOR_ARCHITECTURE }

/**
 * The SP_ALTPLATFORM_INFO_V2 structure is used to pass information for an alternate platform to SetupQueryInfOriginalFileInformation.
 * @see https://learn.microsoft.com/windows/win32/api/setupapi/ns-setupapi-sp_altplatform_info_v2
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @architecture X64, Arm64
 */
export default struct SP_ALTPLATFORM_INFO_V2 {
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
    ProcessorArchitecture : PROCESSOR_ARCHITECTURE

    Reserved : UInt16

    /**
     * Major version of the oldest previous operating system for which this package's digital signature is valid. For example, if the alternate platform is VER_PLATFORM_WIN32_NT, version 5.1, and you want a driver package signed with a 5.0 osattr to also be valid, set MajorVersion to 5, MinorVersion to 1, <b>FirstValidatedMajorVersion</b> to 5, and <b>FirstValidatedMinorVersion</b> 0. To validate packages signed for any previous operating system, specify 0 for these fields. To only validate against the target alternate platform, specify the same values as those in the MajorVersion and MinorVersion fields. Available with Windows XP or later only. The Flags member must be set to SP_ALTPLATFORM_FLAGS_VERSION_RANGE to use <b>FirstValidatedMajorVersion</b>.
     */
    FirstValidatedMajorVersion : UInt32

    /**
     * Minor version of the oldest previous operating system for which this package's digital signature is valid. For information see <b>FirstValidatedMajorVersion</b>. Available with Windows Server 2003 or Windows XP. The <b>Flags</b> member must be set to SP_ALTPLATFORM_FLAGS_VERSION_RANGE to use <b>FirstValidatedMinorVersion</b>.
     */
    FirstValidatedMinorVersion : UInt32

    static __New() {
        DefineProp(this.Prototype, 'Flags', { type: UInt16, offset: 18 })
        this.DeleteProp("__New")
    }
}
