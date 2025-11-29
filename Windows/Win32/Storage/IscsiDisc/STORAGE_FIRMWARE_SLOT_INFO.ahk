#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 * @version v4.0.30319
 */
class STORAGE_FIRMWARE_SLOT_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    class _Revision_e__Union extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * @type {Array<Byte>}
         */
        Info{
            get {
                if(!this.HasProp("__InfoProxyArray"))
                    this.__InfoProxyArray := Win32FixedArray(this.ptr + 0, 8, Primitive, "char")
                return this.__InfoProxyArray
            }
        }
    
        /**
         * @type {Integer}
         */
        AsUlonglong {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
    }

    /**
     * @type {Integer}
     */
    SlotNumber {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {BOOLEAN}
     */
    ReadOnly {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 2, 6, Primitive, "char")
            return this.__ReservedProxyArray
        }
    }

    /**
     * @type {_Revision_e__Union}
     */
    Revision{
        get {
            if(!this.HasProp("__Revision"))
                this.__Revision := %this.__Class%._Revision_e__Union(8, this)
            return this.__Revision
        }
    }
}
