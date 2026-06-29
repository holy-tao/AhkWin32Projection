#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the module load address, size, and entry point.
 * @remarks
 * The load address of a module is the same as the <b>HMODULE</b> value. The information returned in the <b>SizeOfImage</b> and <b>EntryPoint</b> members comes from the module's Portable Executable (PE) header. The module entry point is the location called during process startup, thread startup, process shutdown, and thread shutdown. While this is not the address of the 
 * <a href="https://docs.microsoft.com/windows/desktop/Dlls/dllmain">DllMain</a> function, it should be close enough for most purposes.
 * @see https://learn.microsoft.com/windows/win32/api/psapi/ns-psapi-moduleinfo
 * @namespace Windows.Win32.System.ProcessStatus
 */
export default struct MODULEINFO {
    #StructPack 8

    /**
     * The load address of the module.
     */
    lpBaseOfDll : IntPtr

    /**
     * The size of the linear space that the module occupies, in bytes.
     */
    SizeOfImage : UInt32

    /**
     * The entry point of the module.
     */
    EntryPoint : IntPtr

}
