#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BIN_RANGE.ahk" { BIN_RANGE }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct BIN_COUNT {
    #StructPack 8

    BinRange : BIN_RANGE

    BinCount : UInt32

}
