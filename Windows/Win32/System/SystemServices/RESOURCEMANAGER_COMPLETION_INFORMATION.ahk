#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct RESOURCEMANAGER_COMPLETION_INFORMATION {
    #StructPack 8

    IoCompletionPortHandle : HANDLE

    CompletionKey : IntPtr

}
