#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\JOBOBJECT_IO_ATTRIBUTION_STATS.ahk

/**
 * @namespace Windows.Win32.System.JobObjects
 * @version v4.0.30319
 */
class JOBOBJECT_IO_ATTRIBUTION_INFORMATION extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {Integer}
     */
    ControlFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {JOBOBJECT_IO_ATTRIBUTION_STATS}
     */
    ReadStats{
        get {
            if(!this.HasProp("__ReadStats"))
                this.__ReadStats := JOBOBJECT_IO_ATTRIBUTION_STATS(this.ptr + 8)
            return this.__ReadStats
        }
    }

    /**
     * @type {JOBOBJECT_IO_ATTRIBUTION_STATS}
     */
    WriteStats{
        get {
            if(!this.HasProp("__WriteStats"))
                this.__WriteStats := JOBOBJECT_IO_ATTRIBUTION_STATS(this.ptr + 40)
            return this.__WriteStats
        }
    }
}
