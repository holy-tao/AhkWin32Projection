#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_ENCODE_REFERENCE_FRAMES.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_FRAME_ANALYSIS extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Pointer<ID3D12Resource>}
     */
    pDownscaledFrame {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Subresource {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {D3D12_VIDEO_ENCODE_REFERENCE_FRAMES}
     */
    DownscaledReferences{
        get {
            if(!this.HasProp("__DownscaledReferences"))
                this.__DownscaledReferences := D3D12_VIDEO_ENCODE_REFERENCE_FRAMES(16, this)
            return this.__DownscaledReferences
        }
    }
}
