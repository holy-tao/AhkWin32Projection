#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Provides information about the input streams passed into the ID3DVideoContext1::VideoProcessorGetBehaviorHints method.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/ns-d3d11_1-d3d11_video_processor_stream_behavior_hint
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_VIDEO_PROCESSOR_STREAM_BEHAVIOR_HINT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * A value indicating whether this input stream should be used to compute behavior hints. Set to true if the stream should be used to compute behavior hints; otherwise, set to false.
     * @type {BOOL}
     */
    Enable {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The width of the input stream.
     * @type {Integer}
     */
    Width {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The height of the input stream.
     * @type {Integer}
     */
    Height {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The format of the input stream.
     * @type {Integer}
     */
    Format {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }
}
