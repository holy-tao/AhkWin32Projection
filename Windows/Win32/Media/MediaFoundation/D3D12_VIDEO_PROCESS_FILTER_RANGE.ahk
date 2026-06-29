#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the range of supported values for an image filter. (D3D12_VIDEO_PROCESS_FILTER_RANGE)
 * @remarks
 * The multiplier enables the filter range to have a fractional step value. For example, a hue filter might have an actual range of [–180.0 ... +180.0] with a step size of 0.25. The device would report the following range and multiplier:
 * 
 * - Minimum: –720
 * - Maximum: +720
 * - Multiplier: 0.25
 * 
 * In this case, a filter value of 2 would be interpreted by the device as 0.50 (or 2 × 0.25).
 * 
 * The device should use a multiplier that can be represented exactly as a base-2 fraction.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_process_filter_range
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_PROCESS_FILTER_RANGE {
    #StructPack 4

    /**
     * The minimum value of the filter.
     */
    Minimum : Int32

    /**
     * The maximum value of the filter.
     */
    Maximum : Int32

    /**
     * The default value of the filter.
     */
    Default : Int32

    /**
     * A multiplier. Use the following formula to translate the filter setting into the actual filter value: 
     * 
     * `Actual Value = Set Value × Multiplier.`
     */
    Multiplier : Float32

}
