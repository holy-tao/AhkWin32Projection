#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDHAL_DDVIDEOPORTCALLBACKS {
    #StructPack 8

    dwSize : UInt32

    dwFlags : UInt32

    CanCreateVideoPort : IntPtr

    CreateVideoPort : IntPtr

    FlipVideoPort : IntPtr

    GetVideoPortBandwidth : IntPtr

    GetVideoPortInputFormats : IntPtr

    GetVideoPortOutputFormats : IntPtr

    lpReserved1 : IntPtr

    GetVideoPortField : IntPtr

    GetVideoPortLine : IntPtr

    GetVideoPortConnectInfo : IntPtr

    DestroyVideoPort : IntPtr

    GetVideoPortFlipStatus : IntPtr

    UpdateVideoPort : IntPtr

    WaitForVideoPortSync : IntPtr

    GetVideoSignalStatus : IntPtr

    ColorControl : IntPtr

}
