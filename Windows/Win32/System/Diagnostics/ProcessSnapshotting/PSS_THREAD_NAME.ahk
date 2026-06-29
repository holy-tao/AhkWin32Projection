#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.System.Diagnostics.ProcessSnapshotting
 */
export default struct PSS_THREAD_NAME {
    #StructPack 8

    ThreadNameSize : UInt16

    ThreadName : PWSTR

}
