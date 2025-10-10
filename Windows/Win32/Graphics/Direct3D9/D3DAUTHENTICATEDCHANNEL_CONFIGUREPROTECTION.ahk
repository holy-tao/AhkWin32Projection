#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D_OMAC.ahk
#Include .\D3DAUTHENTICATEDCHANNEL_CONFIGURE_INPUT.ahk
#Include .\D3DAUTHENTICATEDCHANNEL_PROTECTION_FLAGS.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DAUTHENTICATEDCHANNEL_CONFIGUREPROTECTION extends Win32Struct
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
     * @type {D3DAUTHENTICATEDCHANNEL_PROTECTION_FLAGS}
     */
    Protections{
        get {
            if(!this.HasProp("__Protections"))
                this.__Protections := D3DAUTHENTICATEDCHANNEL_PROTECTION_FLAGS(this.ptr + 40)
            return this.__Protections
        }
    }
}
