#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct REARRANGE_FILE_DATA {
    #StructPack 8

    SourceStartingOffset : Int64

    TargetOffset : Int64

    SourceFileHandle : HANDLE

    Length : UInt32

    Flags : UInt32

}
