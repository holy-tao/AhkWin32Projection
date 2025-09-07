#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes how up-to-date the OS on a device is.
 * @remarks
 * This enumeration is used most often with the [**UpdateAssessment**](/windows/win32/api/waasapitypes/ns-waasapitypes-updateassessment) and [**OSUpdateAssessment**](/windows/win32/api/waasapitypes/ns-waasapitypes-osupdateassessment) structures, which are in turn used with the [**GetOSUpdateAssessment**](/windows/desktop/api/waasapi/nf-waasapi-iwaasassessor-getosupdateassessment) method for [**IWaaSAssessor**](/windows/desktop/api/waasapi/nn-waasapi-iwaasassessor).
 * @see https://learn.microsoft.com/windows/win32/SysInfo/updateassessmentstatus
 * @namespace Windows.Win32.System.UpdateAssessment
 * @version v4.0.30319
 */
class UpdateAssessmentStatus{

    /**
     * @type {Integer (Int32)}
     */
    static UpdateAssessmentStatus_Latest => 0

    /**
     * @type {Integer (Int32)}
     */
    static UpdateAssessmentStatus_NotLatestSoftRestriction => 1

    /**
     * @type {Integer (Int32)}
     */
    static UpdateAssessmentStatus_NotLatestHardRestriction => 2

    /**
     * @type {Integer (Int32)}
     */
    static UpdateAssessmentStatus_NotLatestEndOfSupport => 3

    /**
     * @type {Integer (Int32)}
     */
    static UpdateAssessmentStatus_NotLatestServicingTrain => 4

    /**
     * @type {Integer (Int32)}
     */
    static UpdateAssessmentStatus_NotLatestDeferredFeature => 5

    /**
     * @type {Integer (Int32)}
     */
    static UpdateAssessmentStatus_NotLatestDeferredQuality => 6

    /**
     * @type {Integer (Int32)}
     */
    static UpdateAssessmentStatus_NotLatestPausedFeature => 7

    /**
     * @type {Integer (Int32)}
     */
    static UpdateAssessmentStatus_NotLatestPausedQuality => 8

    /**
     * @type {Integer (Int32)}
     */
    static UpdateAssessmentStatus_NotLatestManaged => 9

    /**
     * @type {Integer (Int32)}
     */
    static UpdateAssessmentStatus_NotLatestUnknown => 10

    /**
     * @type {Integer (Int32)}
     */
    static UpdateAssessmentStatus_NotLatestTargetedVersion => 11
}
