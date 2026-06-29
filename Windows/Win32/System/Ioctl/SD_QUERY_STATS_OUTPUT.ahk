#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct SD_QUERY_STATS_OUTPUT {
    #StructPack 8

    SdsStreamSize : Int64

    SdsAllocationSize : Int64

    SiiStreamSize : Int64

    SiiAllocationSize : Int64

    SdhStreamSize : Int64

    SdhAllocationSize : Int64

    NumSDTotal : Int64

    NumSDUnused : Int64

}
