#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct MOVE_FILE_RECORD_DATA {
    #StructPack 8

    FileHandle : HANDLE

    SourceFileRecord : Int64

    TargetFileRecord : Int64

}
