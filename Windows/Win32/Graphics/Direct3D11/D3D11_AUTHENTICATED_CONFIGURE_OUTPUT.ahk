#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D11_OMAC.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * Contains the response from the ID3D11VideoContext::ConfigureAuthenticatedChannel method.
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ns-d3d11-d3d11_authenticated_configure_output
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_AUTHENTICATED_CONFIGURE_OUTPUT extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_omac">D3D11_OMAC</a> structure that contains a Message Authentication Code (MAC) of the data. The driver uses AES-based one-key CBC MAC (OMAC) to calculate this value for the block of data that appears after this structure member.
     * @type {D3D11_OMAC}
     */
    omac{
        get {
            if(!this.HasProp("__omac"))
                this.__omac := D3D11_OMAC(0, this)
            return this.__omac
        }
    }

    /**
     * A GUID that specifies the command. For a list of GUIDs, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_authenticated_configure_input">D3D11_AUTHENTICATED_CONFIGURE_INPUT</a>.
     * @type {Pointer<Guid>}
     */
    ConfigureType {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A handle to the authenticated channel.
     * @type {HANDLE}
     */
    hChannel{
        get {
            if(!this.HasProp("__hChannel"))
                this.__hChannel := HANDLE(24, this)
            return this.__hChannel
        }
    }

    /**
     * The command sequence number.
     * @type {Integer}
     */
    SequenceNumber {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The result code for the command.
     * @type {HRESULT}
     */
    ReturnCode {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }
}
