#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct SI_COPYFILE {
    #StructPack 4

    SourceFileNameLength : UInt32

    DestinationFileNameLength : UInt32

    Flags : UInt32

    FileNameBuffer : WCHAR[1]

}
