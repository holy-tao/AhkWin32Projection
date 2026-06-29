#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct FH_OVERLAPPED {
    #StructPack 8

    Internal : IntPtr

    InternalHigh : IntPtr

    Offset : UInt32

    OffsetHigh : UInt32

    hEvent : HANDLE

    pfnCompletion : IntPtr

    Reserved1 : IntPtr

    Reserved2 : IntPtr

    Reserved3 : IntPtr

    Reserved4 : IntPtr

}
