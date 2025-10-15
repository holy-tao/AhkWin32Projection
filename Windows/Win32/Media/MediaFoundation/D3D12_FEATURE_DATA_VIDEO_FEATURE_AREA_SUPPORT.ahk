#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_VIDEO_FEATURE_AREA_SUPPORT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * @type {Integer}
     */
    NodeIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {BOOL}
     */
    VideoDecodeSupport{
        get {
            if(!this.HasProp("__VideoDecodeSupport"))
                this.__VideoDecodeSupport := BOOL(this.ptr + 4)
            return this.__VideoDecodeSupport
        }
    }

    /**
     * @type {BOOL}
     */
    VideoProcessSupport{
        get {
            if(!this.HasProp("__VideoProcessSupport"))
                this.__VideoProcessSupport := BOOL(this.ptr + 8)
            return this.__VideoProcessSupport
        }
    }

    /**
     * @type {BOOL}
     */
    VideoEncodeSupport{
        get {
            if(!this.HasProp("__VideoEncodeSupport"))
                this.__VideoEncodeSupport := BOOL(this.ptr + 12)
            return this.__VideoEncodeSupport
        }
    }
}
