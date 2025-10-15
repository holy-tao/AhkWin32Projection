#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_REFERENCE_PICTURE_DESCRIPTOR_H264 extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * @type {Integer}
     */
    ReconstructedPictureResourceIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {BOOL}
     */
    IsLongTermReference{
        get {
            if(!this.HasProp("__IsLongTermReference"))
                this.__IsLongTermReference := BOOL(this.ptr + 4)
            return this.__IsLongTermReference
        }
    }

    /**
     * @type {Integer}
     */
    LongTermPictureIdx {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    PictureOrderCountNumber {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    FrameDecodingOrderNumber {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    TemporalLayerIndex {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
