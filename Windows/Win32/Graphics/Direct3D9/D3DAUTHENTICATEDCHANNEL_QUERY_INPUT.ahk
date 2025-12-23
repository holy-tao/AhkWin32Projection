#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * Contains input data for the IDirect3DAuthenticatedChannel9::Query method.
 * @see https://learn.microsoft.com/windows/win32/medfound/d3dauthenticatedchannel-query-input
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DAUTHENTICATEDCHANNEL_QUERY_INPUT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * A GUID that specifies the query. For a list of values, see [Content Protection Queries](content-protection-queries.md).
     * @type {Pointer<Guid>}
     */
    QueryType {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {HANDLE}
     */
    hChannel{
        get {
            if(!this.HasProp("__hChannel"))
                this.__hChannel := HANDLE(8, this)
            return this.__hChannel
        }
    }

    /**
     * @type {Integer}
     */
    SequenceNumber {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
