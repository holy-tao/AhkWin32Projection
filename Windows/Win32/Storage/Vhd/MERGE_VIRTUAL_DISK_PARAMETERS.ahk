#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains virtual hard disk (VHD) merge request parameters.
 * @remarks
 * The depth of a merge request specified by the <b>MergeDepth</b> member is the number of  
 *     parent VHD image files in the differencing chain to be merged.  For more information, see 
 *     <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/nf-virtdisk-mergevirtualdisk">MergeVirtualDisk</a>.
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-merge_virtual_disk_parameters
 * @namespace Windows.Win32.Storage.Vhd
 * @version v4.0.30319
 */
class MERGE_VIRTUAL_DISK_PARAMETERS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-merge_virtual_disk_version">MERGE_VIRTUAL_DISK_VERSION</a> enumeration 
     *       that specifies the version of the 
     *       <b>MERGE_VIRTUAL_DISK_PARAMETERS</b> structure 
     *       being passed to or from the VHD functions.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    class _Version1 extends Win32Struct {
        static sizeof => 4
        static packingSize => 4

        /**
         * @type {Integer}
         */
        MergeDepth {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
    }

    class _Version2 extends Win32Struct {
        static sizeof => 8
        static packingSize => 4

        /**
         * @type {Integer}
         */
        MergeSourceDepth {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        MergeTargetDepth {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
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

    /**
     * @type {_Version2}
     */
    Version2{
        get {
            if(!this.HasProp("__Version2"))
                this.__Version2 := %this.__Class%._Version2(8, this)
            return this.__Version2
        }
    }
}
