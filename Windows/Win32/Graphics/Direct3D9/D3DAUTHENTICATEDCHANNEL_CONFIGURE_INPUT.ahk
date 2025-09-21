#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D_OMAC.ahk

/**
 * Contains input data for the IDirect3DAuthenticatedChannel9::Configure method.
 * @see https://learn.microsoft.com/windows/win32/medfound/d3dauthenticatedchannel-configure-input
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DAUTHENTICATEDCHANNEL_CONFIGURE_INPUT extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * A [**D3D\_OMAC**](d3d-omac.md) structure that contains a Message Authentication Code (MAC) of the data. The driver uses AES-based one-key CBC MAC (OMAC) to calculate this value for the block of data that appears after this structure member.
     * @type {D3D_OMAC}
     */
    omac{
        get {
            if(!this.HasProp("__omac"))
                this.__omac := D3D_OMAC(this.ptr + 0)
            return this.__omac
        }
    }

    /**
     * A GUID that specifies the command. For a list of values, see [Content Protection Commands](content-protection-commands.md).
     * @type {Pointer<Guid>}
     */
    ConfigureType {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A handle to the authenticated channel. To get the handle, call [**IDirect3DDevice9Video::CreateAuthenticatedChannel**](/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9video-createauthenticatedchannel).
     * @type {Pointer<Void>}
     */
    hChannel {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * The query sequence number. At the start of the session, generate a cryptographically secure 32-bit random number to use as the starting sequence number. For each command, increment the sequence number by 1.
     * @type {Integer}
     */
    SequenceNumber {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
