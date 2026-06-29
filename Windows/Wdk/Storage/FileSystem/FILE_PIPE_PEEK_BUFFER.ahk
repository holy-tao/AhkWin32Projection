#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct FILE_PIPE_PEEK_BUFFER {
    #StructPack 4

    NamedPipeState : UInt32

    ReadDataAvailable : UInt32

    NumberOfMessages : UInt32

    MessageLength : UInt32

    Data : CHAR[1]

}
