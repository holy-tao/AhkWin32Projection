#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct WIM_PROVIDER_ADD_OVERLAY_INPUT {
    #StructPack 4

    WimType : UInt32

    WimIndex : UInt32

    WimFileNameOffset : UInt32

    WimFileNameLength : UInt32

}
