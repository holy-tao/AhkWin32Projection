#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class DISK_SIGNATURE extends Win32Struct {
    static sizeof => 20

    static packingSize => 4

    /**
     * @type {Integer}
     */
    PartitionStyle {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    class _Mbr extends Win32Struct {
        static sizeof => 8
        static packingSize => 4

        /**
         * @type {Integer}
         */
        Signature {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }

        /**
         * @type {Integer}
         */
        CheckSum {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    }

    class _Gpt extends Win32Struct {
        static sizeof => 16
        static packingSize => 4

        /**
         * @type {Guid}
         */
        DiskId {
            get {
                if(!this.HasProp("__DiskId"))
                    this.__DiskId := Guid(0, this)
                return this.__DiskId
            }
        }
    }

    /**
     * @type {_Mbr}
     */
    Mbr {
        get {
            if(!this.HasProp("__Mbr"))
                this.__Mbr := DISK_SIGNATURE._Mbr(4, this)
            return this.__Mbr
        }
    }

    /**
     * @type {_Gpt}
     */
    Gpt {
        get {
            if(!this.HasProp("__Gpt"))
                this.__Gpt := DISK_SIGNATURE._Gpt(4, this)
            return this.__Gpt
        }
    }
}
