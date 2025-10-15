#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D_OMAC.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include .\D3DAUTHENTICATEDCHANNEL_QUERY_OUTPUT.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
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
                this.__Output := D3DAUTHENTICATEDCHANNEL_QUERY_OUTPUT(this.ptr + 0)
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
    bAccessibleInContiguousBlocks{
        get {
            if(!this.HasProp("__bAccessibleInContiguousBlocks"))
                this.__bAccessibleInContiguousBlocks := BOOL(this.ptr + 44)
            return this.__bAccessibleInContiguousBlocks
        }
    }

    /**
     * @type {BOOL}
     */
    bAccessibleInNonContiguousBlocks{
        get {
            if(!this.HasProp("__bAccessibleInNonContiguousBlocks"))
                this.__bAccessibleInNonContiguousBlocks := BOOL(this.ptr + 48)
            return this.__bAccessibleInNonContiguousBlocks
        }
    }
}
