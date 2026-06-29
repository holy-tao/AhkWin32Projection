#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 * @architecture X64, Arm64
 */
export default struct REARRANGE_FILE_DATA32 {
    #StructPack 8

    SourceStartingOffset : Int64

    TargetOffset : Int64

    SourceFileHandle : UInt32

    Length : UInt32

    Flags : UInt32

}
