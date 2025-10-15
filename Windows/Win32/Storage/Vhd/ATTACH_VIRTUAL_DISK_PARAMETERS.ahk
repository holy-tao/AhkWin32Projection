#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains virtual hard disk (VHD) attach request parameters.
 * @see https://docs.microsoft.com/windows/win32/api//virtdisk/ns-virtdisk-attach_virtual_disk_parameters
 * @namespace Windows.Win32.Storage.Vhd
 * @version v4.0.30319
 */
class ATTACH_VIRTUAL_DISK_PARAMETERS extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-attach_virtual_disk_version">ATTACH_VIRTUAL_DISK_VERSION</a> 
     *      enumeration that specifies the version of the 
     *      <b>ATTACH_VIRTUAL_DISK_PARAMETERS</b> 
     *      structure being passed to or from the VHD functions.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    class _Version1 extends Win32Struct {
        static sizeof => 16
        static packingSize => 8

        /**
         * @type {Integer}
         */
        Reserved {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
    }

    class _Version2 extends Win32Struct {
        static sizeof => 16
        static packingSize => 8

        /**
         * @type {Integer}
         */
        RestrictedOffset {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        RestrictedLength {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    
    }

    /**
     * @type {_Version1}
     */
    Version1{
        get {
            if(!this.HasProp("__Version1"))
                this.__Version1 := %this.__Class%._Version1(this.ptr + 8)
            return this.__Version1
        }
    }

    /**
     * @type {_Version2}
     */
    Version2{
        get {
            if(!this.HasProp("__Version2"))
                this.__Version2 := %this.__Class%._Version2(this.ptr + 8)
            return this.__Version2
        }
    }
}
