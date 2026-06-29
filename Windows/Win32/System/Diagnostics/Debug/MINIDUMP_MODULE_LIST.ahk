#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MINIDUMP_LOCATION_DESCRIPTOR.ahk" { MINIDUMP_LOCATION_DESCRIPTOR }
#Import ".\MINIDUMP_MODULE.ahk" { MINIDUMP_MODULE }
#Import "..\..\..\Storage\FileSystem\VS_FIXEDFILEINFO_FILE_OS.ahk" { VS_FIXEDFILEINFO_FILE_OS }
#Import "..\..\..\Storage\FileSystem\VS_FIXEDFILEINFO_FILE_FLAGS.ahk" { VS_FIXEDFILEINFO_FILE_FLAGS }
#Import "..\..\..\Storage\FileSystem\VS_FIXEDFILEINFO.ahk" { VS_FIXEDFILEINFO }

/**
 * Contains a list of modules.
 * @see https://learn.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_module_list
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct MINIDUMP_MODULE_LIST {
    #StructPack 8

    /**
     * The number of structures in the <b>Modules</b> array.
     */
    NumberOfModules : UInt32

    /**
     * An array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minidumpapiset/ns-minidumpapiset-minidump_module">MINIDUMP_MODULE</a> structures.
     */
    Modules : MINIDUMP_MODULE[1]

}
