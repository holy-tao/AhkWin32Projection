#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D_OMAC.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include .\D3DAUTHENTICATEDCHANNEL_QUERY_OUTPUT.ahk

/**
 * Contains the response to a D3DAUTHENTICATEDQUERY\_UNRESTRICTEDPROTECTEDSHAREDRESOURCECOUNT query.
 * @see https://learn.microsoft.com/windows/win32/medfound/d3dauthenticatedchannel-queryunrestrictedprotectedsharedresourcecount-output
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DAUTHENTICATEDCHANNEL_QUERYUNRESTRICTEDPROTECTEDSHAREDRESOURCECOUNT_OUTPUT extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * A [**D3DAUTHENTICATEDCHANNEL\_QUERY\_OUTPUT**](d3dauthenticatedchannel-query-output.md) structure that contains a Message Authentication Code (MAC) and other data.
     * @type {D3DAUTHENTICATEDCHANNEL_QUERY_OUTPUT}
     */
    Output{
        get {
            if(!this.HasProp("__Output"))
                this.__Output := D3DAUTHENTICATEDCHANNEL_QUERY_OUTPUT(this.ptr + 0)
            return this.__Output
        }
    }

    /**
     * The number of protected, shared resources that can be opened by any process without restrictions.
     * @type {Integer}
     */
    NumUnrestrictedProtectedSharedResources {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
