#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct VIDEO_SHARE_MEMORY {
    #StructPack 8

    ProcessHandle : HANDLE

    ViewOffset : UInt32

    ViewSize : UInt32

    RequestedVirtualAddress : IntPtr

}
