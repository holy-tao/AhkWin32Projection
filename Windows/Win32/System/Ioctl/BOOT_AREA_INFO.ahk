#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the output for the FSCTL_GET_BOOT_AREA_INFO control code.
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-boot_area_info
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class BOOT_AREA_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    class _Anonymous extends Win32Struct {
        static sizeof => 24
        static packingSize => 8

        /**
         * @type {Integer}
         */
        Offset {
            get => NumGet(this, 0, "int64")
            set => NumPut("int64", value, this, 0)
        }
    
    }

    /**
     * Number of elements in the <b>BootSectors</b> array.
     * @type {Integer}
     */
    BootSectorCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A variable length array of structures each containing the following member.
     * @type {Array<Int64>}
     */
    BootSectors{
        get {
            if(!this.HasProp("__BootSectorsProxyArray"))
                this.__BootSectorsProxyArray := Win32FixedArray(this.ptr + 8, 2, Primitive, "int64")
            return this.__BootSectorsProxyArray
        }
    }
}
