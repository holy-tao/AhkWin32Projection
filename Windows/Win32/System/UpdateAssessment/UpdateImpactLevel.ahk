#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates a high, medium, or low impact of a device running an out-of-date OS.
 * @remarks
 * 
 * When <a href="https://docs.microsoft.com/windows/desktop/api/waasapi/nf-waasapi-iwaasassessor-getosupdateassessment">GetOSUpdateAssessment</a> is called, an <a href="https://docs.microsoft.com/windows/desktop/api/waasapitypes/ns-waasapitypes-osupdateassessment">OSUpdateAssessment</a> structure is returned. Within the structure there is an <b>assessmentForCurrent</b> and <b>assessmentForUpToDate</b>. Both of these are <a href="https://docs.microsoft.com/windows/desktop/api/waasapitypes/ns-waasapitypes-updateassessment">UpdateAssessment</a> structures. Both members have an <b>UpdateImpactLevel</b> enumeration, which indicates a high, medium, low or no impact for a device running an out-of-date OS. The These levels are determined by the value of <b>daysOutOfDate</b>.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//waasapitypes/ne-waasapitypes-updateimpactlevel
 * @namespace Windows.Win32.System.UpdateAssessment
 * @version v4.0.30319
 */
class UpdateImpactLevel extends Win32Enum{

    /**
     * There is no foreseeable impact to your device. This can be because the device is up-to-date, or is not up-to-date because the device is honoring its Windows Update for Business deferral periods, or is out-of-date but has not yet reached the <b>daysOutOfDate</b> threshold to reach a higher impact level.
     * @type {Integer (Int32)}
     */
    static UpdateImpactLevel_None => 0

    /**
     * The device is not running the latest OS, but has a recent update.
     * @type {Integer (Int32)}
     */
    static UpdateImpactLevel_Low => 1

    /**
     * The device is running the latest OS, but has a moderately recent update.
     * @type {Integer (Int32)}
     */
    static UpdateImpactLevel_Medium => 2

    /**
     * The device has been out-of-date for a long time. This device may have security vulnerabilities and may be missing important fixes that make Windows run better. When a device is running a version of Windows that is no longer supported, <b>UpdateImpactLevel_High</b> is always returned.
     * @type {Integer (Int32)}
     */
    static UpdateImpactLevel_High => 3
}
