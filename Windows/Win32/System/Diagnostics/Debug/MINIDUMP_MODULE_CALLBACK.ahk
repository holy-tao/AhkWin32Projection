#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Storage\FileSystem\VS_FIXEDFILEINFO_FILE_OS.ahk" { VS_FIXEDFILEINFO_FILE_OS }
#Import "..\..\..\Storage\FileSystem\VS_FIXEDFILEINFO_FILE_FLAGS.ahk" { VS_FIXEDFILEINFO_FILE_FLAGS }
#Import "..\..\..\Storage\FileSystem\VS_FIXEDFILEINFO.ahk" { VS_FIXEDFILEINFO }

/**
 * Contains module information for the MiniDumpCallback function when the callback type is ModuleCallback.
 * @see https://learn.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_module_callback
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct MINIDUMP_MODULE_CALLBACK {
    #StructPack 8

    /**
     * The fully qualified path of the module executable.
     */
    FullPath : PWSTR

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
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/verrsrc/ns-verrsrc-vs_fixedfileinfo">VS_FIXEDFILEINFO</a> structure that specifies the version of the module.
     */
    VersionInfo : VS_FIXEDFILEINFO

    /**
     * A pointer to a string containing the CodeView record of the module.
     */
    CvRecord : IntPtr

    /**
     * The size of the Codeview record of the module in the <b>CvRecord</b> member, in bytes.
     */
    SizeOfCvRecord : UInt32

    /**
     * A pointer to a string that specifies the miscellaneous record of the module.
     */
    MiscRecord : IntPtr

    /**
     * The size of the miscellaneous record of the module in the <b>MiscRecord</b> member, in bytes.
     */
    SizeOfMiscRecord : UInt32

}
