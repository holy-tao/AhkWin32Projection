#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates a high, medium, or low impact of a device running an out-of-date OS.
 * @remarks
 * When [**GetOSUpdateAssessment**](/windows/desktop/api/waasapi/nf-waasapi-iwaasassessor-getosupdateassessment) is called, an [**OSUpdateAssessment**](/windows/win32/api/waasapitypes/ns-waasapitypes-osupdateassessment) structure is returned. Within the structure there is an **assessmentForCurrent** and **assessmentForUpToDate**. Both of these are [**UpdateAssessment**](/windows/win32/api/waasapitypes/ns-waasapitypes-updateassessment) structures. Both members have an **UpdateImpactLevel** enumeration, which indicates a high, medium, low or no impact for a device running an out-of-date OS. The These levels are determined by the value of **daysOutOfDate**.
 * @see https://learn.microsoft.com/windows/win32/SysInfo/updateimpactlevel
 * @namespace Windows.Win32.System.UpdateAssessment
 * @version v4.0.30319
 */
class UpdateImpactLevel extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UpdateImpactLevel_None => 0

    /**
     * @type {Integer (Int32)}
     */
    static UpdateImpactLevel_Low => 1

    /**
     * @type {Integer (Int32)}
     */
    static UpdateImpactLevel_Medium => 2

    /**
     * @type {Integer (Int32)}
     */
    static UpdateImpactLevel_High => 3
}
