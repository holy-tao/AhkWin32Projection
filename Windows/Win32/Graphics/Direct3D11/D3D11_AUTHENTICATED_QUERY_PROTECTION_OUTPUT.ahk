#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\D3D11_OMAC.ahk" { D3D11_OMAC }
#Import ".\D3D11_AUTHENTICATED_QUERY_OUTPUT.ahk" { D3D11_AUTHENTICATED_QUERY_OUTPUT }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\D3D11_AUTHENTICATED_PROTECTION_FLAGS.ahk" { D3D11_AUTHENTICATED_PROTECTION_FLAGS }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Contains the response to a D3D11_AUTHENTICATED_QUERY_PROTECTION query.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_authenticated_query_protection_output
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_AUTHENTICATED_QUERY_PROTECTION_OUTPUT {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_authenticated_query_output">D3D11_AUTHENTICATED_QUERY_OUTPUT</a> structure that contains a Message Authentication Code (MAC) and other data.
     */
    Output : D3D11_AUTHENTICATED_QUERY_OUTPUT

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_authenticated_protection_flags">D3D11_AUTHENTICATED_PROTECTION_FLAGS</a> union that specifies the protection level.
     */
    ProtectionFlags : D3D11_AUTHENTICATED_PROTECTION_FLAGS

}
