#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\D3DAUTHENTICATEDCHANNEL_QUERY_OUTPUT.ahk" { D3DAUTHENTICATEDCHANNEL_QUERY_OUTPUT }
#Import ".\D3DAUTHENTICATEDCHANNEL_PROTECTION_FLAGS.ahk" { D3DAUTHENTICATEDCHANNEL_PROTECTION_FLAGS }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\D3D_OMAC.ahk" { D3D_OMAC }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Contains the response to a D3DAUTHENTICATEDQUERY\_PROTECTION query.
 * @see https://learn.microsoft.com/windows/win32/medfound/d3dauthenticatedchannel-queryprotection-output
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DAUTHENTICATEDCHANNEL_QUERYPROTECTION_OUTPUT {
    #StructPack 8

    /**
     * A [**D3DAUTHENTICATEDCHANNEL\_QUERY\_OUTPUT**](d3dauthenticatedchannel-query-output.md) structure that contains a Message Authentication Code (MAC) and other data.
     */
    Output : D3DAUTHENTICATEDCHANNEL_QUERY_OUTPUT

    /**
     * A [**D3DAUTHENTICATEDCHANNEL\_PROTECTION\_FLAGS**](d3dauthenticatedchannel-protection-flags.md) structure that specifies the protection level.
     */
    ProtectionFlags : D3DAUTHENTICATEDCHANNEL_PROTECTION_FLAGS

}
