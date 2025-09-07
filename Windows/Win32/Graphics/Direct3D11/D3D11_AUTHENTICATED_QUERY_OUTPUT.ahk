#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D11_OMAC.ahk

/**
 * Contains a response from the ID3D11VideoContext::QueryAuthenticatedChannel method.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_authenticated_query_output
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_AUTHENTICATED_QUERY_OUTPUT extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_omac">D3D11_OMAC</a> structure that contains a Message Authentication Code (MAC) of the data. The driver uses AESbased one-key CBC MAC (OMAC) to calculate this value for the block of data that appears after this structure member.
     * @type {D3D11_OMAC}
     */
    omac{
        get {
            if(!this.HasProp("__omac"))
                this.__omac := D3D11_OMAC(this.ptr + 0)
            return this.__omac
        }
    }

    /**
     * A GUID that specifies the query. For a list of possible values, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_authenticated_query_input">D3D11_AUTHENTICATED_QUERY_INPUT</a>
     * @type {Pointer<Guid>}
     */
    QueryType {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A handle to the authenticated channel. To get the handle, call the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11authenticatedchannel-getchannelhandle">ID3D11AuthenticatedChannel::GetChannelHandle</a> method.
     * @type {Pointer<Ptr>}
     */
    hChannel {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * The query sequence number.
     * @type {Integer}
     */
    SequenceNumber {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The result code for the query.
     * @type {Integer}
     */
    ReturnCode {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }
}
