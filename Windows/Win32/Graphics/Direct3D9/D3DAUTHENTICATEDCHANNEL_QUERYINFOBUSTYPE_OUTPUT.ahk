#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D_OMAC.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include .\D3DAUTHENTICATEDCHANNEL_QUERY_OUTPUT.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/medfound/d3dauthenticatedchannel-queryinfobustype-output
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DAUTHENTICATEDCHANNEL_QUERYINFOBUSTYPE_OUTPUT extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {D3DAUTHENTICATEDCHANNEL_QUERY_OUTPUT}
     */
    Output{
        get {
            if(!this.HasProp("__Output"))
                this.__Output := D3DAUTHENTICATEDCHANNEL_QUERY_OUTPUT(0, this)
            return this.__Output
        }
    }

    /**
     * @type {Integer}
     */
    BusType {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * @type {BOOL}
     */
    bAccessibleInContiguousBlocks {
        get => NumGet(this, 44, "int")
        set => NumPut("int", value, this, 44)
    }

    /**
     * @type {BOOL}
     */
    bAccessibleInNonContiguousBlocks {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }
}
