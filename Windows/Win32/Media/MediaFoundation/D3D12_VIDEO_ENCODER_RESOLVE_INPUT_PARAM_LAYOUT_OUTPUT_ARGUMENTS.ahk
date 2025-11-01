#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_RESOLVE_INPUT_PARAM_LAYOUT_OUTPUT_ARGUMENTS extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * @type {ID3D12Resource}
     */
    pOpaqueLayoutBuffer {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
