#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a dynamic-link library (DLL) that has just been unloaded.
 * @see https://learn.microsoft.com/windows/win32/api/minwinbase/ns-minwinbase-unload_dll_debug_info
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class UNLOAD_DLL_DEBUG_INFO extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * A pointer to the base address of the DLL in the address space of the process unloading the DLL.
     * @type {Pointer<Void>}
     */
    lpBaseOfDll {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
