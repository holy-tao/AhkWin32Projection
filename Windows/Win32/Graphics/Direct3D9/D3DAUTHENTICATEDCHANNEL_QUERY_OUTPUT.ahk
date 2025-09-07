#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D_OMAC.ahk

/**
 * Contains the response from the IDirect3DAuthenticatedChannel9::Query method.
 * @remarks
 * For the **QueryType**, **hChannel**, and **SequenceNumber** members, the driver uses in the same values that the application provided in the [**D3DAUTHENTICATEDCHANNEL\_QUERY\_INPUT**](d3dauthenticatedchannel-query-input.md) structure. The application should verify that these values match.
 * @see https://learn.microsoft.com/windows/win32/medfound/d3dauthenticatedchannel-query-output
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DAUTHENTICATEDCHANNEL_QUERY_OUTPUT extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * A [**D3D\_OMAC**](d3d-omac.md) structure that contains a Message Authentication Code (MAC) of the data. The driver uses AES-based one-key CBC MAC (OMAC) to calculate this value for the block of data that appears after this structure member.
     * @type {D3D_OMAC}
     */
    omac{
        get {
            if(!this.HasProp("__omac"))
                this.__omac := D3D_OMAC(this.ptr + 0)
            return this.__omac
        }
    }

    /**
     * A GUID that specifies the query. For a list of values, see [Content Protection Queries](content-protection-queries.md).
     * @type {Pointer<Guid>}
     */
    QueryType {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    hChannel {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
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
