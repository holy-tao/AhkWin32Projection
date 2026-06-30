#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3DBUSTYPE.ahk
#Include .\D3D_OMAC.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\D3DAUTHENTICATEDCHANNEL_QUERY_OUTPUT.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include ..\..\Foundation\HRESULT.ahk

/**
 * Contains the response to a D3DAUTHENTICATEDQUERY\_ACCESSIBILITYATTRIBUTES query.
 * @see https://learn.microsoft.com/windows/win32/medfound/d3dauthenticatedchannel-queryinfobustype-output
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
class D3DAUTHENTICATEDCHANNEL_QUERYINFOBUSTYPE_OUTPUT extends Win32Struct {
    static sizeof => 64

    static packingSize => 8

    /**
     * A [**D3DAUTHENTICATEDCHANNEL\_QUERY\_OUTPUT**](d3dauthenticatedchannel-query-output.md) structure that contains a Message Authentication Code (MAC) and other data.
     * @type {D3DAUTHENTICATEDCHANNEL_QUERY_OUTPUT}
     */
    Output {
        get {
            if(!this.HasProp("__Output"))
                this.__Output := D3DAUTHENTICATEDCHANNEL_QUERY_OUTPUT(0, this)
            return this.__Output
        }
    }

    /**
     * A bitwise **OR** of flags from the [**D3DBUSTYPE**](d3dbustype.md) enumeration.
     * @type {D3DBUSTYPE}
     */
    BusType {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * If **TRUE**, contiguous blocks of video memory may be accessible to the CPU or the bus.
     * @type {BOOL}
     */
    bAccessibleInContiguousBlocks {
        get => NumGet(this, 52, "int")
        set => NumPut("int", value, this, 52)
    }

    /**
     * If **TRUE**, non-contiguous blocks of video memory may be accessible to the CPU or the bus.
     * @type {BOOL}
     */
    bAccessibleInNonContiguousBlocks {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }
}
