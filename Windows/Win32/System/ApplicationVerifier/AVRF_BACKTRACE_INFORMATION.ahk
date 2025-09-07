#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about backtraces performed.
 * @see https://learn.microsoft.com/windows/win32/api/avrfsdk/ns-avrfsdk-avrf_backtrace_information
 * @namespace Windows.Win32.System.ApplicationVerifier
 * @version v4.0.30319
 */
class AVRF_BACKTRACE_INFORMATION extends Win32Struct
{
    static sizeof => 264

    static packingSize => 8

    /**
     * The number of traces that have been collected.
     * @type {Integer}
     */
    Depth {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A unique identifier associated with the entire set of returned addresses.
     * @type {Integer}
     */
    Index {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * An array of addresses returned traces. The number cannot exceed AVRF_MAX_TRACES, which is defined as 32.
     * @type {Array<UInt64>}
     */
    ReturnAddresses{
        get {
            if(!this.HasProp("__ReturnAddressesProxyArray"))
                this.__ReturnAddressesProxyArray := Win32FixedArray(this.ptr + 8, 8, Primitive, "uint")
            return this.__ReturnAddressesProxyArray
        }
    }
}
