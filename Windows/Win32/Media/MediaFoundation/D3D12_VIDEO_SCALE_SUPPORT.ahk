#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_SIZE_RANGE.ahk

/**
 * Describes the supported scaling range of output sizes for a video scaler.
 * @remarks
 * 
 * By default, all possible output size combinations that exist between the maximum size and minimum size for the extent, inclusive, are supported.  *ScaleSupportFlags* may add additional restrictions to the supported scale sizes.  
 * When scaling is not supported, the minimum and maximum sizes should both be set to the input size and no flags should be specified.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12video/ns-d3d12video-d3d12_video_scale_support
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_SCALE_SUPPORT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * A [D3D12_VIDEO_SIZE_RANGE](ns-d3d12video-d3d12_video_size_range.md) structure describing the supported output size range for the scaler.
     * @type {D3D12_VIDEO_SIZE_RANGE}
     */
    OutputSizeRange{
        get {
            if(!this.HasProp("__OutputSizeRange"))
                this.__OutputSizeRange := D3D12_VIDEO_SIZE_RANGE(0, this)
            return this.__OutputSizeRange
        }
    }

    /**
     * A member of the [D3D12_VIDEO_SCALE_SUPPORT_FLAGS](ne-d3d12video-d3d12_video_scale_support_flags.md) enumeration specifying the supported scaling capabilities of the scaler.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }
}
