#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BIN_RANGE.ahk" { BIN_RANGE }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct PERF_BIN {
    #StructPack 8

    NumberOfBins : UInt32

    TypeOfBin : UInt32

    BinsRanges : BIN_RANGE[1]

}
