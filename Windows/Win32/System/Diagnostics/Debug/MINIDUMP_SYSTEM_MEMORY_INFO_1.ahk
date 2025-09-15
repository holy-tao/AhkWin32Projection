#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\MINIDUMP_SYSTEM_BASIC_INFORMATION.ahk
#Include .\MINIDUMP_SYSTEM_FILECACHE_INFORMATION.ahk
#Include .\MINIDUMP_SYSTEM_BASIC_PERFORMANCE_INFORMATION.ahk
#Include .\MINIDUMP_SYSTEM_PERFORMANCE_INFORMATION.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class MINIDUMP_SYSTEM_MEMORY_INFO_1 extends Win32Struct
{
    static sizeof => 504

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Revision {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {MINIDUMP_SYSTEM_BASIC_INFORMATION}
     */
    BasicInfo{
        get {
            if(!this.HasProp("__BasicInfo"))
                this.__BasicInfo := MINIDUMP_SYSTEM_BASIC_INFORMATION(this.ptr + 8)
            return this.__BasicInfo
        }
    }

    /**
     * @type {MINIDUMP_SYSTEM_FILECACHE_INFORMATION}
     */
    FileCacheInfo{
        get {
            if(!this.HasProp("__FileCacheInfo"))
                this.__FileCacheInfo := MINIDUMP_SYSTEM_FILECACHE_INFORMATION(this.ptr + 64)
            return this.__FileCacheInfo
        }
    }

    /**
     * @type {MINIDUMP_SYSTEM_BASIC_PERFORMANCE_INFORMATION}
     */
    BasicPerfInfo{
        get {
            if(!this.HasProp("__BasicPerfInfo"))
                this.__BasicPerfInfo := MINIDUMP_SYSTEM_BASIC_PERFORMANCE_INFORMATION(this.ptr + 128)
            return this.__BasicPerfInfo
        }
    }

    /**
     * @type {MINIDUMP_SYSTEM_PERFORMANCE_INFORMATION}
     */
    PerfInfo{
        get {
            if(!this.HasProp("__PerfInfo"))
                this.__PerfInfo := MINIDUMP_SYSTEM_PERFORMANCE_INFORMATION(this.ptr + 160)
            return this.__PerfInfo
        }
    }
}
