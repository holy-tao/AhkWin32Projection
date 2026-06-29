#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BIN_RANGE.ahk" { BIN_RANGE }
#Import ".\BIN_COUNT.ahk" { BIN_COUNT }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct BIN_RESULTS {
    #StructPack 8

    NumberOfBins : UInt32

    BinCounts : BIN_COUNT[1]

}
