#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D11_OMAC.ahk" { D3D11_OMAC }

/**
 * Contains a response from the ID3D11VideoContext::QueryAuthenticatedChannel method.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_authenticated_query_output
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_AUTHENTICATED_QUERY_OUTPUT {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_omac">D3D11_OMAC</a> structure that contains a Message Authentication Code (MAC) of the data. The driver uses AESbased one-key CBC MAC (OMAC) to calculate this value for the block of data that appears after this structure member.
     */
    omac : D3D11_OMAC

    /**
     * A GUID that specifies the query. For a list of possible values, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_authenticated_query_input">D3D11_AUTHENTICATED_QUERY_INPUT</a>
     */
    QueryType : Guid

    /**
     * A handle to the authenticated channel. To get the handle, call the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11authenticatedchannel-getchannelhandle">ID3D11AuthenticatedChannel::GetChannelHandle</a> method.
     */
    hChannel : HANDLE

    /**
     * The query sequence number.
     */
    SequenceNumber : UInt32

    /**
     * The result code for the query.
     */
    ReturnCode : HRESULT

}
