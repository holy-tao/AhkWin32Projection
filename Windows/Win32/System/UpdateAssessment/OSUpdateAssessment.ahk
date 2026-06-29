#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\UpdateAssessment.ahk" { UpdateAssessment }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import ".\UpdateAssessmentStatus.ahk" { UpdateAssessmentStatus }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\UpdateImpactLevel.ahk" { UpdateImpactLevel }

/**
 * The OSUpdateAssessment structure defines how up-to-date the OS on a targeted device is.
 * @see https://learn.microsoft.com/windows/win32/api/waasapitypes/ns-waasapitypes-osupdateassessment
 * @namespace Windows.Win32.System.UpdateAssessment
 */
export default struct OSUpdateAssessment {
    #StructPack 8

    /**
     * <b>true</b> if the OS on the device is no longer supported by Microsoft and will no longer receive servicing updates; otherwise, <b>false</b>.
     */
    isEndOfSupport : BOOL

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/waasapitypes/ns-waasapitypes-updateassessment">UpdateAssessment</a> structure containing an assessment against the latest update Microsoft has released.
     */
    assessmentForCurrent : UpdateAssessment

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/waasapitypes/ns-waasapitypes-updateassessment">UpdateAssessment</a> structure containing an assessment against the latest applicable quality update for the device.
     */
    assessmentForUpToDate : UpdateAssessment

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/SysInfo/updateassessmentstatus">UpdateAssessmentStatus</a> enumeration that details whether the device is on the latest applicable security update.
     */
    securityStatus : UpdateAssessmentStatus

    /**
     * Timestamp when the assessment was done.
     */
    assessmentTime : FILETIME

    /**
     * Timestamp when the release information was updated.
     */
    releaseInfoTime : FILETIME

    /**
     * The latest OS build that Microsoft has released. This value is used to determine whether a device is current.
     */
    currentOSBuild : PWSTR

    /**
     * The published timestamp of the release date for current OS build.
     */
    currentOSReleaseTime : FILETIME

    /**
     * The latest applicable OS build in the device's servicing train. This value is used to determine whether a device is up-to-date.
     */
    upToDateOSBuild : PWSTR

    /**
     * The published timestamp of the release date for the up-to-date OS build.
     */
    upToDateOSReleaseTime : FILETIME

}
