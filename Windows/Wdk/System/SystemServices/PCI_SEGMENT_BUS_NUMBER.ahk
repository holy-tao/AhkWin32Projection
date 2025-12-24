#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class PCI_SEGMENT_BUS_NUMBER extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    class _u_e__Union extends Win32Struct {
        static sizeof => 4
        static packingSize => 4

        class _bits extends Win32Struct {
            static sizeof => 4
            static packingSize => 4
    
            /**
             * This bitfield backs the following members:
             * - BusNumber
             * - SegmentNumber
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
            BusNumber {
                get => (this._bitfield >> 0) & 0xFF
                set => this._bitfield := ((value & 0xFF) << 0) | (this._bitfield & ~(0xFF << 0))
            }
        
            /**
             * @type {Integer}
             */
            SegmentNumber {
                get => (this._bitfield >> 8) & 0xFFFF
                set => this._bitfield := ((value & 0xFFFF) << 8) | (this._bitfield & ~(0xFFFF << 8))
            }
        
        }
    
        /**
         * @type {_bits}
         */
        bits{
            get {
                if(!this.HasProp("__bits"))
                    this.__bits := %this.__Class%._bits(0, this)
                return this.__bits
            }
        }
    
        /**
         * @type {Integer}
         */
        AsULONG {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
    }

    /**
     * @type {_u_e__Union}
     */
    u{
        get {
            if(!this.HasProp("__u"))
                this.__u := %this.__Class%._u_e__Union(0, this)
            return this.__u
        }
    }
}
