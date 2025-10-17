#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class FILE_LAYOUT_INFO_ENTRY extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    class _BasicInformation extends Win32Struct {
        static sizeof => 64
        static packingSize => 8

        /**
         * @type {Integer}
         */
        CreationTime {
            get => NumGet(this, 0, "int64")
            set => NumPut("int64", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        LastAccessTime {
            get => NumGet(this, 8, "int64")
            set => NumPut("int64", value, this, 8)
        }
    
        /**
         * @type {Integer}
         */
        LastWriteTime {
            get => NumGet(this, 16, "int64")
            set => NumPut("int64", value, this, 16)
        }
    
        /**
         * @type {Integer}
         */
        ChangeTime {
            get => NumGet(this, 24, "int64")
            set => NumPut("int64", value, this, 24)
        }
    
        /**
         * @type {Integer}
         */
        FileAttributes {
            get => NumGet(this, 32, "uint")
            set => NumPut("uint", value, this, 32)
        }
    
    }

    /**
     * @type {_BasicInformation}
     */
    BasicInformation{
        get {
            if(!this.HasProp("__BasicInformation"))
                this.__BasicInformation := %this.__Class%._BasicInformation(0, this)
            return this.__BasicInformation
        }
    }

    /**
     * @type {Integer}
     */
    OwnerId {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    SecurityId {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * @type {Integer}
     */
    Usn {
        get => NumGet(this, 48, "int64")
        set => NumPut("int64", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    StorageReserveId {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }
}
