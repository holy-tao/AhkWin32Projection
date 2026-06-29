#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\UpdateAssessmentStatus.ahk" { UpdateAssessmentStatus }
#Import ".\UpdateImpactLevel.ahk" { UpdateImpactLevel }

/**
 * UpdateAssessment contains information that assesses how up-to-date an installed OS is.
 * @remarks
 * This structure is used most often with <a href="https://docs.microsoft.com/windows/desktop/api/waasapitypes/ns-waasapitypes-osupdateassessment">OSUpdateAssessment</a>, which is in turn used with the <a href="https://docs.microsoft.com/windows/desktop/api/waasapi/nf-waasapi-iwaasassessor-getosupdateassessment">GetOSUpdateAssessment</a> method for <a href="https://docs.microsoft.com/windows/desktop/api/waasapi/nn-waasapi-iwaasassessor">IWaaSAssessor</a>.
 * 
 * When <a href="https://docs.microsoft.com/windows/desktop/api/waasapi/nf-waasapi-iwaasassessor-getosupdateassessment">GetOSUpdateAssessment</a> is called, an <a href="https://docs.microsoft.com/windows/desktop/api/waasapitypes/ns-waasapitypes-osupdateassessment">OSUpdateAssessment</a> structure is returned. Within this structure there are two <b>UpdateAssessment</b> structures: <b>assessmentForCurrent</b> and <b>assessmentForUpToDate</b>. The <b>UpdateAssessment</b> structure summarizes the assessments to determine whether a device is current or whether it is up-to-date, respectively; this is defined with the <a href="https://docs.microsoft.com/windows/desktop/SysInfo/updateassessmentstatus">UpdateAssessmentStatus</a> enumeration. The assessment informs how many days the device has been out-of-date with <b>daysOutofDate</b>. This date is used to determine if there is any potential impact (represented by the <b>impact</b> member in this structure) to the device.
 * @see https://learn.microsoft.com/windows/win32/api/waasapitypes/ns-waasapitypes-updateassessment
 * @namespace Windows.Win32.System.UpdateAssessment
 */
export default struct UpdateAssessment {
    #StructPack 4

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/SysInfo/updateassessmentstatus">UpdateAssessmentStatus</a> enumeration detailing how up-to-date the device is, and for what reason.
     */
    status : UpdateAssessmentStatus

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/SysInfo/updateimpactlevel">    UpdateImpactLevel</a> enumeration detailing whether there is any impact on the device if it has an out-of-date OS.
     */
    impact : UpdateImpactLevel

    /**
     * Describes how much time has elapsed since the device has not installed an applicable update. <b>daysOutOfDate</b> is calculated by the current time minus the time since the next applicable update has been released, minus any deferral period. Thus, if an applicable update exists but hasn’t been applied due to deferral, this is accounted for in the calculation. <b>daysOutOfDate</b> is used to calculate the update impact level.
     */
    daysOutOfDate : UInt32

}
