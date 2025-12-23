#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSDS3D_ITD_PARAMS.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSDS3D_ITD_PARAMS_MSG extends Win32Struct
{
    static sizeof => 56

    static packingSize => 4

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
                this.__LeftParams := KSDS3D_ITD_PARAMS(4, this)
            return this.__LeftParams
        }
    }

    /**
     * @type {KSDS3D_ITD_PARAMS}
     */
    RightParams{
        get {
            if(!this.HasProp("__RightParams"))
                this.__RightParams := KSDS3D_ITD_PARAMS(28, this)
            return this.__RightParams
        }
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }
}
