#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class SCM_PD_REINITIALIZE_MEDIA_INPUT extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    class _Options extends Win32Struct {
        static sizeof => 12
        static packingSize => 4

        /**
         * This bitfield backs the following members:
         * - Overwrite
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        Overwrite {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }
    
    }

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {_Options}
     */
    Options{
        get {
            if(!this.HasProp("__Options"))
                this.__Options := %this.__Class%._Options(this.ptr + 8)
            return this.__Options
        }
    }
}
