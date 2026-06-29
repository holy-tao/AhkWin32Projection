#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DO_DOWNLOAD_RANGE.ahk" { DO_DOWNLOAD_RANGE }

/**
 * Identifies an array of ranges of bytes to download from a file.
 * @see https://learn.microsoft.com/windows/win32/api/deliveryoptimization/ns-deliveryoptimization-do_download_ranges_info
 * @namespace Windows.Win32.Networking.DeliveryOptimization
 */
export default struct DO_DOWNLOAD_RANGES_INFO {
    #StructPack 8

    /**
     * Number of elements in Ranges.
     */
    RangeCount : UInt32

    /**
     * Array of one or more **DO_DOWNLOAD_RANGE** structures that specify the ranges to download.
     */
    Ranges : DO_DOWNLOAD_RANGE[1]

}
