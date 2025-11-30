#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class DISK_SIGNATURE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

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
        static sizeof => 8
        static packingSize => 8

        /**
         * @type {Pointer<Guid>}
         */
        DiskId {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
    }

    /**
     * @type {_Mbr}
     */
    Mbr{
        get {
            if(!this.HasProp("__Mbr"))
                this.__Mbr := %this.__Class%._Mbr(8, this)
            return this.__Mbr
        }
    }

    /**
     * @type {_Gpt}
     */
    Gpt{
        get {
            if(!this.HasProp("__Gpt"))
                this.__Gpt := %this.__Class%._Gpt(8, this)
            return this.__Gpt
        }
    }
}
