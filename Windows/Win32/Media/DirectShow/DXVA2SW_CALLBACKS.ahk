#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct DXVA2SW_CALLBACKS {
    #StructPack 8

    Size : UInt32

    GetVideoProcessorRenderTargetCount : IntPtr

    GetVideoProcessorRenderTargets : IntPtr

    GetVideoProcessorCaps : IntPtr

    GetVideoProcessorSubStreamFormatCount : IntPtr

    GetVideoProcessorSubStreamFormats : IntPtr

    GetProcAmpRange : IntPtr

    GetFilterPropertyRange : IntPtr

    CreateVideoProcessDevice : IntPtr

    DestroyVideoProcessDevice : IntPtr

    VideoProcessBeginFrame : IntPtr

    VideoProcessEndFrame : IntPtr

    VideoProcessSetRenderTarget : IntPtr

    VideoProcessBlt : IntPtr

}
