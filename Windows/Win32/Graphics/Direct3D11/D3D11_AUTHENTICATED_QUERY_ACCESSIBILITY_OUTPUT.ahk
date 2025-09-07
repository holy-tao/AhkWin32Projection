#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D11_OMAC.ahk
#Include .\D3D11_AUTHENTICATED_QUERY_OUTPUT.ahk

/**
 * Contains the response to a D3D11_AUTHENTICATED_QUERY_ACCESSIBILITY_ATTRIBUTES query.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_authenticated_query_accessibility_output
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_AUTHENTICATED_QUERY_ACCESSIBILITY_OUTPUT extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_authenticated_query_output">D3D11_AUTHENTICATED_QUERY_OUTPUT</a> structure that contains a Message Authentication Code (MAC) and other data.
     * @type {D3D11_AUTHENTICATED_QUERY_OUTPUT}
     */
    Output{
        get {
            if(!this.HasProp("__Output"))
                this.__Output := D3D11_AUTHENTICATED_QUERY_OUTPUT(this.ptr + 0)
            return this.__Output
        }
    }

    /**
     * A bitwise <b>OR</b> of flags from the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_bus_type">D3D11_BUS_TYPE</a> enumeration.
     * @type {Integer}
     */
    BusType {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * If <b>TRUE</b>, contiguous blocks of video memory may be accessible to the CPU or the bus.
     * @type {Integer}
     */
    AccessibleInContiguousBlocks {
        get => NumGet(this, 44, "int")
        set => NumPut("int", value, this, 44)
    }

    /**
     * If <b>TRUE</b>, non-contiguous blocks of video memory may be accessible to the CPU or the bus.
     * @type {Integer}
     */
    AccessibleInNonContiguousBlocks {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }
}
