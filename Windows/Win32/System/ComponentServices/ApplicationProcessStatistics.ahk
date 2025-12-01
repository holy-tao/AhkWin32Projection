#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents statistical information about a process hosting COM+ applications.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-applicationprocessstatistics
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class ApplicationProcessStatistics extends Win32Struct
{
    static sizeof => 32

    static packingSize => 4

    /**
     * The number of calls currently outstanding in tracked components in the process.
     * @type {Integer}
     */
    NumCallsOutstanding {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The number of distinct tracked components instantiated in the process.
     * @type {Integer}
     */
    NumTrackedComponents {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The number of component instances in the process.
     * @type {Integer}
     */
    NumComponentInstances {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A rolling average of the number of calls this process is servicing per second.
     * @type {Integer}
     */
    AvgCallsPerSecond {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * This member is reserved and set to DATA_NOT_AVAILABLE (0xFFFFFFFF).
     * @type {Integer}
     */
    Reserved1 {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * This member is reserved and set to DATA_NOT_AVAILABLE (0xFFFFFFFF).
     * @type {Integer}
     */
    Reserved2 {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * This member is reserved and set to DATA_NOT_AVAILABLE (0xFFFFFFFF).
     * @type {Integer}
     */
    Reserved3 {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * This member is reserved and set to DATA_NOT_AVAILABLE (0xFFFFFFFF).
     * @type {Integer}
     */
    Reserved4 {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }
}
