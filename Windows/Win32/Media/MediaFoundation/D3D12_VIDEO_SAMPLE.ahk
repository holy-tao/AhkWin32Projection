#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_FORMAT.ahk

/**
 * Describes the width, height, format, and color space of a picture buffer.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_sample
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_SAMPLE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * The width of the sample.
     * @type {Integer}
     */
    Width {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The height of the sample.
     * @type {Integer}
     */
    Height {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A [D3D12_VIDEO_FORMAT](ns-d3d12video-d3d12_video_format.md) structure describing the format and colorspace of the sample.
     * @type {D3D12_VIDEO_FORMAT}
     */
    Format{
        get {
            if(!this.HasProp("__Format"))
                this.__Format := D3D12_VIDEO_FORMAT(8, this)
            return this.__Format
        }
    }
}
