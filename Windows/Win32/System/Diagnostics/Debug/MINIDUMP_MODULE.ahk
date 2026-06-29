#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MINIDUMP_LOCATION_DESCRIPTOR.ahk" { MINIDUMP_LOCATION_DESCRIPTOR }
#Import "..\..\..\Storage\FileSystem\VS_FIXEDFILEINFO_FILE_OS.ahk" { VS_FIXEDFILEINFO_FILE_OS }
#Import "..\..\..\Storage\FileSystem\VS_FIXEDFILEINFO_FILE_FLAGS.ahk" { VS_FIXEDFILEINFO_FILE_FLAGS }
#Import "..\..\..\Storage\FileSystem\VS_FIXEDFILEINFO.ahk" { VS_FIXEDFILEINFO }

/**
 * Contains information for a specific module.
 * @see https://learn.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_module
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct MINIDUMP_MODULE {
    #StructPack 8

    /**
     * The base address of the module executable image in memory.
     */
    BaseOfImage : Int64

    /**
     * The size of the module executable image in memory, in bytes.
     */
    SizeOfImage : UInt32

    /**
     * The checksum value of the module executable image.
     */
    CheckSum : UInt32

    /**
     * The timestamp value of the module executable image, in <b>time_t</b> format.
     */
    TimeDateStamp : UInt32

    /**
     * An RVA to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minidumpapiset/ns-minidumpapiset-minidump_string">MINIDUMP_STRING</a> structure that specifies the name of the module.
     */
    ModuleNameRva : UInt32

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/verrsrc/ns-verrsrc-vs_fixedfileinfo">VS_FIXEDFILEINFO</a> structure that specifies the version of the module.
     */
    VersionInfo : VS_FIXEDFILEINFO

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_location_descriptor">MINIDUMP_LOCATION_DESCRIPTOR</a> structure that specifies the CodeView record of the module.
     */
    CvRecord : MINIDUMP_LOCATION_DESCRIPTOR

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_location_descriptor">MINIDUMP_LOCATION_DESCRIPTOR</a> structure that specifies the miscellaneous record of the module.
     */
    MiscRecord : MINIDUMP_LOCATION_DESCRIPTOR

    /**
     * Reserved for future use.
     */
    Reserved0 : Int64

    /**
     * Reserved for future use.
     */
    Reserved1 : Int64

}
