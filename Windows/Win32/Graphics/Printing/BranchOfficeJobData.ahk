#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\BranchOfficeJobDataError.ahk" { BranchOfficeJobDataError }
#Import ".\BranchOfficeJobDataPipelineFailed.ahk" { BranchOfficeJobDataPipelineFailed }
#Import ".\BranchOfficeJobDataPrinted.ahk" { BranchOfficeJobDataPrinted }
#Import ".\BranchOfficeJobDataRendered.ahk" { BranchOfficeJobDataRendered }
#Import ".\BranchOfficeLogOfflineFileFull.ahk" { BranchOfficeLogOfflineFileFull }
#Import ".\EBranchOfficeJobEventType.ahk" { EBranchOfficeJobEventType }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct BranchOfficeJobData {
    #StructPack 8


    struct _JobInfo {
        LogJobPrinted : BranchOfficeJobDataPrinted

        static __New() {
            DefineProp(this.Prototype, 'LogJobRendered', { type: BranchOfficeJobDataRendered, offset: 0 })
            DefineProp(this.Prototype, 'LogJobError', { type: BranchOfficeJobDataError, offset: 0 })
            DefineProp(this.Prototype, 'LogPipelineFailed', { type: BranchOfficeJobDataPipelineFailed, offset: 0 })
            DefineProp(this.Prototype, 'LogOfflineFileFull', { type: BranchOfficeLogOfflineFileFull, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    eEventType : EBranchOfficeJobEventType

    JobId : UInt32

    JobInfo : BranchOfficeJobData._JobInfo

}
