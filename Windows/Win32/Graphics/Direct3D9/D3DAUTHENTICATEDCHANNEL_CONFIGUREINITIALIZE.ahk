#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D_OMAC.ahk
#Include .\D3DAUTHENTICATEDCHANNEL_CONFIGURE_INPUT.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DAUTHENTICATEDCHANNEL_CONFIGUREINITIALIZE extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {D3DAUTHENTICATEDCHANNEL_CONFIGURE_INPUT}
     */
    Parameters{
        get {
            if(!this.HasProp("__Parameters"))
                this.__Parameters := D3DAUTHENTICATEDCHANNEL_CONFIGURE_INPUT(this.ptr + 0)
            return this.__Parameters
        }
    }

    /**
     * @type {Integer}
     */
    StartSequenceQuery {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    StartSequenceConfigure {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }
}
