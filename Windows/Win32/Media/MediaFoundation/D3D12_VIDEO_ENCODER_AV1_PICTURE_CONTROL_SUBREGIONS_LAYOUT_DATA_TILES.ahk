#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_ENCODER_AV1_PICTURE_CONTROL_SUBREGIONS_LAYOUT_DATA_TILES {
    #StructPack 8

    RowCount : Int64

    ColCount : Int64

    RowHeights : Int64[64]

    ColWidths : Int64[64]

    ContextUpdateTileId : Int64

}
