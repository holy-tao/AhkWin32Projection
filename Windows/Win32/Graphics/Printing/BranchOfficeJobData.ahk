#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\BranchOfficeJobDataPrinted.ahk
#Include .\BranchOfficeJobDataRendered.ahk
#Include .\BranchOfficeLogOfflineFileFull.ahk
#Include .\BranchOfficeJobDataPipelineFailed.ahk
#Include .\BranchOfficeJobDataError.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\EBranchOfficeJobEventType.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
class BranchOfficeJobData extends Win32Struct {
    static sizeof => 96

    static packingSize => 8

    class _JobInfo extends Win32Struct {
        static sizeof => 88
        static packingSize => 8

        /**
         * @type {BranchOfficeJobDataPrinted}
         */
        LogJobPrinted {
            get {
                if(!this.HasProp("__LogJobPrinted"))
                    this.__LogJobPrinted := BranchOfficeJobDataPrinted(0, this)
                return this.__LogJobPrinted
            }
        }

        /**
         * @type {BranchOfficeJobDataRendered}
         */
        LogJobRendered {
            get {
                if(!this.HasProp("__LogJobRendered"))
                    this.__LogJobRendered := BranchOfficeJobDataRendered(0, this)
                return this.__LogJobRendered
            }
        }

        /**
         * @type {BranchOfficeJobDataError}
         */
        LogJobError {
            get {
                if(!this.HasProp("__LogJobError"))
                    this.__LogJobError := BranchOfficeJobDataError(0, this)
                return this.__LogJobError
            }
        }

        /**
         * @type {BranchOfficeJobDataPipelineFailed}
         */
        LogPipelineFailed {
            get {
                if(!this.HasProp("__LogPipelineFailed"))
                    this.__LogPipelineFailed := BranchOfficeJobDataPipelineFailed(0, this)
                return this.__LogPipelineFailed
            }
        }

        /**
         * @type {BranchOfficeLogOfflineFileFull}
         */
        LogOfflineFileFull {
            get {
                if(!this.HasProp("__LogOfflineFileFull"))
                    this.__LogOfflineFileFull := BranchOfficeLogOfflineFileFull(0, this)
                return this.__LogOfflineFileFull
            }
        }
    }

    /**
     * @type {EBranchOfficeJobEventType}
     */
    eEventType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    JobId {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {_JobInfo}
     */
    JobInfo {
        get {
            if(!this.HasProp("__JobInfo"))
                this.__JobInfo := BranchOfficeJobData._JobInfo(8, this)
            return this.__JobInfo
        }
    }
}
