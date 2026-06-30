#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_BITSTREAM_ENCRYPTION_TYPE.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\D3D12_VIDEO_DECODE_CONFIGURATION.ahk
#Include .\D3D12_VIDEO_FRAME_CODED_INTERLACE_TYPE.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_FEATURE_DATA_VIDEO_DECODE_FORMAT_COUNT extends Win32Struct {
    static sizeof => 32

    static packingSize => 4

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
    Configuration {
        get {
            if(!this.HasProp("__Configuration"))
                this.__Configuration := D3D12_VIDEO_DECODE_CONFIGURATION(4, this)
            return this.__Configuration
        }
    }

    /**
     * @type {Integer}
     */
    FormatCount {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }
}
