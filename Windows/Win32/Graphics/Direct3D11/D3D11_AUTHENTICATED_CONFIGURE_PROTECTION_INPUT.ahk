#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D11_OMAC.ahk
#Include .\D3D11_AUTHENTICATED_CONFIGURE_INPUT.ahk
#Include .\D3D11_AUTHENTICATED_PROTECTION_FLAGS.ahk

/**
 * Contains input data for a D3D11_AUTHENTICATED_CONFIGURE_PROTECTION command.
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ns-d3d11-d3d11_authenticated_configure_protection_input
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_AUTHENTICATED_CONFIGURE_PROTECTION_INPUT extends Win32Struct
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
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_authenticated_protection_flags">D3D11_AUTHENTICATED_PROTECTION_FLAGS</a> union that specifies the protection level.
     * @type {D3D11_AUTHENTICATED_PROTECTION_FLAGS}
     */
    Protections{
        get {
            if(!this.HasProp("__Protections"))
                this.__Protections := D3D11_AUTHENTICATED_PROTECTION_FLAGS(this.ptr + 40)
            return this.__Protections
        }
    }
}
