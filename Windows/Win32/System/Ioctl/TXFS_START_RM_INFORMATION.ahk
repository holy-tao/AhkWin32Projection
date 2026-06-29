#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct TXFS_START_RM_INFORMATION {
    #StructPack 8

    Flags : UInt32

    LogContainerSize : Int64

    LogContainerCountMin : UInt32

    LogContainerCountMax : UInt32

    LogGrowthIncrement : UInt32

    LogAutoShrinkPercentage : UInt32

    TmLogPathOffset : UInt32

    TmLogPathLength : UInt16

    LoggingMode : UInt16

    LogPathLength : UInt16

    Reserved : UInt16

    LogPath : WCHAR[1]

}
