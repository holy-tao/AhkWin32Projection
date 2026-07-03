#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\D3DAUTHENTICATEDCHANNEL_QUERY_OUTPUT.ahk" { D3DAUTHENTICATEDCHANNEL_QUERY_OUTPUT }
#Import ".\D3D_OMAC.ahk" { D3D_OMAC }

/**
 * Contains the response to a D3DAUTHENTICATEDQUERY\_ENCRYPTIONWHENACCESSIBLEGUID query.
 * @see https://learn.microsoft.com/windows/win32/medfound/d3dauthenticatedchannel-queryevictionencryptionguid-output
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DAUTHENTICATEDCHANNEL_QUERYEVICTIONENCRYPTIONGUID_OUTPUT {
    #StructPack 8

    Output : D3DAUTHENTICATEDCHANNEL_QUERY_OUTPUT

    /**
     * **D3DAUTHENTICATEDCHANNEL\_QUERY\_OUTPUT**
     * 
     * A [**D3DAUTHENTICATEDCHANNEL\_QUERY\_OUTPUT**](d3dauthenticatedchannel-query-output.md) structure that contains a Message Authentication Code (MAC) and other data.
     * 
     * 
     * 
     * The index of the encryption GUID.
     */
    EncryptionGuidIndex : UInt32

    /**
     * A GUID that specifies a supported encryption type.
     */
    EncryptionGuid : Guid

}
