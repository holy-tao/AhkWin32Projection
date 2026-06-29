#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information about a dynamic-link library (DLL) that has just been unloaded.
 * @see https://learn.microsoft.com/windows/win32/api/minwinbase/ns-minwinbase-unload_dll_debug_info
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct UNLOAD_DLL_DEBUG_INFO {
    #StructPack 8

    /**
     * A pointer to the base address of the DLL in the address space of the process unloading the DLL.
     */
    lpBaseOfDll : IntPtr

}
