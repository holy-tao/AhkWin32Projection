#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.JobObjects
 * @version v4.0.30319
 */
class JOBOBJECT_IO_ATTRIBUTION_STATS extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    IoCount {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    TotalNonOverlappedQueueTime {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    TotalNonOverlappedServiceTime {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    TotalSize {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
