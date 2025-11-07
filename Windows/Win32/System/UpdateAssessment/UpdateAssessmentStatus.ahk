#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes how up-to-date the OS on a device is.
 * @remarks
 * 
 * This enumeration is used most often with the <a href="https://docs.microsoft.com/windows/desktop/api/waasapitypes/ns-waasapitypes-updateassessment">UpdateAssessment</a>  and <a href="https://docs.microsoft.com/windows/desktop/api/waasapitypes/ns-waasapitypes-osupdateassessment">OSUpdateAssessment</a> structures, which are in turn used with the <a href="https://docs.microsoft.com/windows/desktop/api/waasapi/nf-waasapi-iwaasassessor-getosupdateassessment">GetOSUpdateAssessment</a> method for <a href="https://docs.microsoft.com/windows/desktop/api/waasapi/nn-waasapi-iwaasassessor">IWaaSAssessor</a>.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//waasapitypes/ne-waasapitypes-updateassessmentstatus
 * @namespace Windows.Win32.System.UpdateAssessment
 * @version v4.0.30319
 */
class UpdateAssessmentStatus{

    /**
     * This result within <b>assessmentForCurrent</b> implies that the device is on the latest feature update and quality update available for that device. Within <b>assessmentForUpToDate</b>, this result implies that the device is on the latest quality update for the release of Windows it is running.
     * @type {Integer (Int32)}
     */
    static UpdateAssessmentStatus_Latest => 0

    /**
     * The latest feature update has not been installed due to a soft restriction. When a soft restriction has been placed on an update, the update will not be automatically installed; a user must self-initiate the download within the Update UX. This status only applies to <b>assessmentForCurrent</b>.
     * @type {Integer (Int32)}
     */
    static UpdateAssessmentStatus_NotLatestSoftRestriction => 1

    /**
     * The latest feature update has not been installed due to a hard restriction. When a hard restriction has been placed on an update, the update is not applicable to the device. This status only applies to <b>assessmentForCurrent</b>.
     * @type {Integer (Int32)}
     */
    static UpdateAssessmentStatus_NotLatestHardRestriction => 2

    /**
     * The device is not on the latest update because the device's feature update is no longer supported by Microsoft. When Microsoft stops supporting a feature release, this status will be returned for both <b>assessmentForCurrent</b> and <b>assessmentForUpToDate</b>. 
     *  
     * 
     * 
     * <div class="alert"><b>Note</b>   When <b>UpdateAssessmentStatus_NotLatestEndOfSupport</b> is returned, the assessment's <b>UpdateImpactLevel</b> is always <b>UpdateImpactLevel_High</b>.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static UpdateAssessmentStatus_NotLatestEndOfSupport => 3

    /**
     * The device is not on the latest feature update because the device's servicing train limits the device from updating to the latest feature update. For example: if a device is on Current Branch for Business (CBB) and a new feature update has been released for Current Branch (CB), this will be returned. This status only applies to <b>assessmentForCurrent</b>.
     * @type {Integer (Int32)}
     */
    static UpdateAssessmentStatus_NotLatestServicingTrain => 4

    /**
     * The latest feature update has not been installed due to the device's Windows Update for Business Feature Update Deferral policy. Determining <b>daysOutOfDate</b> takes into account deferral policies; <b>daysOutOfDate</b> will not begin incrementing until the deferral period has expired. This status only applies to <b>assessmentForCurrent</b>.
     * @type {Integer (Int32)}
     */
    static UpdateAssessmentStatus_NotLatestDeferredFeature => 5

    /**
     * The device is not on the latest quality update due to the device's Windows Update for Business Quality Update Deferral policy.  Determining <b>daysOutOfDate</b> takes into account deferral policies; <b>daysOutOfDate</b> will not begin incrementing until the deferral period has expired.
     * @type {Integer (Int32)}
     */
    static UpdateAssessmentStatus_NotLatestDeferredQuality => 6

    /**
     * The device is not on the latest feature update due to the device having paused Feature Updates. Whether a device is paused is not factored into the calculation of <b>daysOutOfDate</b>. This status only applies to <b>assessmentForCurrent</b>.
     * @type {Integer (Int32)}
     */
    static UpdateAssessmentStatus_NotLatestPausedFeature => 7

    /**
     * The device is not on the latest quality update due to the device having paused Quality Updates. Whether a device is paused is not factored into the calculation of <b>daysOutOfDate</b>. <b>daysOutOfDate</b> does not factor whether a device is paused into its calculation.
     * @type {Integer (Int32)}
     */
    static UpdateAssessmentStatus_NotLatestPausedQuality => 8

    /**
     * The device is not on the latest update because the approval of updates is not done through Windows Update.
     * @type {Integer (Int32)}
     */
    static UpdateAssessmentStatus_NotLatestManaged => 9

    /**
     * The device is not on the latest update due to a reason that cannot be determined by the assessment.
     * @type {Integer (Int32)}
     */
    static UpdateAssessmentStatus_NotLatestUnknown => 10

    /**
     * The device is not on the latest feature update due to the device's Windows Update for Business Target Version policy. This policy is keeping the device on the targeted feature release version.
     * @type {Integer (Int32)}
     */
    static UpdateAssessmentStatus_NotLatestTargetedVersion => 11
}
