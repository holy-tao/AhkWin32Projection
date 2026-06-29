#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct EXT_FIND_FILE {
    #StructPack 8

    FileName : PWSTR

    IndexedSize : Int64

    ImageTimeDateStamp : UInt32

    ImageCheckSum : UInt32

    ExtraInfo : IntPtr

    ExtraInfoSize : UInt32

    Flags : UInt32

    FileMapping : IntPtr

    FileMappingSize : Int64

    FileHandle : HANDLE

    FoundFileName : PWSTR

    FoundFileNameChars : UInt32

}
