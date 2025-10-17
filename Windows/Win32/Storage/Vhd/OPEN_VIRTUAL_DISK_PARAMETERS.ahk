#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains virtual disk open request parameters.
 * @see https://docs.microsoft.com/windows/win32/api//virtdisk/ns-virtdisk-open_virtual_disk_parameters
 * @namespace Windows.Win32.Storage.Vhd
 * @version v4.0.30319
 */
class OPEN_VIRTUAL_DISK_PARAMETERS extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * An <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-open_virtual_disk_version">OPEN_VIRTUAL_DISK_VERSION</a> enumeration 
     *       that specifies the version of the 
     *       <b>OPEN_VIRTUAL_DISK_PARAMETERS</b> structure 
     *       being passed to or from the VHD functions.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="OPEN_VIRTUAL_DISK_VERSION_1"></a><a id="open_virtual_disk_version_1"></a><dl>
     * <dt><b>OPEN_VIRTUAL_DISK_VERSION_1</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use the <b>Version1</b> member of this structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="OPEN_VIRTUAL_DISK_VERSION_2"></a><a id="open_virtual_disk_version_2"></a><dl>
     * <dt><b>OPEN_VIRTUAL_DISK_VERSION_2</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use the <b>Version2</b> member of this structure.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    class _Version1 extends Win32Struct {
        static sizeof => 24
        static packingSize => 8

        /**
         * @type {Integer}
         */
        RWDepth {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
    }

    class _Version2 extends Win32Struct {
        static sizeof => 24
        static packingSize => 8

        /**
         * @type {BOOL}
         */
        GetInfoOnly {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }
    
        /**
         * @type {BOOL}
         */
        ReadOnly {
            get => NumGet(this, 4, "int")
            set => NumPut("int", value, this, 4)
        }
    
        /**
         * @type {Pointer<Guid>}
         */
        ResiliencyGuid {
            get => NumGet(this, 8, "ptr")
            set => NumPut("ptr", value, this, 8)
        }
    
    }

    class _Version3 extends Win32Struct {
        static sizeof => 24
        static packingSize => 8

        /**
         * @type {BOOL}
         */
        GetInfoOnly {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }
    
        /**
         * @type {BOOL}
         */
        ReadOnly {
            get => NumGet(this, 4, "int")
            set => NumPut("int", value, this, 4)
        }
    
        /**
         * @type {Pointer<Guid>}
         */
        ResiliencyGuid {
            get => NumGet(this, 8, "ptr")
            set => NumPut("ptr", value, this, 8)
        }
    
        /**
         * @type {Pointer<Guid>}
         */
        SnapshotId {
            get => NumGet(this, 16, "ptr")
            set => NumPut("ptr", value, this, 16)
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

    /**
     * @type {_Version3}
     */
    Version3{
        get {
            if(!this.HasProp("__Version3"))
                this.__Version3 := %this.__Class%._Version3(8, this)
            return this.__Version3
        }
    }
}
