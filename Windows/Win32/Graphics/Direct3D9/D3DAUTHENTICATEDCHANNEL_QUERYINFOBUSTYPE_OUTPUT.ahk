#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D_OMAC.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include .\D3DAUTHENTICATEDCHANNEL_QUERY_OUTPUT.ahk

/**
 * Contains the response to a D3DAUTHENTICATEDQUERY\_ACCESSIBILITYATTRIBUTES query.
 * @see https://learn.microsoft.com/windows/win32/medfound/d3dauthenticatedchannel-queryinfobustype-output
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DAUTHENTICATEDCHANNEL_QUERYINFOBUSTYPE_OUTPUT extends Win32Struct
{
    static sizeof => 56

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
     * A bitwise **OR** of flags from the [**D3DBUSTYPE**](d3dbustype.md) enumeration.
     * @type {Integer}
     */
    BusType {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * If **TRUE**, contiguous blocks of video memory may be accessible to the CPU or the bus.
     * @type {Integer}
     */
    bAccessibleInContiguousBlocks {
        get => NumGet(this, 44, "int")
        set => NumPut("int", value, this, 44)
    }

    /**
     * If **TRUE**, non-contiguous blocks of video memory may be accessible to the CPU or the bus.
     * @type {Integer}
     */
    bAccessibleInNonContiguousBlocks {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }
}
