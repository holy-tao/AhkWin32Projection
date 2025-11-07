#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the module load address, size, and entry point.
 * @remarks
 * 
 * The load address of a module is the same as the <b>HMODULE</b> value. The information returned in the <b>SizeOfImage</b> and <b>EntryPoint</b> members comes from the module's Portable Executable (PE) header. The module entry point is the location called during process startup, thread startup, process shutdown, and thread shutdown. While this is not the address of the 
 * <a href="https://docs.microsoft.com/windows/desktop/Dlls/dllmain">DllMain</a> function, it should be close enough for most purposes.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//psapi/ns-psapi-moduleinfo
 * @namespace Windows.Win32.System.ProcessStatus
 * @version v4.0.30319
 */
class MODULEINFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The load address of the module.
     * @type {Pointer<Void>}
     */
    lpBaseOfDll {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The size of the linear space that the module occupies, in bytes.
     * @type {Integer}
     */
    SizeOfImage {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The entry point of the module.
     * @type {Pointer<Void>}
     */
    EntryPoint {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
