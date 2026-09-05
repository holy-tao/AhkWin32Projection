#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes how up-to-date the OS on a device is.
 * @remarks
 * This enumeration is used most often with the [**UpdateAssessment**](/windows/win32/api/waasapitypes/ns-waasapitypes-updateassessment) and [**OSUpdateAssessment**](/windows/win32/api/waasapitypes/ns-waasapitypes-osupdateassessment) structures, which are in turn used with the [**GetOSUpdateAssessment**](/windows/desktop/api/waasapi/nf-waasapi-iwaasassessor-getosupdateassessment) method for [**IWaaSAssessor**](/windows/desktop/api/waasapi/nn-waasapi-iwaasassessor).
 * @see https://learn.microsoft.com/windows/win32/SysInfo/updateassessmentstatus
 * @namespace Windows.Win32.System.UpdateAssessment
 */
class UpdateAssessmentStatus extends Win32Enum {

    /**
     * Native name: UpdateAssessmentStatus_Latest
     * @type {Integer (Int32)}
     */
    static Latest => 0

    /**
     * Native name: UpdateAssessmentStatus_NotLatestSoftRestriction
     * @type {Integer (Int32)}
     */
    static NotLatestSoftRestriction => 1

    /**
     * Native name: UpdateAssessmentStatus_NotLatestHardRestriction
     * @type {Integer (Int32)}
     */
    static NotLatestHardRestriction => 2

    /**
     * Native name: UpdateAssessmentStatus_NotLatestEndOfSupport
     * @type {Integer (Int32)}
     */
    static NotLatestEndOfSupport => 3

    /**
     * Native name: UpdateAssessmentStatus_NotLatestServicingTrain
     * @type {Integer (Int32)}
     */
    static NotLatestServicingTrain => 4

    /**
     * Native name: UpdateAssessmentStatus_NotLatestDeferredFeature
     * @type {Integer (Int32)}
     */
    static NotLatestDeferredFeature => 5

    /**
     * Native name: UpdateAssessmentStatus_NotLatestDeferredQuality
     * @type {Integer (Int32)}
     */
    static NotLatestDeferredQuality => 6

    /**
     * Native name: UpdateAssessmentStatus_NotLatestPausedFeature
     * @type {Integer (Int32)}
     */
    static NotLatestPausedFeature => 7

    /**
     * Native name: UpdateAssessmentStatus_NotLatestPausedQuality
     * @type {Integer (Int32)}
     */
    static NotLatestPausedQuality => 8

    /**
     * Native name: UpdateAssessmentStatus_NotLatestManaged
     * @type {Integer (Int32)}
     */
    static NotLatestManaged => 9

    /**
     * Native name: UpdateAssessmentStatus_NotLatestUnknown
     * @type {Integer (Int32)}
     */
    static NotLatestUnknown => 10

    /**
     * Native name: UpdateAssessmentStatus_NotLatestTargetedVersion
     * @type {Integer (Int32)}
     */
    static NotLatestTargetedVersion => 11
}
