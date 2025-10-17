#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_DECODE_CONFIGURATION.ahk
#Include ..\..\Graphics\Dxgi\Common\DXGI_RATIONAL.ahk
#Include .\D3D12_VIDEO_DECODER_HEAP_DESC.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_VIDEO_DECODER_HEAP_SIZE1 extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * @type {D3D12_VIDEO_DECODER_HEAP_DESC}
     */
    VideoDecoderHeapDesc{
        get {
            if(!this.HasProp("__VideoDecoderHeapDesc"))
                this.__VideoDecoderHeapDesc := D3D12_VIDEO_DECODER_HEAP_DESC(0, this)
            return this.__VideoDecoderHeapDesc
        }
    }

    /**
     * @type {BOOL}
     */
    Protected {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    MemoryPoolL0Size {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    MemoryPoolL1Size {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }
}
