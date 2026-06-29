#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\SYSTEMTIME.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @charset Unicode
 */
class NTMS_I1_LIBREQUESTINFORMATIONW extends Win32Struct {
    static sizeof => 508

    static packingSize => 4

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
     * @type {Guid}
     */
    PartitionId {
        get {
            if(!this.HasProp("__PartitionId"))
                this.__PartitionId := Guid(12, this)
            return this.__PartitionId
        }
    }

    /**
     * @type {Guid}
     */
    DriveId {
        get {
            if(!this.HasProp("__DriveId"))
                this.__DriveId := Guid(28, this)
            return this.__DriveId
        }
    }

    /**
     * @type {Guid}
     */
    PhysMediaId {
        get {
            if(!this.HasProp("__PhysMediaId"))
                this.__PhysMediaId := Guid(44, this)
            return this.__PhysMediaId
        }
    }

    /**
     * @type {Guid}
     */
    Library {
        get {
            if(!this.HasProp("__Library"))
                this.__Library := Guid(60, this)
            return this.__Library
        }
    }

    /**
     * @type {Guid}
     */
    SlotId {
        get {
            if(!this.HasProp("__SlotId"))
                this.__SlotId := Guid(76, this)
            return this.__SlotId
        }
    }

    /**
     * @type {SYSTEMTIME}
     */
    TimeQueued {
        get {
            if(!this.HasProp("__TimeQueued"))
                this.__TimeQueued := SYSTEMTIME(92, this)
            return this.__TimeQueued
        }
    }

    /**
     * @type {SYSTEMTIME}
     */
    TimeCompleted {
        get {
            if(!this.HasProp("__TimeCompleted"))
                this.__TimeCompleted := SYSTEMTIME(108, this)
            return this.__TimeCompleted
        }
    }

    /**
     * @type {String}
     */
    szApplication {
        get => StrGet(this.ptr + 124, 63, "UTF-16")
        set => StrPut(value, this.ptr + 124, 63, "UTF-16")
    }

    /**
     * @type {String}
     */
    szUser {
        get => StrGet(this.ptr + 252, 63, "UTF-16")
        set => StrPut(value, this.ptr + 252, 63, "UTF-16")
    }

    /**
     * @type {String}
     */
    szComputer {
        get => StrGet(this.ptr + 380, 63, "UTF-16")
        set => StrPut(value, this.ptr + 380, 63, "UTF-16")
    }
}
