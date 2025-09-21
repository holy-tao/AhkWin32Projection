#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class DXVA2SW_CALLBACKS extends Win32Struct
{
    static sizeof => 112

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<PDXVA2SW_GETVIDEOPROCESSORRENDERTARGETCOUNT>}
     */
    GetVideoProcessorRenderTargetCount {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<PDXVA2SW_GETVIDEOPROCESSORRENDERTARGETS>}
     */
    GetVideoProcessorRenderTargets {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<PDXVA2SW_GETVIDEOPROCESSORCAPS>}
     */
    GetVideoProcessorCaps {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<PDXVA2SW_GETVIDEOPROCESSORSUBSTREAMFORMATCOUNT>}
     */
    GetVideoProcessorSubStreamFormatCount {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<PDXVA2SW_GETVIDEOPROCESSORSUBSTREAMFORMATS>}
     */
    GetVideoProcessorSubStreamFormats {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<PDXVA2SW_GETPROCAMPRANGE>}
     */
    GetProcAmpRange {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<PDXVA2SW_GETFILTERPROPERTYRANGE>}
     */
    GetFilterPropertyRange {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer<PDXVA2SW_CREATEVIDEOPROCESSDEVICE>}
     */
    CreateVideoProcessDevice {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer<PDXVA2SW_DESTROYVIDEOPROCESSDEVICE>}
     */
    DestroyVideoProcessDevice {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Pointer<PDXVA2SW_VIDEOPROCESSBEGINFRAME>}
     */
    VideoProcessBeginFrame {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * @type {Pointer<PDXVA2SW_VIDEOPROCESSENDFRAME>}
     */
    VideoProcessEndFrame {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * @type {Pointer<PDXVA2SW_VIDEOPROCESSSETRENDERTARGET>}
     */
    VideoProcessSetRenderTarget {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * @type {Pointer<PDXVA2SW_VIDEOPROCESSBLT>}
     */
    VideoProcessBlt {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }
}
