#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Graphics\Dxgi\Common\DXGI_RATIONAL.ahk

/**
 * Retrieves the number of past and future reference frames required for the specified deinterlace mode, filter, rate conversion, or auto processing features.
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12video/ns-d3d12video-d3d12_feature_data_video_process_reference_info
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_VIDEO_PROCESS_REFERENCE_INFO extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * An integer indicating which physical adapter of the device the operation applies to, in a multi-adapter operation.
     * @type {Integer}
     */
    NodeIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A member of the [D3D12\_VIDEO\_PROCESS\_DEINTERLACE\_FLAGS](ne-d3d12video-d3d12_video_process_deinterlace_flags.md) enumeration specifying the deinterlacing mode for which the required past and future reference frame counts are retrieved.
     * @type {Integer}
     */
    DeinterlaceMode {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A bitwise OR combination of values from the [D3D12\_VIDEO\_PROCESS\_FILTER\_FLAGS](ne-d3d12video-d3d12_video_process_filter_flags.md) enumeration specifying the filters for which the required past and future reference frame counts are retrieved.
     * @type {Integer}
     */
    Filters {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * A bitwise OR combination of values from the [D3D12\_VIDEO\_PROCESS\_FEATURE\_FLAGS](ne-d3d12video-d3d12_video_process_feature_flags.md) enumeration specifying the features for which the required past and future reference frame counts are retrieved.
     * @type {Integer}
     */
    FeatureSupport {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * The input frame rate of the stream for which the required past and future reference frame counts are retrieved.
     * @type {DXGI_RATIONAL}
     */
    InputFrameRate{
        get {
            if(!this.HasProp("__InputFrameRate"))
                this.__InputFrameRate := DXGI_RATIONAL(this.ptr + 16)
            return this.__InputFrameRate
        }
    }

    /**
     * The output frame rate of the stream for which the required past and future reference frame counts are retrieved.
     * @type {DXGI_RATIONAL}
     */
    OutputFrameRate{
        get {
            if(!this.HasProp("__OutputFrameRate"))
                this.__OutputFrameRate := DXGI_RATIONAL(this.ptr + 24)
            return this.__OutputFrameRate
        }
    }

    /**
     * True if autoprocessing will be used; otherwise, false.
     * @type {Integer}
     */
    EnableAutoProcessing {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * The number of past frames required to support the specified processing features.
     * @type {Integer}
     */
    PastFrames {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * The number of future frames required to support the specified processing features.
     * @type {Integer}
     */
    FutureFrames {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
