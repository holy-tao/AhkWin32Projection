#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct FILE_PIPE_CLIENT_PROCESS_BUFFER_EX {
    #StructPack 8

    ClientSession : IntPtr

    ClientProcess : IntPtr

    ClientComputerNameLength : UInt16

    ClientComputerBuffer : WCHAR[16]

}
