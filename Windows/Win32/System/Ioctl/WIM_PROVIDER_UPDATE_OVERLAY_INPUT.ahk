#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct WIM_PROVIDER_UPDATE_OVERLAY_INPUT {
    #StructPack 8

    DataSourceId : Int64

    WimFileNameOffset : UInt32

    WimFileNameLength : UInt32

}
