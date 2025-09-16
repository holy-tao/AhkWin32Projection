#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\BranchOfficeJobDataPrinted.ahk
#Include .\BranchOfficeJobDataRendered.ahk
#Include .\BranchOfficeJobDataError.ahk
#Include .\BranchOfficeJobDataPipelineFailed.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class BranchOfficeJobData extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
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
     * @type {BranchOfficeJobDataPrinted}
     */
    LogJobPrinted{
        get {
            if(!this.HasProp("__LogJobPrinted"))
                this.__LogJobPrinted := BranchOfficeJobDataPrinted(this.ptr + 8)
            return this.__LogJobPrinted
        }
    }

    /**
     * @type {BranchOfficeJobDataRendered}
     */
    LogJobRendered{
        get {
            if(!this.HasProp("__LogJobRendered"))
                this.__LogJobRendered := BranchOfficeJobDataRendered(this.ptr + 8)
            return this.__LogJobRendered
        }
    }

    /**
     * @type {BranchOfficeJobDataError}
     */
    LogJobError{
        get {
            if(!this.HasProp("__LogJobError"))
                this.__LogJobError := BranchOfficeJobDataError(this.ptr + 8)
            return this.__LogJobError
        }
    }

    /**
     * @type {BranchOfficeJobDataPipelineFailed}
     */
    LogPipelineFailed{
        get {
            if(!this.HasProp("__LogPipelineFailed"))
                this.__LogPipelineFailed := BranchOfficeJobDataPipelineFailed(this.ptr + 8)
            return this.__LogPipelineFailed
        }
    }

    /**
     * @type {Pointer<PWSTR>}
     */
    LogOfflineFileFull {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
