#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the possible states of an assessment.
 * @see https://docs.microsoft.com/windows/win32/api//winsatcominterfacei/ne-winsatcominterfacei-winsat_assessment_state
 * @namespace Windows.Win32.System.AssessmentTool
 * @version v4.0.30319
 */
class WINSAT_ASSESSMENT_STATE{

    /**
     * The minimum enumeration value for this enumeration.
     * @type {Integer (Int32)}
     */
    static WINSAT_ASSESSMENT_STATE_MIN => 0

    /**
     * The state of the assessment is unknown.
     * @type {Integer (Int32)}
     */
    static WINSAT_ASSESSMENT_STATE_UNKNOWN => 0

    /**
     * The assessment data is valid for the current computer configuration.
     * @type {Integer (Int32)}
     */
    static WINSAT_ASSESSMENT_STATE_VALID => 1

    /**
     * The assessment data does not match the current computer configuration. The hardware on the computer has changed since the last time a formal assessment was run.
     * @type {Integer (Int32)}
     */
    static WINSAT_ASSESSMENT_STATE_INCOHERENT_WITH_HARDWARE => 2

    /**
     * The assessment data is not available because a formal WinSAT assessment has not been run on this computer.
     * @type {Integer (Int32)}
     */
    static WINSAT_ASSESSMENT_STATE_NOT_AVAILABLE => 3

    /**
     * The assessment data is not valid.
     * @type {Integer (Int32)}
     */
    static WINSAT_ASSESSMENT_STATE_INVALID => 4

    /**
     * The maximum enumeration value for this enumeration.
     * @type {Integer (Int32)}
     */
    static WINSAT_ASSESSMENT_STATE_MAX => 4
}
