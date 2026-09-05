#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the possible states of an assessment.
 * @see https://learn.microsoft.com/windows/win32/api/winsatcominterfacei/ne-winsatcominterfacei-winsat_assessment_state
 * @namespace Windows.Win32.System.AssessmentTool
 */
class WINSAT_ASSESSMENT_STATE extends Win32Enum {

    /**
     * The minimum enumeration value for this enumeration.
     * Native name: WINSAT_ASSESSMENT_STATE_MIN
     * @type {Integer (Int32)}
     */
    static MIN => 0

    /**
     * The state of the assessment is unknown.
     * Native name: WINSAT_ASSESSMENT_STATE_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * The assessment data is valid for the current computer configuration.
     * Native name: WINSAT_ASSESSMENT_STATE_VALID
     * @type {Integer (Int32)}
     */
    static VALID => 1

    /**
     * The assessment data does not match the current computer configuration. The hardware on the computer has changed since the last time a formal assessment was run.
     * Native name: WINSAT_ASSESSMENT_STATE_INCOHERENT_WITH_HARDWARE
     * @type {Integer (Int32)}
     */
    static INCOHERENT_WITH_HARDWARE => 2

    /**
     * The assessment data is not available because a formal WinSAT assessment has not been run on this computer.
     * Native name: WINSAT_ASSESSMENT_STATE_NOT_AVAILABLE
     * @type {Integer (Int32)}
     */
    static NOT_AVAILABLE => 3

    /**
     * The assessment data is not valid.
     * Native name: WINSAT_ASSESSMENT_STATE_INVALID
     * @type {Integer (Int32)}
     */
    static INVALID => 4

    /**
     * The maximum enumeration value for this enumeration.
     * Native name: WINSAT_ASSESSMENT_STATE_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 4
}
