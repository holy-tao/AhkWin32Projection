#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains pointers to functions implemented by a software plug-in for Microsoft DirectX Video Acceleration High Definition (DXVA-HD).
 * @remarks
 * If you provide a software plug-in for DXVA-HD, the plug-in must implement a set of functions that are defined by the function pointer types in this structure.
  * 
  * At initialization, the   DXVA-HD runtime calls the plug-in device's <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nc-dxvahd-pdxvahdsw_plugin">PDXVAHDSW_Plugin</a> function. This function fills in a <b>DXVAHDSW_CALLBACKS</b> structure with pointers to  the set of functions that are implemented by the plug-in device. When the application calls DXVA-HD methods, the DXVA-HD runtime calls the corresponding plug-in functions.
 * @see https://learn.microsoft.com/windows/win32/api/dxvahd/ns-dxvahd-dxvahdsw_callbacks
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVAHDSW_CALLBACKS extends Win32Struct
{
    static sizeof => 128

    static packingSize => 8

    /**
     * Function pointer of type <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nc-dxvahd-pdxvahdsw_createdevice">PDXVAHDSW_CreateDevice</a>.
     * @type {Pointer<PDXVAHDSW_CreateDevice>}
     */
    CreateDevice {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Function pointer of type <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nc-dxvahd-pdxvahdsw_proposevideoprivateformat">PDXVAHDSW_ProposeVideoPrivateFormat</a>.
     * @type {Pointer<PDXVAHDSW_ProposeVideoPrivateFormat>}
     */
    ProposeVideoPrivateFormat {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Function pointer of type <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nc-dxvahd-pdxvahdsw_getvideoprocessordevicecaps">PDXVAHDSW_GetVideoProcessorDeviceCaps</a>.
     * @type {Pointer<PDXVAHDSW_GetVideoProcessorDeviceCaps>}
     */
    GetVideoProcessorDeviceCaps {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Function pointer of type <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nc-dxvahd-pdxvahdsw_getvideoprocessoroutputformats">PDXVAHDSW_GetVideoProcessorOutputFormats</a>.
     * @type {Pointer<PDXVAHDSW_GetVideoProcessorOutputFormats>}
     */
    GetVideoProcessorOutputFormats {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Function pointer of type <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nc-dxvahd-pdxvahdsw_getvideoprocessorinputformats">PDXVAHDSW_GetVideoProcessorInputFormats</a>.
     * @type {Pointer<PDXVAHDSW_GetVideoProcessorInputFormats>}
     */
    GetVideoProcessorInputFormats {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Function pointer of type <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nc-dxvahd-pdxvahdsw_getvideoprocessorcaps">PDXVAHDSW_GetVideoProcessorCaps</a>.
     * @type {Pointer<PDXVAHDSW_GetVideoProcessorCaps>}
     */
    GetVideoProcessorCaps {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Function pointer of type <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nc-dxvahd-pdxvahdsw_getvideoprocessorcustomrates">PDXVAHDSW_GetVideoProcessorCustomRates</a>.
     * @type {Pointer<PDXVAHDSW_GetVideoProcessorCustomRates>}
     */
    GetVideoProcessorCustomRates {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Function pointer of type <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nc-dxvahd-pdxvahdsw_getvideoprocessorfilterrange">PDXVAHDSW_GetVideoProcessorFilterRange</a>.
     * @type {Pointer<PDXVAHDSW_GetVideoProcessorFilterRange>}
     */
    GetVideoProcessorFilterRange {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Function pointer of type <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nc-dxvahd-pdxvahdsw_destroydevice">PDXVAHDSW_DestroyDevice</a>.
     * @type {Pointer<PDXVAHDSW_DestroyDevice>}
     */
    DestroyDevice {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Function pointer of type <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nc-dxvahd-pdxvahdsw_createvideoprocessor">PDXVAHDSW_CreateVideoProcessor</a>.
     * @type {Pointer<PDXVAHDSW_CreateVideoProcessor>}
     */
    CreateVideoProcessor {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Function pointer of type <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nc-dxvahd-pdxvahdsw_setvideoprocessbltstate">PDXVAHDSW_SetVideoProcessBltState</a>.
     * @type {Pointer<PDXVAHDSW_SetVideoProcessBltState>}
     */
    SetVideoProcessBltState {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * Function pointer of type <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nc-dxvahd-pdxvahdsw_getvideoprocessbltstateprivate">PDXVAHDSW_GetVideoProcessBltStatePrivate</a>.
     * @type {Pointer<PDXVAHDSW_GetVideoProcessBltStatePrivate>}
     */
    GetVideoProcessBltStatePrivate {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * Function pointer of type <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nc-dxvahd-pdxvahdsw_setvideoprocessstreamstate">PDXVAHDSW_SetVideoProcessStreamState</a>.
     * @type {Pointer<PDXVAHDSW_SetVideoProcessStreamState>}
     */
    SetVideoProcessStreamState {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * Function pointer of type <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nc-dxvahd-pdxvahdsw_getvideoprocessstreamstateprivate">PDXVAHDSW_GetVideoProcessStreamStatePrivate</a>.
     * @type {Pointer<PDXVAHDSW_GetVideoProcessStreamStatePrivate>}
     */
    GetVideoProcessStreamStatePrivate {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * Function pointer of type <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nc-dxvahd-pdxvahdsw_videoprocessblthd">PDXVAHDSW_VideoProcessBltHD</a>.
     * @type {Pointer<PDXVAHDSW_VideoProcessBltHD>}
     */
    VideoProcessBltHD {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * Function pointer of type <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nc-dxvahd-pdxvahdsw_destroyvideoprocessor">PDXVAHDSW_DestroyVideoProcessor</a>.
     * @type {Pointer<PDXVAHDSW_DestroyVideoProcessor>}
     */
    DestroyVideoProcessor {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }
}
