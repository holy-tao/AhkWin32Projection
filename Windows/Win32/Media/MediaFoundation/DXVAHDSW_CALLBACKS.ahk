#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains pointers to functions implemented by a software plug-in for Microsoft DirectX Video Acceleration High Definition (DXVA-HD).
 * @remarks
 * If you provide a software plug-in for DXVA-HD, the plug-in must implement a set of functions that are defined by the function pointer types in this structure.
 * 
 * At initialization, the   DXVA-HD runtime calls the plug-in device's <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nc-dxvahd-pdxvahdsw_plugin">PDXVAHDSW_Plugin</a> function. This function fills in a <b>DXVAHDSW_CALLBACKS</b> structure with pointers to  the set of functions that are implemented by the plug-in device. When the application calls DXVA-HD methods, the DXVA-HD runtime calls the corresponding plug-in functions.
 * @see https://learn.microsoft.com/windows/win32/api/dxvahd/ns-dxvahd-dxvahdsw_callbacks
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVAHDSW_CALLBACKS {
    #StructPack 8

    /**
     * Function pointer of type <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nc-dxvahd-pdxvahdsw_createdevice">PDXVAHDSW_CreateDevice</a>.
     */
    CreateDevice : IntPtr

    /**
     * Function pointer of type <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nc-dxvahd-pdxvahdsw_proposevideoprivateformat">PDXVAHDSW_ProposeVideoPrivateFormat</a>.
     */
    ProposeVideoPrivateFormat : IntPtr

    /**
     * Function pointer of type <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nc-dxvahd-pdxvahdsw_getvideoprocessordevicecaps">PDXVAHDSW_GetVideoProcessorDeviceCaps</a>.
     */
    GetVideoProcessorDeviceCaps : IntPtr

    /**
     * Function pointer of type <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nc-dxvahd-pdxvahdsw_getvideoprocessoroutputformats">PDXVAHDSW_GetVideoProcessorOutputFormats</a>.
     */
    GetVideoProcessorOutputFormats : IntPtr

    /**
     * Function pointer of type <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nc-dxvahd-pdxvahdsw_getvideoprocessorinputformats">PDXVAHDSW_GetVideoProcessorInputFormats</a>.
     */
    GetVideoProcessorInputFormats : IntPtr

    /**
     * Function pointer of type <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nc-dxvahd-pdxvahdsw_getvideoprocessorcaps">PDXVAHDSW_GetVideoProcessorCaps</a>.
     */
    GetVideoProcessorCaps : IntPtr

    /**
     * Function pointer of type <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nc-dxvahd-pdxvahdsw_getvideoprocessorcustomrates">PDXVAHDSW_GetVideoProcessorCustomRates</a>.
     */
    GetVideoProcessorCustomRates : IntPtr

    /**
     * Function pointer of type <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nc-dxvahd-pdxvahdsw_getvideoprocessorfilterrange">PDXVAHDSW_GetVideoProcessorFilterRange</a>.
     */
    GetVideoProcessorFilterRange : IntPtr

    /**
     * Function pointer of type <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nc-dxvahd-pdxvahdsw_destroydevice">PDXVAHDSW_DestroyDevice</a>.
     */
    DestroyDevice : IntPtr

    /**
     * Function pointer of type <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nc-dxvahd-pdxvahdsw_createvideoprocessor">PDXVAHDSW_CreateVideoProcessor</a>.
     */
    CreateVideoProcessor : IntPtr

    /**
     * Function pointer of type <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nc-dxvahd-pdxvahdsw_setvideoprocessbltstate">PDXVAHDSW_SetVideoProcessBltState</a>.
     */
    SetVideoProcessBltState : IntPtr

    /**
     * Function pointer of type <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nc-dxvahd-pdxvahdsw_getvideoprocessbltstateprivate">PDXVAHDSW_GetVideoProcessBltStatePrivate</a>.
     */
    GetVideoProcessBltStatePrivate : IntPtr

    /**
     * Function pointer of type <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nc-dxvahd-pdxvahdsw_setvideoprocessstreamstate">PDXVAHDSW_SetVideoProcessStreamState</a>.
     */
    SetVideoProcessStreamState : IntPtr

    /**
     * Function pointer of type <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nc-dxvahd-pdxvahdsw_getvideoprocessstreamstateprivate">PDXVAHDSW_GetVideoProcessStreamStatePrivate</a>.
     */
    GetVideoProcessStreamStatePrivate : IntPtr

    /**
     * Function pointer of type <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nc-dxvahd-pdxvahdsw_videoprocessblthd">PDXVAHDSW_VideoProcessBltHD</a>.
     */
    VideoProcessBltHD : IntPtr

    /**
     * Function pointer of type <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nc-dxvahd-pdxvahdsw_destroyvideoprocessor">PDXVAHDSW_DestroyVideoProcessor</a>.
     */
    DestroyVideoProcessor : IntPtr

}
