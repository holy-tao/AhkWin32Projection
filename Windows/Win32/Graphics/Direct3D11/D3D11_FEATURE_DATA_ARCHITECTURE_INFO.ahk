#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes information about Direct3D 11.1 adapter architecture.
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ns-d3d11-d3d11_feature_data_architecture_info
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_FEATURE_DATA_ARCHITECTURE_INFO extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Specifies whether a rendering device batches rendering commands and performs multipass rendering into tiles or bins over a render area. Certain API usage patterns that are fine for TileBasedDefferredRenderers (TBDRs) can perform worse on non-TBDRs and vice versa.  Applications that are careful about rendering can be friendly to both TBDR and non-TBDR architectures. <b>TRUE</b> if the rendering device batches rendering commands and <b>FALSE</b> otherwise.
     * @type {BOOL}
     */
    TileBasedDeferredRenderer {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
