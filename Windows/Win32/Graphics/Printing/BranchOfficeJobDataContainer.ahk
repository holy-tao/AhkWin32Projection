#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EBranchOfficeJobEventType.ahk" { EBranchOfficeJobEventType }
#Import ".\BranchOfficeJobDataError.ahk" { BranchOfficeJobDataError }
#Import ".\BranchOfficeLogOfflineFileFull.ahk" { BranchOfficeLogOfflineFileFull }
#Import ".\BranchOfficeJobDataRendered.ahk" { BranchOfficeJobDataRendered }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\BranchOfficeJobDataPipelineFailed.ahk" { BranchOfficeJobDataPipelineFailed }
#Import ".\BranchOfficeJobDataPrinted.ahk" { BranchOfficeJobDataPrinted }
#Import ".\BranchOfficeJobData.ahk" { BranchOfficeJobData }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct BranchOfficeJobDataContainer {
    #StructPack 8

    cJobDataEntries : UInt32

    JobData : BranchOfficeJobData[1]

}
