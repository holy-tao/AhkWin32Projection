#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_DECODE_CONFIGURATION.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_VIDEO_DECODE_PROTECTED_RESOURCES extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Integer}
     */
    NodeIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {D3D12_VIDEO_DECODE_CONFIGURATION}
     */
    Configuration{
        get {
            if(!this.HasProp("__Configuration"))
                this.__Configuration := D3D12_VIDEO_DECODE_CONFIGURATION(this.ptr + 8)
            return this.__Configuration
        }
    }

    /**
     * @type {Integer}
     */
    SupportFlags {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }
}
