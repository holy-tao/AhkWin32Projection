#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class NTMS_I1_LIBRARYINFORMATION extends Win32Struct {
    static sizeof => 120

    static packingSize => 4

    /**
     * @type {Integer}
     */
    LibraryType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
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
     * @type {BOOL}
     */
    LibrarySupportsDriveCleaning {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
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
     * @type {Integer}
     */
    dwCleanerUsesRemaining {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    FirstDriveNumber {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * @type {Integer}
     */
    dwNumberOfDrives {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    FirstSlotNumber {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * @type {Integer}
     */
    dwNumberOfSlots {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    FirstDoorNumber {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * @type {Integer}
     */
    dwNumberOfDoors {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    FirstPortNumber {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * @type {Integer}
     */
    dwNumberOfPorts {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * @type {Integer}
     */
    FirstChangerNumber {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * @type {Integer}
     */
    dwNumberOfChangers {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * @type {Integer}
     */
    dwNumberOfMedia {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }

    /**
     * @type {Integer}
     */
    dwNumberOfMediaTypes {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * @type {Integer}
     */
    dwNumberOfLibRequests {
        get => NumGet(this, 100, "uint")
        set => NumPut("uint", value, this, 100)
    }

    /**
     * @type {Guid}
     */
    Reserved {
        get {
            if(!this.HasProp("__Reserved"))
                this.__Reserved := Guid(104, this)
            return this.__Reserved
        }
    }
}
