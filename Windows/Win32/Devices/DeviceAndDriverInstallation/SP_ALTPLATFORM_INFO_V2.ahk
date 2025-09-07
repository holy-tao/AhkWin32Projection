#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The SP_ALTPLATFORM_INFO_V2 structure is used to pass information for an alternate platform to SetupQueryInfOriginalFileInformation.
 * @see https://learn.microsoft.com/windows/win32/api/setupapi/ns-setupapi-sp_altplatform_info_v2
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 */
class SP_ALTPLATFORM_INFO_V2 extends Win32Struct
{
    static sizeof => 28

    static packingSize => 1

    /**
     * Size of this structure, in bytes.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    Platform {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Major version of the operating system.
     * @type {Integer}
     */
    MajorVersion {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Minor version of the operating system.
     * @type {Integer}
     */
    MinorVersion {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Processor architecture. This must be PROCESSOR_ARCHITECTURE_INTEL, PROCESSOR_ARCHITECTURE_ALPHA, PROCESSOR_ARCHITECTURE_IA64, PROCESSOR_ARCHITECTURE_ALPHA64.
     * @type {Integer}
     */
    ProcessorArchitecture {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 18, "ushort")
        set => NumPut("ushort", value, this, 18)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 18, "ushort")
        set => NumPut("ushort", value, this, 18)
    }

    /**
     * Major version of the oldest previous operating system for which this package's digital signature is valid. For example, if the alternate platform is VER_PLATFORM_WIN32_NT, version 5.1, and you want a driver package signed with a 5.0 osattr to also be valid, set MajorVersion to 5, MinorVersion to 1, <b>FirstValidatedMajorVersion</b> to 5, and <b>FirstValidatedMinorVersion</b> 0. To validate packages signed for any previous operating system, specify 0 for these fields. To only validate against the target alternate platform, specify the same values as those in the MajorVersion and MinorVersion fields. Available with Windows XP or later only. The Flags member must be set to SP_ALTPLATFORM_FLAGS_VERSION_RANGE to use <b>FirstValidatedMajorVersion</b>.
     * @type {Integer}
     */
    FirstValidatedMajorVersion {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Minor version of the oldest previous operating system for which this package's digital signature is valid. For information see <b>FirstValidatedMajorVersion</b>. Available with Windows Server 2003 or Windows XP. The <b>Flags</b> member must be set to SP_ALTPLATFORM_FLAGS_VERSION_RANGE to use <b>FirstValidatedMinorVersion</b>.
     * @type {Integer}
     */
    FirstValidatedMinorVersion {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 28
    }
}
