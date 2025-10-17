#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_ENCODER_AV1_PICTURE_CONTROL_SUBREGIONS_LAYOUT_DATA_TILES.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_AV1_FRAME_SUBREGION_LAYOUT_CONFIG_SUPPORT extends Win32Struct
{
    static sizeof => 1096

    static packingSize => 8

    /**
     * @type {BOOL}
     */
    Use128SuperBlocks {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_AV1_PICTURE_CONTROL_SUBREGIONS_LAYOUT_DATA_TILES}
     */
    TilesConfiguration{
        get {
            if(!this.HasProp("__TilesConfiguration"))
                this.__TilesConfiguration := D3D12_VIDEO_ENCODER_AV1_PICTURE_CONTROL_SUBREGIONS_LAYOUT_DATA_TILES(8, this)
            return this.__TilesConfiguration
        }
    }

    /**
     * @type {Integer}
     */
    ValidationFlags {
        get => NumGet(this, 1056, "int")
        set => NumPut("int", value, this, 1056)
    }

    /**
     * @type {Integer}
     */
    MinTileRows {
        get => NumGet(this, 1060, "uint")
        set => NumPut("uint", value, this, 1060)
    }

    /**
     * @type {Integer}
     */
    MaxTileRows {
        get => NumGet(this, 1064, "uint")
        set => NumPut("uint", value, this, 1064)
    }

    /**
     * @type {Integer}
     */
    MinTileCols {
        get => NumGet(this, 1068, "uint")
        set => NumPut("uint", value, this, 1068)
    }

    /**
     * @type {Integer}
     */
    MaxTileCols {
        get => NumGet(this, 1072, "uint")
        set => NumPut("uint", value, this, 1072)
    }

    /**
     * @type {Integer}
     */
    MinTileWidth {
        get => NumGet(this, 1076, "uint")
        set => NumPut("uint", value, this, 1076)
    }

    /**
     * @type {Integer}
     */
    MaxTileWidth {
        get => NumGet(this, 1080, "uint")
        set => NumPut("uint", value, this, 1080)
    }

    /**
     * @type {Integer}
     */
    MinTileArea {
        get => NumGet(this, 1084, "uint")
        set => NumPut("uint", value, this, 1084)
    }

    /**
     * @type {Integer}
     */
    MaxTileArea {
        get => NumGet(this, 1088, "uint")
        set => NumPut("uint", value, this, 1088)
    }

    /**
     * @type {Integer}
     */
    TileSizeBytesMinus1 {
        get => NumGet(this, 1092, "uint")
        set => NumPut("uint", value, this, 1092)
    }
}
