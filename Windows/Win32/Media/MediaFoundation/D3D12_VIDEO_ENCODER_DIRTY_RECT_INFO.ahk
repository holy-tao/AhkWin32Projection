#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_DIRTY_RECT_INFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {BOOL}
     */
    FullFrameIdentical {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    MapValuesType {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    NumDirtyRects {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Pointer<RECT>}
     */
    pDirtyRects {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    SourceDPBFrameReference {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
