#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class DIMM_ADDRESS extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    class _Ddr4 extends Win32Struct {
        static sizeof => 24
        static packingSize => 8

        /**
         * This bitfield backs the following members:
         * - SocketId
         * - MemoryControllerId
         * - ChannelId
         * - DimmSlot
         * - DimmRank
         * - Device
         * - ChipSelect
         * - Bank
         * - Dq
         * - Reserved
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        SocketId {
            get => (this._bitfield >> 0) & 0xF
            set => this._bitfield := ((value & 0xF) << 0) | (this._bitfield & ~(0xF << 0))
        }
    
        /**
         * @type {Integer}
         */
        MemoryControllerId {
            get => (this._bitfield >> 4) & 0x3
            set => this._bitfield := ((value & 0x3) << 4) | (this._bitfield & ~(0x3 << 4))
        }
    
        /**
         * @type {Integer}
         */
        ChannelId {
            get => (this._bitfield >> 6) & 0x3
            set => this._bitfield := ((value & 0x3) << 6) | (this._bitfield & ~(0x3 << 6))
        }
    
        /**
         * @type {Integer}
         */
        DimmSlot {
            get => (this._bitfield >> 8) & 0x3
            set => this._bitfield := ((value & 0x3) << 8) | (this._bitfield & ~(0x3 << 8))
        }
    
        /**
         * @type {Integer}
         */
        DimmRank {
            get => (this._bitfield >> 10) & 0x3
            set => this._bitfield := ((value & 0x3) << 10) | (this._bitfield & ~(0x3 << 10))
        }
    
        /**
         * @type {Integer}
         */
        Device {
            get => (this._bitfield >> 12) & 0x1F
            set => this._bitfield := ((value & 0x1F) << 12) | (this._bitfield & ~(0x1F << 12))
        }
    
        /**
         * @type {Integer}
         */
        ChipSelect {
            get => (this._bitfield >> 17) & 0x7
            set => this._bitfield := ((value & 0x7) << 17) | (this._bitfield & ~(0x7 << 17))
        }
    
        /**
         * @type {Integer}
         */
        Bank {
            get => (this._bitfield >> 20) & 0xFF
            set => this._bitfield := ((value & 0xFF) << 20) | (this._bitfield & ~(0xFF << 20))
        }
    
        /**
         * @type {Integer}
         */
        Dq {
            get => (this._bitfield >> 28) & 0xF
            set => this._bitfield := ((value & 0xF) << 28) | (this._bitfield & ~(0xF << 28))
        }
    
        /**
         * @type {Integer}
         */
        Row {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    
        /**
         * @type {Integer}
         */
        Column {
            get => NumGet(this, 12, "uint")
            set => NumPut("uint", value, this, 12)
        }
    
        /**
         * @type {Integer}
         */
        Info {
            get => NumGet(this, 16, "uint")
            set => NumPut("uint", value, this, 16)
        }
    
    }

    class _Ddr5 extends Win32Struct {
        static sizeof => 24
        static packingSize => 8

        /**
         * This bitfield backs the following members:
         * - SocketId
         * - MemoryControllerId
         * - ChannelId
         * - SubChannelId
         * - DimmSlot
         * - DimmRank
         * - Device
         * - ChipId
         * - Bank
         * - Dq
         * - Reserved
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        SocketId {
            get => (this._bitfield >> 0) & 0x1F
            set => this._bitfield := ((value & 0x1F) << 0) | (this._bitfield & ~(0x1F << 0))
        }
    
        /**
         * @type {Integer}
         */
        MemoryControllerId {
            get => (this._bitfield >> 5) & 0xF
            set => this._bitfield := ((value & 0xF) << 5) | (this._bitfield & ~(0xF << 5))
        }
    
        /**
         * @type {Integer}
         */
        ChannelId {
            get => (this._bitfield >> 9) & 0x7
            set => this._bitfield := ((value & 0x7) << 9) | (this._bitfield & ~(0x7 << 9))
        }
    
        /**
         * @type {Integer}
         */
        SubChannelId {
            get => (this._bitfield >> 12) & 0x3
            set => this._bitfield := ((value & 0x3) << 12) | (this._bitfield & ~(0x3 << 12))
        }
    
        /**
         * @type {Integer}
         */
        DimmSlot {
            get => (this._bitfield >> 14) & 0x3
            set => this._bitfield := ((value & 0x3) << 14) | (this._bitfield & ~(0x3 << 14))
        }
    
        /**
         * @type {Integer}
         */
        DimmRank {
            get => (this._bitfield >> 16) & 0xF
            set => this._bitfield := ((value & 0xF) << 16) | (this._bitfield & ~(0xF << 16))
        }
    
        /**
         * @type {Integer}
         */
        Device {
            get => (this._bitfield >> 20) & 0x3F
            set => this._bitfield := ((value & 0x3F) << 20) | (this._bitfield & ~(0x3F << 20))
        }
    
        /**
         * @type {Integer}
         */
        ChipId {
            get => (this._bitfield >> 26) & 0xF
            set => this._bitfield := ((value & 0xF) << 26) | (this._bitfield & ~(0xF << 26))
        }
    
        /**
         * @type {Integer}
         */
        Bank {
            get => (this._bitfield >> 30) & 0xFF
            set => this._bitfield := ((value & 0xFF) << 30) | (this._bitfield & ~(0xFF << 30))
        }
    
        /**
         * @type {Integer}
         */
        Dq {
            get => (this._bitfield >> 38) & 0x1F
            set => this._bitfield := ((value & 0x1F) << 38) | (this._bitfield & ~(0x1F << 38))
        }
    
        /**
         * @type {Integer}
         */
        Row {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    
        /**
         * @type {Integer}
         */
        Column {
            get => NumGet(this, 12, "uint")
            set => NumPut("uint", value, this, 12)
        }
    
        /**
         * @type {Integer}
         */
        Info {
            get => NumGet(this, 16, "uint")
            set => NumPut("uint", value, this, 16)
        }
    
    }

    /**
     * @type {_Ddr4}
     */
    Ddr4{
        get {
            if(!this.HasProp("__Ddr4"))
                this.__Ddr4 := %this.__Class%._Ddr4(0, this)
            return this.__Ddr4
        }
    }

    /**
     * @type {_Ddr5}
     */
    Ddr5{
        get {
            if(!this.HasProp("__Ddr5"))
                this.__Ddr5 := %this.__Class%._Ddr5(0, this)
            return this.__Ddr5
        }
    }
}
