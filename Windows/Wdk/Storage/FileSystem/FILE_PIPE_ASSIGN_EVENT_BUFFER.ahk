#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct FILE_PIPE_ASSIGN_EVENT_BUFFER {
    #StructPack 8

    EventHandle : HANDLE

    KeyValue : UInt32

}
