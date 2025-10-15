#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSDS3D_HRTF_PARAMS_MSG extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Enabled {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {BOOL}
     */
    SwapChannels{
        get {
            if(!this.HasProp("__SwapChannels"))
                this.__SwapChannels := BOOL(this.ptr + 8)
            return this.__SwapChannels
        }
    }

    /**
     * @type {BOOL}
     */
    ZeroAzimuth{
        get {
            if(!this.HasProp("__ZeroAzimuth"))
                this.__ZeroAzimuth := BOOL(this.ptr + 12)
            return this.__ZeroAzimuth
        }
    }

    /**
     * @type {BOOL}
     */
    CrossFadeOutput{
        get {
            if(!this.HasProp("__CrossFadeOutput"))
                this.__CrossFadeOutput := BOOL(this.ptr + 16)
            return this.__CrossFadeOutput
        }
    }

    /**
     * @type {Integer}
     */
    FilterSize {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
