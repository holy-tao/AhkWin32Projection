#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VM_NOTIFY_ENTRY.ahk" { VM_NOTIFY_ENTRY }

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct VM_NOTIFY_INFO {
    #StructPack 8

    dwNumEntries : UInt32

    ppVmEntries : IntPtr

}
