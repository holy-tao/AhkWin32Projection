#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct VM_NOTIFY_ENTRY {
    #StructPack 2

    VmName : WCHAR[128]

    VmHost : WCHAR[128]

}
