#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains information for the MiniDumpCallback function when the callback type is IncludeModuleCallback.
 * @see https://docs.microsoft.com/windows/win32/api//minidumpapiset/ns-minidumpapiset-minidump_include_module_callback
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class MINIDUMP_INCLUDE_MODULE_CALLBACK extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * The base address of the executable image in memory.
     * @type {Integer}
     */
    BaseOfImage {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
