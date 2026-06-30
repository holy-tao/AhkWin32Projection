#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PM_TILE_HUBTYPE.ahk
#Include .\PM_APPTASKTYPE.ahk
#Include .\PM_BWTASKID.ahk
#Include .\PM_APP_GENRE.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\PM_APPLICATION_HUBTYPE.ahk
#Include .\PM_TASK_TYPE.ahk
#Include .\PM_EXTENSIONCONSUMER.ahk
#Include .\PM_BSATASKID.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class PM_ENUM_FILTER extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    class _FilterParameter extends Win32Struct {
        static sizeof => 24
        static packingSize => 8

        /**
         * @type {Integer}
         */
        Dummy {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }

        /**
         * @type {PM_APP_GENRE}
         */
        Genre {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }

        /**
         * @type {PM_APPLICATION_HUBTYPE}
         */
        AppHubType {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }

        /**
         * @type {PM_TILE_HUBTYPE}
         */
        HubType {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }

        /**
         * @type {PM_TASK_TYPE}
         */
        Tasktype {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }

        /**
         * @type {Guid}
         */
        TaskProductID {
            get {
                if(!this.HasProp("__TaskProductID"))
                    this.__TaskProductID := Guid(0, this)
                return this.__TaskProductID
            }
        }

        /**
         * @type {Guid}
         */
        TileProductID {
            get {
                if(!this.HasProp("__TileProductID"))
                    this.__TileProductID := Guid(0, this)
                return this.__TileProductID
            }
        }

        /**
         * @type {PM_APPTASKTYPE}
         */
        AppTaskType {
            get {
                if(!this.HasProp("__AppTaskType"))
                    this.__AppTaskType := PM_APPTASKTYPE(0, this)
                return this.__AppTaskType
            }
        }

        /**
         * @type {PM_EXTENSIONCONSUMER}
         */
        Consumer {
            get {
                if(!this.HasProp("__Consumer"))
                    this.__Consumer := PM_EXTENSIONCONSUMER(0, this)
                return this.__Consumer
            }
        }

        /**
         * @type {PM_BSATASKID}
         */
        BSATask {
            get {
                if(!this.HasProp("__BSATask"))
                    this.__BSATask := PM_BSATASKID(0, this)
                return this.__BSATask
            }
        }

        /**
         * @type {Guid}
         */
        BSAProductID {
            get {
                if(!this.HasProp("__BSAProductID"))
                    this.__BSAProductID := Guid(0, this)
                return this.__BSAProductID
            }
        }

        /**
         * @type {PM_BWTASKID}
         */
        BWTask {
            get {
                if(!this.HasProp("__BWTask"))
                    this.__BWTask := PM_BWTASKID(0, this)
                return this.__BWTask
            }
        }

        /**
         * @type {BSTR}
         */
        ProtocolName {
            get {
                if(!this.HasProp("__ProtocolName"))
                    this.__ProtocolName := BSTR(0, this)
                return this.__ProtocolName
            }
        }

        /**
         * @type {BSTR}
         */
        FileType {
            get {
                if(!this.HasProp("__FileType"))
                    this.__FileType := BSTR(0, this)
                return this.__FileType
            }
        }

        /**
         * @type {BSTR}
         */
        ContentType {
            get {
                if(!this.HasProp("__ContentType"))
                    this.__ContentType := BSTR(0, this)
                return this.__ContentType
            }
        }

        /**
         * @type {Guid}
         */
        AppSupportedFileExtPID {
            get {
                if(!this.HasProp("__AppSupportedFileExtPID"))
                    this.__AppSupportedFileExtPID := Guid(0, this)
                return this.__AppSupportedFileExtPID
            }
        }

        /**
         * @type {BSTR}
         */
        ShareTargetFileType {
            get {
                if(!this.HasProp("__ShareTargetFileType"))
                    this.__ShareTargetFileType := BSTR(0, this)
                return this.__ShareTargetFileType
            }
        }
    }

    /**
     * @type {Integer}
     */
    FilterType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {_FilterParameter}
     */
    FilterParameter {
        get {
            if(!this.HasProp("__FilterParameter"))
                this.__FilterParameter := PM_ENUM_FILTER._FilterParameter(8, this)
            return this.__FilterParameter
        }
    }
}
