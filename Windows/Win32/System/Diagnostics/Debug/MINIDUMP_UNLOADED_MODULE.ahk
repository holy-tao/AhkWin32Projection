#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a module that has been unloaded. This information can help diagnose problems calling code that is no longer loaded.
 * @see https://learn.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_unloaded_module
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class MINIDUMP_UNLOADED_MODULE extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The base address of the module executable image in memory.
     * @type {Integer}
     */
    BaseOfImage {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The size of the module executable image in memory, in bytes.
     * @type {Integer}
     */
    SizeOfImage {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The checksum value of the module executable image.
     * @type {Integer}
     */
    CheckSum {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The timestamp value of the module executable image, in <b>time_t</b> format.
     * @type {Integer}
     */
    TimeDateStamp {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * An RVA to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minidumpapiset/ns-minidumpapiset-minidump_string">MINIDUMP_STRING</a> structure that specifies the name of the module.
     * @type {Integer}
     */
    ModuleNameRva {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
