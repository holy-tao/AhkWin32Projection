#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DO_DOWNLOAD_RANGE.ahk

/**
 * Identifies an array of ranges of bytes to download from a file.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/deliveryoptimization/ns-deliveryoptimization-do_download_ranges_info
 * @namespace Windows.Win32.Networking.DeliveryOptimization
 * @version v4.0.30319
 */
class DO_DOWNLOAD_RANGES_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Number of elements in Ranges.
     * @type {Integer}
     */
    RangeCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Array of one or more **DO_DOWNLOAD_RANGE** structures that specify the ranges to download.
     * @type {Array<DO_DOWNLOAD_RANGE>}
     */
    Ranges{
        get {
            if(!this.HasProp("__RangesProxyArray"))
                this.__RangesProxyArray := Win32FixedArray(this.ptr + 8, 1, DO_DOWNLOAD_RANGE, "")
            return this.__RangesProxyArray
        }
    }
}
