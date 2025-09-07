#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D11_OMAC.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include .\D3D11_AUTHENTICATED_CONFIGURE_INPUT.ahk

/**
 * Contains input data for a D3D11_AUTHENTICATED_CONFIGURE_ENCRYPTION_WHEN_ACCESSIBLE command.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_authenticated_configure_accessible_encryption_input
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_AUTHENTICATED_CONFIGURE_ACCESSIBLE_ENCRYPTION_INPUT extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_authenticated_configure_input">D3D11_AUTHENTICATED_CONFIGURE_INPUT</a> structure that contains the command GUID and other data.
     * @type {D3D11_AUTHENTICATED_CONFIGURE_INPUT}
     */
    Parameters{
        get {
            if(!this.HasProp("__Parameters"))
                this.__Parameters := D3D11_AUTHENTICATED_CONFIGURE_INPUT(this.ptr + 0)
            return this.__Parameters
        }
    }

    /**
     * A GUID that specifies the type of encryption to apply.
     * @type {Pointer<Guid>}
     */
    EncryptionGuid {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
