#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct WIM_PROVIDER_OVERLAY_ENTRY {
    #StructPack 8

    NextEntryOffset : UInt32

    DataSourceId : Int64

    WimGuid : Guid

    WimFileNameOffset : UInt32

    WimType : UInt32

    WimIndex : UInt32

    Flags : UInt32

}
