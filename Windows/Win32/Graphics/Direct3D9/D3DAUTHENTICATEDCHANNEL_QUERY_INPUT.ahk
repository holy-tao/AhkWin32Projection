#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Contains input data for the IDirect3DAuthenticatedChannel9::Query method.
 * @see https://learn.microsoft.com/windows/win32/medfound/d3dauthenticatedchannel-query-input
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DAUTHENTICATEDCHANNEL_QUERY_INPUT {
    #StructPack 8

    /**
     * A GUID that specifies the query. For a list of values, see [Content Protection Queries](content-protection-queries.md).
     */
    QueryType : Guid

    hChannel : HANDLE

    SequenceNumber : UInt32

}
