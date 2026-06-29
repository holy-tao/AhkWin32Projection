#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * Contains input data for the IDirect3DAuthenticatedChannel9::Query method.
 * @see https://learn.microsoft.com/windows/win32/medfound/d3dauthenticatedchannel-query-input
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
class D3DAUTHENTICATEDCHANNEL_QUERY_INPUT extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * A GUID that specifies the query. For a list of values, see [Content Protection Queries](content-protection-queries.md).
     * @type {Guid}
     */
    QueryType {
        get {
            if(!this.HasProp("__QueryType"))
                this.__QueryType := Guid(0, this)
            return this.__QueryType
        }
    }

    /**
     * @type {HANDLE}
     */
    hChannel {
        get {
            if(!this.HasProp("__hChannel"))
                this.__hChannel := HANDLE(16, this)
            return this.__hChannel
        }
    }

    /**
     * @type {Integer}
     */
    SequenceNumber {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
