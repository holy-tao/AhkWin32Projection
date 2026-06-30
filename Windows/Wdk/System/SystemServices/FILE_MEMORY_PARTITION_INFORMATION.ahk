#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class FILE_MEMORY_PARTITION_INFORMATION extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    class _Flags extends Win32Struct {
        static sizeof => 4
        static packingSize => 4

        /**
         * @type {Integer}
         */
        NoCrossPartitionAccess {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }

        /**
         * @type {Array<Integer>}
         */
        Spare {
            get {
                if(!this.HasProp("__SpareProxyArray"))
                    this.__SpareProxyArray := Win32FixedArray(this.ptr + 1, 3, Primitive, "char")
                return this.__SpareProxyArray
            }
        }

        /**
         * @type {Integer}
         */
        AllFlags {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    }

    /**
     * @type {Pointer}
     */
    OwnerPartitionHandle {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {_Flags}
     */
    Flags {
        get {
            if(!this.HasProp("__Flags"))
                this.__Flags := FILE_MEMORY_PARTITION_INFORMATION._Flags(8, this)
            return this.__Flags
        }
    }
}
