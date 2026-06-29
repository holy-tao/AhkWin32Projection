#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DUPLICATE_EXTENTS_STATE.ahk" { DUPLICATE_EXTENTS_STATE }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct ASYNC_DUPLICATE_EXTENTS_STATUS {
    #StructPack 8

    Version : UInt32

    State : DUPLICATE_EXTENTS_STATE

    SourceFileOffset : Int64

    TargetFileOffset : Int64

    ByteCount : Int64

    BytesDuplicated : Int64

}
