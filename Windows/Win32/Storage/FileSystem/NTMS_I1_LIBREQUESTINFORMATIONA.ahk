#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\SYSTEMTIME.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 * @charset ANSI
 */
class NTMS_I1_LIBREQUESTINFORMATIONA extends Win32Struct
{
    static sizeof => 280

    static packingSize => 8

    /**
     * @type {Integer}
     */
    OperationCode {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    OperationOption {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    State {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Pointer<Guid>}
     */
    PartitionId {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<Guid>}
     */
    DriveId {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<Guid>}
     */
    PhysMediaId {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<Guid>}
     */
    Library {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<Guid>}
     */
    SlotId {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {SYSTEMTIME}
     */
    TimeQueued{
        get {
            if(!this.HasProp("__TimeQueued"))
                this.__TimeQueued := SYSTEMTIME(this.ptr + 56)
            return this.__TimeQueued
        }
    }

    /**
     * @type {SYSTEMTIME}
     */
    TimeCompleted{
        get {
            if(!this.HasProp("__TimeCompleted"))
                this.__TimeCompleted := SYSTEMTIME(this.ptr + 72)
            return this.__TimeCompleted
        }
    }

    /**
     * @type {String}
     */
    szApplication {
        get => StrGet(this.ptr + 88, 63, "UTF-8")
        set => StrPut(value, this.ptr + 88, 63, "UTF-8")
    }

    /**
     * @type {String}
     */
    szUser {
        get => StrGet(this.ptr + 152, 63, "UTF-8")
        set => StrPut(value, this.ptr + 152, 63, "UTF-8")
    }

    /**
     * @type {String}
     */
    szComputer {
        get => StrGet(this.ptr + 216, 63, "UTF-8")
        set => StrPut(value, this.ptr + 216, 63, "UTF-8")
    }
}
