#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information about a module that has been unloaded. This information can help diagnose problems calling code that is no longer loaded.
 * @see https://learn.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_unloaded_module
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct MINIDUMP_UNLOADED_MODULE {
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

}
