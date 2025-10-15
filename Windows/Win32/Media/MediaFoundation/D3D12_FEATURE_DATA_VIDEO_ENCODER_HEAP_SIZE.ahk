#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_ENCODER_PROFILE_DESC.ahk
#Include .\D3D12_VIDEO_ENCODER_LEVEL_SETTING.ahk
#Include .\D3D12_VIDEO_ENCODER_HEAP_DESC.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_VIDEO_ENCODER_HEAP_SIZE extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * @type {D3D12_VIDEO_ENCODER_HEAP_DESC}
     */
    HeapDesc{
        get {
            if(!this.HasProp("__HeapDesc"))
                this.__HeapDesc := D3D12_VIDEO_ENCODER_HEAP_DESC(this.ptr + 0)
            return this.__HeapDesc
        }
    }

    /**
     * @type {BOOL}
     */
    IsSupported{
        get {
            if(!this.HasProp("__IsSupported"))
                this.__IsSupported := BOOL(this.ptr + 64)
            return this.__IsSupported
        }
    }

    /**
     * @type {Integer}
     */
    MemoryPoolL0Size {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    MemoryPoolL1Size {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }
}
