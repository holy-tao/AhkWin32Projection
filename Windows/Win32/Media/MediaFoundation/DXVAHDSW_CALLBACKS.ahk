#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PDXVAHDSW_CreateDevice.ahk" { PDXVAHDSW_CreateDevice }
#Import ".\PDXVAHDSW_CreateVideoProcessor.ahk" { PDXVAHDSW_CreateVideoProcessor }
#Import ".\PDXVAHDSW_DestroyDevice.ahk" { PDXVAHDSW_DestroyDevice }
#Import ".\PDXVAHDSW_DestroyVideoProcessor.ahk" { PDXVAHDSW_DestroyVideoProcessor }
#Import ".\PDXVAHDSW_GetVideoProcessBltStatePrivate.ahk" { PDXVAHDSW_GetVideoProcessBltStatePrivate }
#Import ".\PDXVAHDSW_GetVideoProcessStreamStatePrivate.ahk" { PDXVAHDSW_GetVideoProcessStreamStatePrivate }
#Import ".\PDXVAHDSW_GetVideoProcessorCaps.ahk" { PDXVAHDSW_GetVideoProcessorCaps }
#Import ".\PDXVAHDSW_GetVideoProcessorCustomRates.ahk" { PDXVAHDSW_GetVideoProcessorCustomRates }
#Import ".\PDXVAHDSW_GetVideoProcessorDeviceCaps.ahk" { PDXVAHDSW_GetVideoProcessorDeviceCaps }
#Import ".\PDXVAHDSW_GetVideoProcessorFilterRange.ahk" { PDXVAHDSW_GetVideoProcessorFilterRange }
#Import ".\PDXVAHDSW_GetVideoProcessorInputFormats.ahk" { PDXVAHDSW_GetVideoProcessorInputFormats }
#Import ".\PDXVAHDSW_GetVideoProcessorOutputFormats.ahk" { PDXVAHDSW_GetVideoProcessorOutputFormats }
#Import ".\PDXVAHDSW_ProposeVideoPrivateFormat.ahk" { PDXVAHDSW_ProposeVideoPrivateFormat }
#Import ".\PDXVAHDSW_SetVideoProcessBltState.ahk" { PDXVAHDSW_SetVideoProcessBltState }
#Import ".\PDXVAHDSW_SetVideoProcessStreamState.ahk" { PDXVAHDSW_SetVideoProcessStreamState }
#Import ".\PDXVAHDSW_VideoProcessBltHD.ahk" { PDXVAHDSW_VideoProcessBltHD }

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
    CreateDevice : PDXVAHDSW_CreateDevice

    /**
     * Function pointer of type <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nc-dxvahd-pdxvahdsw_proposevideoprivateformat">PDXVAHDSW_ProposeVideoPrivateFormat</a>.
     */
    ProposeVideoPrivateFormat : PDXVAHDSW_ProposeVideoPrivateFormat

    /**
     * Function pointer of type <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nc-dxvahd-pdxvahdsw_getvideoprocessordevicecaps">PDXVAHDSW_GetVideoProcessorDeviceCaps</a>.
     */
    GetVideoProcessorDeviceCaps : PDXVAHDSW_GetVideoProcessorDeviceCaps

    /**
     * Function pointer of type <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nc-dxvahd-pdxvahdsw_getvideoprocessoroutputformats">PDXVAHDSW_GetVideoProcessorOutputFormats</a>.
     */
    GetVideoProcessorOutputFormats : PDXVAHDSW_GetVideoProcessorOutputFormats

    /**
     * Function pointer of type <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nc-dxvahd-pdxvahdsw_getvideoprocessorinputformats">PDXVAHDSW_GetVideoProcessorInputFormats</a>.
     */
    GetVideoProcessorInputFormats : PDXVAHDSW_GetVideoProcessorInputFormats

    /**
     * Function pointer of type <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nc-dxvahd-pdxvahdsw_getvideoprocessorcaps">PDXVAHDSW_GetVideoProcessorCaps</a>.
     */
    GetVideoProcessorCaps : PDXVAHDSW_GetVideoProcessorCaps

    /**
     * Function pointer of type <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nc-dxvahd-pdxvahdsw_getvideoprocessorcustomrates">PDXVAHDSW_GetVideoProcessorCustomRates</a>.
     */
    GetVideoProcessorCustomRates : PDXVAHDSW_GetVideoProcessorCustomRates

    /**
     * Function pointer of type <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nc-dxvahd-pdxvahdsw_getvideoprocessorfilterrange">PDXVAHDSW_GetVideoProcessorFilterRange</a>.
     */
    GetVideoProcessorFilterRange : PDXVAHDSW_GetVideoProcessorFilterRange

    /**
     * Function pointer of type <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nc-dxvahd-pdxvahdsw_destroydevice">PDXVAHDSW_DestroyDevice</a>.
     */
    DestroyDevice : PDXVAHDSW_DestroyDevice

    /**
     * Function pointer of type <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nc-dxvahd-pdxvahdsw_createvideoprocessor">PDXVAHDSW_CreateVideoProcessor</a>.
     */
    CreateVideoProcessor : PDXVAHDSW_CreateVideoProcessor

    /**
     * Function pointer of type <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nc-dxvahd-pdxvahdsw_setvideoprocessbltstate">PDXVAHDSW_SetVideoProcessBltState</a>.
     */
    SetVideoProcessBltState : PDXVAHDSW_SetVideoProcessBltState

    /**
     * Function pointer of type <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nc-dxvahd-pdxvahdsw_getvideoprocessbltstateprivate">PDXVAHDSW_GetVideoProcessBltStatePrivate</a>.
     */
    GetVideoProcessBltStatePrivate : PDXVAHDSW_GetVideoProcessBltStatePrivate

    /**
     * Function pointer of type <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nc-dxvahd-pdxvahdsw_setvideoprocessstreamstate">PDXVAHDSW_SetVideoProcessStreamState</a>.
     */
    SetVideoProcessStreamState : PDXVAHDSW_SetVideoProcessStreamState

    /**
     * Function pointer of type <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nc-dxvahd-pdxvahdsw_getvideoprocessstreamstateprivate">PDXVAHDSW_GetVideoProcessStreamStatePrivate</a>.
     */
    GetVideoProcessStreamStatePrivate : PDXVAHDSW_GetVideoProcessStreamStatePrivate

    /**
     * Function pointer of type <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nc-dxvahd-pdxvahdsw_videoprocessblthd">PDXVAHDSW_VideoProcessBltHD</a>.
     */
    VideoProcessBltHD : PDXVAHDSW_VideoProcessBltHD

    /**
     * Function pointer of type <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nc-dxvahd-pdxvahdsw_destroyvideoprocessor">PDXVAHDSW_DestroyVideoProcessor</a>.
     */
    DestroyVideoProcessor : PDXVAHDSW_DestroyVideoProcessor

}
