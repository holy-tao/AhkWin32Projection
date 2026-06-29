#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\D3D11_AUTHENTICATED_CONFIGURE_INPUT.ahk" { D3D11_AUTHENTICATED_CONFIGURE_INPUT }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D11_OMAC.ahk" { D3D11_OMAC }

/**
 * Contains input data for a D3D11_AUTHENTICATED_CONFIGURE_ENCRYPTION_WHEN_ACCESSIBLE command.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_authenticated_configure_accessible_encryption_input
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_AUTHENTICATED_CONFIGURE_ACCESSIBLE_ENCRYPTION_INPUT {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_authenticated_configure_input">D3D11_AUTHENTICATED_CONFIGURE_INPUT</a> structure that contains the command GUID and other data.
     */
    Parameters : D3D11_AUTHENTICATED_CONFIGURE_INPUT

    /**
     * A GUID that specifies the type of encryption to apply.
     */
    EncryptionGuid : Guid

}
