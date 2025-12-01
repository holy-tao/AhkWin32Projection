#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * UpdateAssessment contains information that assesses how up-to-date an installed OS is.
 * @remarks
 * This structure is used most often with <a href="https://docs.microsoft.com/windows/desktop/api/waasapitypes/ns-waasapitypes-osupdateassessment">OSUpdateAssessment</a>, which is in turn used with the <a href="https://docs.microsoft.com/windows/desktop/api/waasapi/nf-waasapi-iwaasassessor-getosupdateassessment">GetOSUpdateAssessment</a> method for <a href="https://docs.microsoft.com/windows/desktop/api/waasapi/nn-waasapi-iwaasassessor">IWaaSAssessor</a>.
 * 
 * When <a href="https://docs.microsoft.com/windows/desktop/api/waasapi/nf-waasapi-iwaasassessor-getosupdateassessment">GetOSUpdateAssessment</a> is called, an <a href="https://docs.microsoft.com/windows/desktop/api/waasapitypes/ns-waasapitypes-osupdateassessment">OSUpdateAssessment</a> structure is returned. Within this structure there are two <b>UpdateAssessment</b> structures: <b>assessmentForCurrent</b> and <b>assessmentForUpToDate</b>. The <b>UpdateAssessment</b> structure summarizes the assessments to determine whether a device is current or whether it is up-to-date, respectively; this is defined with the <a href="https://docs.microsoft.com/windows/desktop/SysInfo/updateassessmentstatus">UpdateAssessmentStatus</a> enumeration. The assessment informs how many days the device has been out-of-date with <b>daysOutofDate</b>. This date is used to determine if there is any potential impact (represented by the <b>impact</b> member in this structure) to the device.
 * @see https://learn.microsoft.com/windows/win32/api/waasapitypes/ns-waasapitypes-updateassessment
 * @namespace Windows.Win32.System.UpdateAssessment
 * @version v4.0.30319
 */
class UpdateAssessment extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/SysInfo/updateassessmentstatus">UpdateAssessmentStatus</a> enumeration detailing how up-to-date the device is, and for what reason.
     * @type {Integer}
     */
    status {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/SysInfo/updateimpactlevel">    UpdateImpactLevel</a> enumeration detailing whether there is any impact on the device if it has an out-of-date OS.
     * @type {Integer}
     */
    impact {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Describes how much time has elapsed since the device has not installed an applicable update. <b>daysOutOfDate</b> is calculated by the current time minus the time since the next applicable update has been released, minus any deferral period. Thus, if an applicable update exists but hasn’t been applied due to deferral, this is accounted for in the calculation. <b>daysOutOfDate</b> is used to calculate the update impact level.
     * @type {Integer}
     */
    daysOutOfDate {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
