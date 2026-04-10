#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
class TCP_OPT_SACK extends Win32Struct {
    static sizeof => 12

    static packingSize => 4

    class tcp_opt_sack_block extends Win32Struct {
        static sizeof => 8
        static packingSize => 4

        /**
         * @type {Integer}
         */
        Left {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }

        /**
         * @type {Integer}
         */
        Right {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    }

    /**
     * @type {Integer}
     */
    Kind {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {tcp_opt_sack_block}
     */
    Block {
        get {
            if(!this.HasProp("__BlockProxyArray"))
                this.__BlockProxyArray := Win32FixedArray(this.ptr + 4, 1, TCP_OPT_SACK.tcp_opt_sack_block, "")
            return this.__BlockProxyArray
        }
    }
}
