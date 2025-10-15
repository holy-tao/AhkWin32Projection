#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_INPUT_MAP_DATA_DIRTY_REGIONS extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {BOOL}
     */
    FullFrameIdentical{
        get {
            if(!this.HasProp("__FullFrameIdentical"))
                this.__FullFrameIdentical := BOOL(this.ptr + 0)
            return this.__FullFrameIdentical
        }
    }

    /**
     * @type {Integer}
     */
    MapValuesType {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Pointer<ID3D12Resource>}
     */
    pDirtyRegionsMap {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    SourceDPBFrameReference {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
