#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D_OMAC.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include .\D3DAUTHENTICATEDCHANNEL_CONFIGURE_INPUT.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/medfound/d3dauthenticatedchannel-configureuncompressedencryption
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DAUTHENTICATEDCHANNEL_CONFIGUREUNCOMPRESSEDENCRYPTION extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {D3DAUTHENTICATEDCHANNEL_CONFIGURE_INPUT}
     */
    Parameters{
        get {
            if(!this.HasProp("__Parameters"))
                this.__Parameters := D3DAUTHENTICATEDCHANNEL_CONFIGURE_INPUT(0, this)
            return this.__Parameters
        }
    }

    /**
     * @type {Pointer<Guid>}
     */
    EncryptionGuid {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
