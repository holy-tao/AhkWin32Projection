#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D_OMAC.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include .\D3DAUTHENTICATEDCHANNEL_CONFIGURE_INPUT.ahk

/**
 * Contains input data for a D3DAUTHENTICATEDCONFIGURE\_INITIALIZE command.
 * @remarks
 * The **StartSequenceQuery** and **StartSequenceConfigure** members each contain a cryptographically secure 32-bit random number.
 * @see https://learn.microsoft.com/windows/win32/medfound/d3dauthenticatedchannel-configureinitialize
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DAUTHENTICATEDCHANNEL_CONFIGUREINITIALIZE extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * A [**D3DAUTHENTICATEDCHANNEL\_CONFIGURE\_INPUT**](d3dauthenticatedchannel-configure-input.md) structure that contains the command GUID and other data.
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
     * The initial sequence number for queries.
     * @type {Integer}
     */
    StartSequenceQuery {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * The initial sequence number for commands.
     * @type {Integer}
     */
    StartSequenceConfigure {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }
}
