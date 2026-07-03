#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct NTMS_ASYNC_IO {
    #StructPack 8

    OperationId : Guid

    EventId : Guid

    dwOperationType : UInt32

    dwResult : UInt32

    dwAsyncState : UInt32

    hEvent : HANDLE

    bOnStateChange : BOOL

}
