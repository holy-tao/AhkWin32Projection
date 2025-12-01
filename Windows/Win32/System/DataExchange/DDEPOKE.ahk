#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the data, and information about the data, sent as part of a WM_DDE_POKE message.
 * @see https://learn.microsoft.com/windows/win32/api/dde/ns-dde-ddepoke
 * @namespace Windows.Win32.System.DataExchange
 * @version v4.0.30319
 */
class DDEPOKE extends Win32Struct
{
    static sizeof => 6

    static packingSize => 2

    /**
     * This bitfield backs the following members:
     * - unused
     * - fRelease
     * - fReserved
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Type: <b>unsigned short</b>
     * 
     * Unused.
     * @type {Integer}
     */
    unused {
        get => (this._bitfield >> 0) & 0x1FFF
        set => this._bitfield := ((value & 0x1FFF) << 0) | (this._bitfield & ~(0x1FFF << 0))
    }

    /**
     * Type: <b>unsigned short</b>
     * 
     * Indicates whether the application receiving the <a href="https://docs.microsoft.com/windows/desktop/dataxchg/wm-dde-poke">WM_DDE_POKE</a> message should free the data. If this value is nonzero, the application should free the data.
     * @type {Integer}
     */
    fRelease {
        get => (this._bitfield >> 13) & 0x1
        set => this._bitfield := ((value & 0x1) << 13) | (this._bitfield & ~(0x1 << 13))
    }

    /**
     * Type: <b>unsigned short</b>
     * 
     * Reserved.
     * @type {Integer}
     */
    fReserved {
        get => (this._bitfield >> 14) & 0x3
        set => this._bitfield := ((value & 0x3) << 14) | (this._bitfield & ~(0x3 << 14))
    }

    /**
     * Type: <b>short</b>
     * 
     * The format of the data. The format should be a standard or registered clipboard format. The following standard clipboard formats can be used:
     * @type {Integer}
     */
    cfFormat {
        get => NumGet(this, 2, "short")
        set => NumPut("short", value, this, 2)
    }

    /**
     * Type: <b>BYTE[1]</b>
     * 
     * Contains the data. The length and type of data depend on the value of the 
     * 					<b>cfFormat</b> member.
     * @type {Array<Byte>}
     */
    Value{
        get {
            if(!this.HasProp("__ValueProxyArray"))
                this.__ValueProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "char")
            return this.__ValueProxyArray
        }
    }
}
