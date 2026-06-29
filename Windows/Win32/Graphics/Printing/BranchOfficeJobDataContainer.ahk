#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\BranchOfficeJobDataPrinted.ahk
#Include .\BranchOfficeJobData.ahk
#Include .\BranchOfficeJobDataRendered.ahk
#Include .\BranchOfficeLogOfflineFileFull.ahk
#Include .\BranchOfficeJobDataPipelineFailed.ahk
#Include .\BranchOfficeJobDataError.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\EBranchOfficeJobEventType.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
class BranchOfficeJobDataContainer extends Win32Struct {
    static sizeof => 104

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cJobDataEntries {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {BranchOfficeJobData}
     */
    JobData {
        get {
            if(!this.HasProp("__JobDataProxyArray"))
                this.__JobDataProxyArray := Win32FixedArray(this.ptr + 8, 1, BranchOfficeJobData, "")
            return this.__JobDataProxyArray
        }
    }
}
