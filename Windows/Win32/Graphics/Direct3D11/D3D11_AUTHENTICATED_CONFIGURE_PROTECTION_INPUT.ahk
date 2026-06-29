#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\D3D11_AUTHENTICATED_PROTECTION_FLAGS.ahk" { D3D11_AUTHENTICATED_PROTECTION_FLAGS }
#Import ".\D3D11_AUTHENTICATED_CONFIGURE_INPUT.ahk" { D3D11_AUTHENTICATED_CONFIGURE_INPUT }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D11_OMAC.ahk" { D3D11_OMAC }

/**
 * Contains input data for a D3D11_AUTHENTICATED_CONFIGURE_PROTECTION command.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_authenticated_configure_protection_input
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_AUTHENTICATED_CONFIGURE_PROTECTION_INPUT {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_authenticated_configure_input">D3D11_AUTHENTICATED_CONFIGURE_INPUT</a> structure that contains the command GUID and other data.
     */
    Parameters : D3D11_AUTHENTICATED_CONFIGURE_INPUT

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_authenticated_protection_flags">D3D11_AUTHENTICATED_PROTECTION_FLAGS</a> union that specifies the protection level.
     */
    Protections : D3D11_AUTHENTICATED_PROTECTION_FLAGS

}
