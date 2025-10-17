#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk

/**
 * Specifies transform parameters for video processing.
 * @remarks
 * 
  * For stereo formats, the orientation is applied before the stereo format is applied.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12video/ns-d3d12video-d3d12_video_process_transform
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_PROCESS_TRANSFORM extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Specifies the source rectangle of the transform. This is the portion of the input surface that is blitted to the destination surface. The source rectangle is given in pixel coordinates, relative to the input surface.
     * @type {RECT}
     */
    SourceRectangle{
        get {
            if(!this.HasProp("__SourceRectangle"))
                this.__SourceRectangle := RECT(0, this)
            return this.__SourceRectangle
        }
    }

    /**
     * Specifies the destination rectangle of the transform. This is the portion of the output surface that receives the blit for this stream. The destination rectangle is given in pixel coordinates, relative to the output surface.
     * @type {RECT}
     */
    DestinationRectangle{
        get {
            if(!this.HasProp("__DestinationRectangle"))
                this.__DestinationRectangle := RECT(16, this)
            return this.__DestinationRectangle
        }
    }

    /**
     * The rotation and flip operation to apply to the source.  Source and Destination rectangles are specified in post orientation coordinates.
     * @type {Integer}
     */
    Orientation {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }
}
