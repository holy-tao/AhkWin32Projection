#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
class IO_STOP_ON_SYMLINK_FILTER_ECP_v0 extends Win32Struct {
    static sizeof => 8

    static packingSize => 4

    class _Out extends Win32Struct {
        static sizeof => 8
        static packingSize => 4

        /**
         * @type {Integer}
         */
        ReparseCount {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }

        /**
         * @type {Integer}
         */
        RemainingPathLength {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    }

    /**
     * @type {_Out}
     */
    Out {
        get {
            if(!this.HasProp("__Out"))
                this.__Out := IO_STOP_ON_SYMLINK_FILTER_ECP_v0._Out(0, this)
            return this.__Out
        }
    }
}
