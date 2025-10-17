#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PM_APPTASKTYPE.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\PM_EXTENSIONCONSUMER.ahk
#Include .\PM_BSATASKID.ahk
#Include .\PM_BWTASKID.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class PM_ENUM_FILTER extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

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
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Genre {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    AppHubType {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    HubType {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Tasktype {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Pointer<Guid>}
     */
    TaskProductID {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<Guid>}
     */
    TileProductID {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {PM_APPTASKTYPE}
     */
    AppTaskType{
        get {
            if(!this.HasProp("__AppTaskType"))
                this.__AppTaskType := PM_APPTASKTYPE(8, this)
            return this.__AppTaskType
        }
    }

    /**
     * @type {PM_EXTENSIONCONSUMER}
     */
    Consumer{
        get {
            if(!this.HasProp("__Consumer"))
                this.__Consumer := PM_EXTENSIONCONSUMER(8, this)
            return this.__Consumer
        }
    }

    /**
     * @type {PM_BSATASKID}
     */
    BSATask{
        get {
            if(!this.HasProp("__BSATask"))
                this.__BSATask := PM_BSATASKID(8, this)
            return this.__BSATask
        }
    }

    /**
     * @type {Pointer<Guid>}
     */
    BSAProductID {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {PM_BWTASKID}
     */
    BWTask{
        get {
            if(!this.HasProp("__BWTask"))
                this.__BWTask := PM_BWTASKID(8, this)
            return this.__BWTask
        }
    }

    /**
     * @type {BSTR}
     */
    ProtocolName{
        get {
            if(!this.HasProp("__ProtocolName"))
                this.__ProtocolName := BSTR(8, this)
            return this.__ProtocolName
        }
    }

    /**
     * @type {BSTR}
     */
    FileType{
        get {
            if(!this.HasProp("__FileType"))
                this.__FileType := BSTR(8, this)
            return this.__FileType
        }
    }

    /**
     * @type {BSTR}
     */
    ContentType{
        get {
            if(!this.HasProp("__ContentType"))
                this.__ContentType := BSTR(8, this)
            return this.__ContentType
        }
    }

    /**
     * @type {Pointer<Guid>}
     */
    AppSupportedFileExtPID {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {BSTR}
     */
    ShareTargetFileType{
        get {
            if(!this.HasProp("__ShareTargetFileType"))
                this.__ShareTargetFileType := BSTR(8, this)
            return this.__ShareTargetFileType
        }
    }
}
