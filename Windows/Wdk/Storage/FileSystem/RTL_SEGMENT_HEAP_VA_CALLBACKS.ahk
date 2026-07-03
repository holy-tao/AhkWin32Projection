#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct RTL_SEGMENT_HEAP_VA_CALLBACKS {
    #StructPack 8

    CallbackContext : HANDLE

    AllocateVirtualMemory : IntPtr

    FreeVirtualMemory : IntPtr

    QueryVirtualMemory : IntPtr

}
