#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\BranchOfficeJobDataPrinted.ahk
#Include .\BranchOfficeJobDataRendered.ahk
#Include .\BranchOfficeJobDataError.ahk
#Include .\BranchOfficeJobDataPipelineFailed.ahk
#Include .\BranchOfficeLogOfflineFileFull.ahk
#Include .\BranchOfficeJobData.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class BranchOfficeJobDataContainer extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cJobDataEntries {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<BranchOfficeJobData>}
     */
    JobData{
        get {
            if(!this.HasProp("__JobDataProxyArray"))
                this.__JobDataProxyArray := Win32FixedArray(this.ptr + 8, 1, BranchOfficeJobData, "")
            return this.__JobDataProxyArray
        }
    }
}
