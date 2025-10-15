#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_FRAME_ANALYSIS_CONFIGURATION extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {BOOL}
     */
    Enabled{
        get {
            if(!this.HasProp("__Enabled"))
                this.__Enabled := BOOL(this.ptr + 0)
            return this.__Enabled
        }
    }

    /**
     * @type {Integer}
     */
    Pow2DownscaleFactor {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
