#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Win32.Storage.InstallableFileSystems
 */
export default struct FILTER_REPLY_HEADER {
    #StructPack 8

    Status : NTSTATUS

    MessageId : Int64

}
