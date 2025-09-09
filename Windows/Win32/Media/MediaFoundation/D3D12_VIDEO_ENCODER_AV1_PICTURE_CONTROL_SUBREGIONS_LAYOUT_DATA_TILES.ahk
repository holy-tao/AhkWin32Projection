#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_AV1_PICTURE_CONTROL_SUBREGIONS_LAYOUT_DATA_TILES extends Win32Struct
{
    static sizeof => 1048

    static packingSize => 8

    /**
     * @type {Integer}
     */
    RowCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ColCount {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Array<UInt64>}
     */
    RowHeights{
        get {
            if(!this.HasProp("__RowHeightsProxyArray"))
                this.__RowHeightsProxyArray := Win32FixedArray(this.ptr + 16, 64, Primitive, "uint")
            return this.__RowHeightsProxyArray
        }
    }

    /**
     * @type {Array<UInt64>}
     */
    ColWidths{
        get {
            if(!this.HasProp("__ColWidthsProxyArray"))
                this.__ColWidthsProxyArray := Win32FixedArray(this.ptr + 528, 64, Primitive, "uint")
            return this.__ColWidthsProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    ContextUpdateTileId {
        get => NumGet(this, 1040, "uint")
        set => NumPut("uint", value, this, 1040)
    }
}
