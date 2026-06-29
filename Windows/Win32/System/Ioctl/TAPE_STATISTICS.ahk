#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct TAPE_STATISTICS {
    #StructPack 8

    Version : UInt32

    Flags : UInt32

    RecoveredWrites : Int64

    UnrecoveredWrites : Int64

    RecoveredReads : Int64

    UnrecoveredReads : Int64

    CompressionRatioReads : Int8

    CompressionRatioWrites : Int8

}
