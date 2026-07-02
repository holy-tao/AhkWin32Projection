#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\BranchOfficeJobDataPrinted.ahk" { BranchOfficeJobDataPrinted }
#Import ".\BranchOfficeJobDataError.ahk" { BranchOfficeJobDataError }
#Import ".\BranchOfficeLogOfflineFileFull.ahk" { BranchOfficeLogOfflineFileFull }
#Import ".\BranchOfficeJobDataRendered.ahk" { BranchOfficeJobDataRendered }
#Import ".\BranchOfficeJobDataPipelineFailed.ahk" { BranchOfficeJobDataPipelineFailed }
#Import ".\EBranchOfficeJobEventType.ahk" { EBranchOfficeJobEventType }
#Import ".\BranchOfficeJobData.ahk" { BranchOfficeJobData }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct BranchOfficeJobDataContainer {
    #StructPack 8

    cJobDataEntries : UInt32

    JobData : BranchOfficeJobData[1]

}
