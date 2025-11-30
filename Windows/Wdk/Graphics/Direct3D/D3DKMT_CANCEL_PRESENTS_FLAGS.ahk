#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMT_CANCEL_PRESENTS_FLAGS extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    class _ReprogramInterrupt extends Win32Struct {
        static sizeof => 4
        static packingSize => 4

        /**
         * This bitfield backs the following members:
         * - NewVSyncInterruptState
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
        NewVSyncInterruptState {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }
    
    }

    /**
     * @type {_ReprogramInterrupt}
     */
    ReprogramInterrupt{
        get {
            if(!this.HasProp("__ReprogramInterrupt"))
                this.__ReprogramInterrupt := %this.__Class%._ReprogramInterrupt(0, this)
            return this.__ReprogramInterrupt
        }
    }

    /**
     * @type {Integer}
     */
    Value {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
