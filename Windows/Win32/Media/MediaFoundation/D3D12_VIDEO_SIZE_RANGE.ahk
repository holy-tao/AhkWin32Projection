#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the range of supported sizes for a video scaler.
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12video/ns-d3d12video-d3d12_video_size_range
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_SIZE_RANGE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * The largest output width to which content can be scaled.  The largest value allowed is **D3D12\_REQ\_TEXTURE2D\_U\_OR\_V\_DIMENSION** (16384).
     * @type {Integer}
     */
    MaxWidth {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The largest output height to which content can be scaled.  The largest value allowed is **D3D12\_REQ\_TEXTURE2D\_U\_OR\_V\_DIMENSION** (16384).
     * @type {Integer}
     */
    MaxHeight {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The smallest output width to which content can be scaled. The smallest allowed value is 1.
     * @type {Integer}
     */
    MinWidth {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The smallest output height to which content can be scaled. The smallest allowed value is 1.
     * @type {Integer}
     */
    MinHeight {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
