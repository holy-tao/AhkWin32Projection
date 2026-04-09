#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\RESIZE_VIRTUAL_DISK_VERSION.ahk

/**
 * Contains the parameters for a ResizeVirtualDisk function.
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-resize_virtual_disk_parameters
 * @namespace Windows.Win32.Storage.Vhd
 */
class RESIZE_VIRTUAL_DISK_PARAMETERS extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * Discriminant for the union containing a value enumerated from the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/virtdisk/ne-virtdisk-resize_virtual_disk_version">RESIZE_VIRTUAL_DISK_VERSION</a> 
     *       enumeration.
     * @type {RESIZE_VIRTUAL_DISK_VERSION}
     */
    Version {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    class _Version1 extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * @type {Integer}
         */
        NewSize {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    }

    /**
     * @type {_Version1}
     */
    Version1 {
        get {
            if(!this.HasProp("__Version1"))
                this.__Version1 := RESIZE_VIRTUAL_DISK_PARAMETERS._Version1(8, this)
            return this.__Version1
        }
    }
}
