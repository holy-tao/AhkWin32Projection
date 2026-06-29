#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information for the MiniDumpCallback function when the callback type is IncludeModuleCallback.
 * @see https://learn.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_include_module_callback
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct MINIDUMP_INCLUDE_MODULE_CALLBACK {
    #StructPack 8

    /**
     * The base address of the executable image in memory.
     */
    BaseOfImage : Int64

}
