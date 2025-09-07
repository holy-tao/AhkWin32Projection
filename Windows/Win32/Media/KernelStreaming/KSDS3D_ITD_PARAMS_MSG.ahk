#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSDS3D_ITD_PARAMS.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSDS3D_ITD_PARAMS_MSG extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Enabled {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {KSDS3D_ITD_PARAMS}
     */
    LeftParams{
        get {
            if(!this.HasProp("__LeftParams"))
                this.__LeftParams := KSDS3D_ITD_PARAMS(this.ptr + 8)
            return this.__LeftParams
        }
    }

    /**
     * @type {KSDS3D_ITD_PARAMS}
     */
    RightParams{
        get {
            if(!this.HasProp("__RightParams"))
                this.__RightParams := KSDS3D_ITD_PARAMS(this.ptr + 32)
            return this.__RightParams
        }
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }
}
