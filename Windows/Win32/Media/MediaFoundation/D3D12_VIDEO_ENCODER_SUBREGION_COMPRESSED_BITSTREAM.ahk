#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_SUBREGION_COMPRESSED_BITSTREAM extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {Integer}
     */
    BufferMode {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ExpectedSubregionCount {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Pointer<UInt64>}
     */
    pSubregionBitstreamsBaseOffsets {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<ID3D12Resource>}
     */
    ppSubregionBitstreams {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<ID3D12Resource>}
     */
    ppSubregionSizes {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<ID3D12Resource>}
     */
    ppSubregionOffsets {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<ID3D12Fence>}
     */
    ppSubregionFences {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<UInt64>}
     */
    pSubregionFenceValues {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }
}
