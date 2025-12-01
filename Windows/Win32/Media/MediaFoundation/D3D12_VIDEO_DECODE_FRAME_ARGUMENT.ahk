#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents the decode parameters for a frame.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_decode_frame_argument
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_DECODE_FRAME_ARGUMENT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A member of the [D3D12_VIDEO_DECODE_ARGUMENT_TYPE](ne-d3d12video-d3d12_video_decode_argument_type.md) enumeration specifying the type of argument.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The size of the data in *pArgument*, in bytes.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A pointer to the argument data.
     * @type {Pointer<Void>}
     */
    pData {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
