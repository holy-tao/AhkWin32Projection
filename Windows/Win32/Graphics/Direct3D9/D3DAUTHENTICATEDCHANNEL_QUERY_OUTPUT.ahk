#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\D3D_OMAC.ahk" { D3D_OMAC }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Contains the response from the IDirect3DAuthenticatedChannel9::Query method.
 * @remarks
 * For the **QueryType**, **hChannel**, and **SequenceNumber** members, the driver uses in the same values that the application provided in the [**D3DAUTHENTICATEDCHANNEL\_QUERY\_INPUT**](d3dauthenticatedchannel-query-input.md) structure. The application should verify that these values match.
 * @see https://learn.microsoft.com/windows/win32/medfound/d3dauthenticatedchannel-query-output
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DAUTHENTICATEDCHANNEL_QUERY_OUTPUT {
    #StructPack 8

    /**
     * A [**D3D\_OMAC**](d3d-omac.md) structure that contains a Message Authentication Code (MAC) of the data. The driver uses AES-based one-key CBC MAC (OMAC) to calculate this value for the block of data that appears after this structure member.
     */
    omac : D3D_OMAC

    /**
     * A GUID that specifies the query. For a list of values, see [Content Protection Queries](content-protection-queries.md).
     */
    QueryType : Guid

    hChannel : HANDLE

    SequenceNumber : UInt32

    /**
     * The result code for the query.
     */
    ReturnCode : HRESULT

}
