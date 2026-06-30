#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\SET_VIRTUAL_DISK_INFO_VERSION.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * Contains virtual hard disk (VHD) information to use when you call the SetVirtualDiskInformation function to set VHD properties.
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-set_virtual_disk_info
 * @namespace Windows.Win32.Storage.Vhd
 */
class SET_VIRTUAL_DISK_INFO extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-set_virtual_disk_info_version">SET_VIRTUAL_DISK_INFO_VERSION</a> 
     *       enumeration that specifies the version of the 
     *       <b>SET_VIRTUAL_DISK_INFO</b> structure being passed to or 
     *       from the VHD functions. This determines the type of information set.
     * @type {SET_VIRTUAL_DISK_INFO_VERSION}
     */
    Version {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    class _ParentPathWithDepthInfo extends Win32Struct {
        static sizeof => 16
        static packingSize => 8

        /**
         * @type {Integer}
         */
        ChildDepth {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }

        /**
         * @type {PWSTR}
         */
        ParentFilePath {
            get => NumGet(this, 8, "ptr")
            set => NumPut("ptr", value, this, 8)
        }
    }

    class _ParentLocator extends Win32Struct {
        static sizeof => 24
        static packingSize => 8

        /**
         * @type {Guid}
         */
        LinkageId {
            get {
                if(!this.HasProp("__LinkageId"))
                    this.__LinkageId := Guid(0, this)
                return this.__LinkageId
            }
        }

        /**
         * @type {PWSTR}
         */
        ParentFilePath {
            get => NumGet(this, 16, "ptr")
            set => NumPut("ptr", value, this, 16)
        }
    }

    /**
     * @type {PWSTR}
     */
    ParentFilePath {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Guid}
     */
    UniqueIdentifier {
        get {
            if(!this.HasProp("__UniqueIdentifier"))
                this.__UniqueIdentifier := Guid(8, this)
            return this.__UniqueIdentifier
        }
    }

    /**
     * @type {_ParentPathWithDepthInfo}
     */
    ParentPathWithDepthInfo {
        get {
            if(!this.HasProp("__ParentPathWithDepthInfo"))
                this.__ParentPathWithDepthInfo := SET_VIRTUAL_DISK_INFO._ParentPathWithDepthInfo(8, this)
            return this.__ParentPathWithDepthInfo
        }
    }

    /**
     * @type {Integer}
     */
    VhdPhysicalSectorSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Guid}
     */
    VirtualDiskId {
        get {
            if(!this.HasProp("__VirtualDiskId"))
                this.__VirtualDiskId := Guid(8, this)
            return this.__VirtualDiskId
        }
    }

    /**
     * @type {BOOL}
     */
    ChangeTrackingEnabled {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {_ParentLocator}
     */
    ParentLocator {
        get {
            if(!this.HasProp("__ParentLocator"))
                this.__ParentLocator := SET_VIRTUAL_DISK_INFO._ParentLocator(8, this)
            return this.__ParentLocator
        }
    }
}
