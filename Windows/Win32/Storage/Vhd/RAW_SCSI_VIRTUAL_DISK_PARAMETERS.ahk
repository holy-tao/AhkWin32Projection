#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains raw SCSI virtual disk request parameters.
 * @see https://docs.microsoft.com/windows/win32/api//virtdisk/ns-virtdisk-raw_scsi_virtual_disk_parameters
 * @namespace Windows.Win32.Storage.Vhd
 * @version v4.0.30319
 */
class RAW_SCSI_VIRTUAL_DISK_PARAMETERS extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-raw_scsi_virtual_disk_version">RAW_SCSI_VIRTUAL_DISK_VERSION</a> enumeration that specifies the version of the <b>RAW_SCSI_VIRTUAL_DISK_PARAMETERS</b> structure being passed to or from the VHD functions.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    class _Version1 extends Win32Struct {
        static sizeof => 40
        static packingSize => 8

        /**
         * @type {BOOL}
         */
        RSVDHandle {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        DataIn {
            get => NumGet(this, 4, "char")
            set => NumPut("char", value, this, 4)
        }
    
        /**
         * @type {Integer}
         */
        CdbLength {
            get => NumGet(this, 5, "char")
            set => NumPut("char", value, this, 5)
        }
    
        /**
         * @type {Integer}
         */
        SenseInfoLength {
            get => NumGet(this, 6, "char")
            set => NumPut("char", value, this, 6)
        }
    
        /**
         * @type {Integer}
         */
        SrbFlags {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    
        /**
         * @type {Integer}
         */
        DataTransferLength {
            get => NumGet(this, 12, "uint")
            set => NumPut("uint", value, this, 12)
        }
    
        /**
         * @type {Pointer<Void>}
         */
        DataBuffer {
            get => NumGet(this, 16, "ptr")
            set => NumPut("ptr", value, this, 16)
        }
    
        /**
         * @type {Pointer<Integer>}
         */
        SenseInfo {
            get => NumGet(this, 24, "ptr")
            set => NumPut("ptr", value, this, 24)
        }
    
        /**
         * @type {Pointer<Integer>}
         */
        Cdb {
            get => NumGet(this, 32, "ptr")
            set => NumPut("ptr", value, this, 32)
        }
    
    }

    /**
     * @type {_Version1}
     */
    Version1{
        get {
            if(!this.HasProp("__Version1"))
                this.__Version1 := %this.__Class%._Version1(8, this)
            return this.__Version1
        }
    }
}
