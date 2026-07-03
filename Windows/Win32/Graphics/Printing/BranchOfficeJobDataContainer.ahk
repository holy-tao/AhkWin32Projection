#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\BranchOfficeJobData.ahk" { BranchOfficeJobData }
#Import ".\BranchOfficeJobDataError.ahk" { BranchOfficeJobDataError }
#Import ".\BranchOfficeJobDataPipelineFailed.ahk" { BranchOfficeJobDataPipelineFailed }
#Import ".\BranchOfficeJobDataPrinted.ahk" { BranchOfficeJobDataPrinted }
#Import ".\BranchOfficeJobDataRendered.ahk" { BranchOfficeJobDataRendered }
#Import ".\BranchOfficeLogOfflineFileFull.ahk" { BranchOfficeLogOfflineFileFull }
#Import ".\EBranchOfficeJobEventType.ahk" { EBranchOfficeJobEventType }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct BranchOfficeJobDataContainer {
    #StructPack 8

    cJobDataEntries : UInt32

    JobData : BranchOfficeJobData[1]

}
