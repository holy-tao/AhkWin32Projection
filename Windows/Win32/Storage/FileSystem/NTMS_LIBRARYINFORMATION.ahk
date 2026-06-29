#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * The NTMS_LIBRARYINFORMATION structure defines properties specific to a library object.
 * @remarks
 * For offline libraries, only <b>LibraryType</b> and <b>dwNumberOfMedia</b> are reported. All other values should be ignored.
 * 
 * The 
 * <b>NTMS_LIBRARYINFORMATION</b> structure is included in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntmsapi/ns-ntmsapi-ntms_objectinformationa">NTMS_OBJECTINFORMATION</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/ntmsapi/ns-ntmsapi-ntms_libraryinformation
 * @namespace Windows.Win32.Storage.FileSystem
 */
class NTMS_LIBRARYINFORMATION extends Win32Struct {
    static sizeof => 128

    static packingSize => 4

    /**
     * @type {Integer}
     */
    LibraryType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * For each library, this represents the slot that was assigned to the cleaner cartridge. If this member is <b>NULL</b>, there is no cleaner slot defined for this library.
     * @type {Guid}
     */
    CleanerSlot {
        get {
            if(!this.HasProp("__CleanerSlot"))
                this.__CleanerSlot := Guid(4, this)
            return this.__CleanerSlot
        }
    }

    /**
     * Represents a libraries' default or preferred cleaner slot. If <b>NULL</b>, there is not a preferred slot.
     * @type {Guid}
     */
    CleanerSlotDefault {
        get {
            if(!this.HasProp("__CleanerSlotDefault"))
                this.__CleanerSlotDefault := Guid(20, this)
            return this.__CleanerSlotDefault
        }
    }

    /**
     * Used by drives that require cleaning under robotics control. If <b>TRUE</b>, automatic drive cleaning operations are enabled.
     * @type {BOOL}
     */
    LibrarySupportsDriveCleaning {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * Returns <b>TRUE</b> if a bar code reader is installed in a library; otherwise returns <b>FALSE</b>.
     * @type {BOOL}
     */
    BarCodeReaderInstalled {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    InventoryMethod {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Number of uses remaining on the cleaner in the library. This member is zero if no cleaner is present or if the library does not support cleaning.
     * @type {Integer}
     */
    dwCleanerUsesRemaining {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Number of the first drive in the library.
     * @type {Integer}
     */
    FirstDriveNumber {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * Number of drives in the library.
     * @type {Integer}
     */
    dwNumberOfDrives {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Number of the first slot in the library.
     * @type {Integer}
     */
    FirstSlotNumber {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * Number of slots in the library.
     * @type {Integer}
     */
    dwNumberOfSlots {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Number of the first access door in the library.
     * @type {Integer}
     */
    FirstDoorNumber {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * Number of access doors in the library.
     * @type {Integer}
     */
    dwNumberOfDoors {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * Number of the first insert/eject port in the library.
     * @type {Integer}
     */
    FirstPortNumber {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * Number of insert/eject ports in the library.
     * @type {Integer}
     */
    dwNumberOfPorts {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * Number of the first changer in the library.
     * @type {Integer}
     */
    FirstChangerNumber {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * Number of changers in the library.
     * @type {Integer}
     */
    dwNumberOfChangers {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * Number of media in the online or offline library.
     * @type {Integer}
     */
    dwNumberOfMedia {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }

    /**
     * Number of media types supported by the library.
     * @type {Integer}
     */
    dwNumberOfMediaTypes {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * Number of current library requests.
     * @type {Integer}
     */
    dwNumberOfLibRequests {
        get => NumGet(this, 100, "uint")
        set => NumPut("uint", value, this, 100)
    }

    /**
     * Reserved.
     * @type {Guid}
     */
    Reserved {
        get {
            if(!this.HasProp("__Reserved"))
                this.__Reserved := Guid(104, this)
            return this.__Reserved
        }
    }

    /**
     * If this member is <b>TRUE</b>, a full inventory will be performed if a mount fails. The failure may be either hardware or label mismatch. For ATAPI CD libraries, this parameter cannot be disabled. The default is <b>TRUE</b>. Large library owners should disable this feature.
     * @type {BOOL}
     */
    AutoRecovery {
        get => NumGet(this, 120, "int")
        set => NumPut("int", value, this, 120)
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 124, "uint")
        set => NumPut("uint", value, this, 124)
    }
}
