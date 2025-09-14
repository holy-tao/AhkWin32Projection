#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PM_APPTASKTYPE.ahk
#Include .\PM_EXTENSIONCONSUMER.ahk
#Include .\PM_BSATASKID.ahk
#Include .\PM_BWTASKID.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class PM_ENUM_FILTER extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    FilterType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Dummy {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    Genre {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    AppHubType {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    HubType {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    Tasktype {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Pointer<Guid>}
     */
    TaskProductID {
        get => NumGet(this, 4, "ptr")
        set => NumPut("ptr", value, this, 4)
    }

    /**
     * @type {Pointer<Guid>}
     */
    TileProductID {
        get => NumGet(this, 4, "ptr")
        set => NumPut("ptr", value, this, 4)
    }

    /**
     * @type {PM_APPTASKTYPE}
     */
    AppTaskType{
        get {
            if(!this.HasProp("__AppTaskType"))
                this.__AppTaskType := PM_APPTASKTYPE(this.ptr + 4)
            return this.__AppTaskType
        }
    }

    /**
     * @type {PM_EXTENSIONCONSUMER}
     */
    Consumer{
        get {
            if(!this.HasProp("__Consumer"))
                this.__Consumer := PM_EXTENSIONCONSUMER(this.ptr + 4)
            return this.__Consumer
        }
    }

    /**
     * @type {PM_BSATASKID}
     */
    BSATask{
        get {
            if(!this.HasProp("__BSATask"))
                this.__BSATask := PM_BSATASKID(this.ptr + 4)
            return this.__BSATask
        }
    }

    /**
     * @type {Pointer<Guid>}
     */
    BSAProductID {
        get => NumGet(this, 4, "ptr")
        set => NumPut("ptr", value, this, 4)
    }

    /**
     * @type {PM_BWTASKID}
     */
    BWTask{
        get {
            if(!this.HasProp("__BWTask"))
                this.__BWTask := PM_BWTASKID(this.ptr + 4)
            return this.__BWTask
        }
    }

    /**
     * @type {Pointer<BSTR>}
     */
    ProtocolName {
        get => NumGet(this, 4, "ptr")
        set => NumPut("ptr", value, this, 4)
    }

    /**
     * @type {Pointer<BSTR>}
     */
    FileType {
        get => NumGet(this, 4, "ptr")
        set => NumPut("ptr", value, this, 4)
    }

    /**
     * @type {Pointer<BSTR>}
     */
    ContentType {
        get => NumGet(this, 4, "ptr")
        set => NumPut("ptr", value, this, 4)
    }

    /**
     * @type {Pointer<Guid>}
     */
    AppSupportedFileExtPID {
        get => NumGet(this, 4, "ptr")
        set => NumPut("ptr", value, this, 4)
    }

    /**
     * @type {Pointer<BSTR>}
     */
    ShareTargetFileType {
        get => NumGet(this, 4, "ptr")
        set => NumPut("ptr", value, this, 4)
    }
}
