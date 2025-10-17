#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D11_OMAC.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include .\D3D11_AUTHENTICATED_QUERY_OUTPUT.ahk
#Include .\D3D11_AUTHENTICATED_PROTECTION_FLAGS.ahk

/**
 * Contains the response to a D3D11_AUTHENTICATED_QUERY_PROTECTION query.
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ns-d3d11-d3d11_authenticated_query_protection_output
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_AUTHENTICATED_QUERY_PROTECTION_OUTPUT extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_authenticated_query_output">D3D11_AUTHENTICATED_QUERY_OUTPUT</a> structure that contains a Message Authentication Code (MAC) and other data.
     * @type {D3D11_AUTHENTICATED_QUERY_OUTPUT}
     */
    Output{
        get {
            if(!this.HasProp("__Output"))
                this.__Output := D3D11_AUTHENTICATED_QUERY_OUTPUT(0, this)
            return this.__Output
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_authenticated_protection_flags">D3D11_AUTHENTICATED_PROTECTION_FLAGS</a> union that specifies the protection level.
     * @type {D3D11_AUTHENTICATED_PROTECTION_FLAGS}
     */
    ProtectionFlags{
        get {
            if(!this.HasProp("__ProtectionFlags"))
                this.__ProtectionFlags := D3D11_AUTHENTICATED_PROTECTION_FLAGS(40, this)
            return this.__ProtectionFlags
        }
    }
}
