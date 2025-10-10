#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the possible subcomponents of an assessment.
 * @see https://docs.microsoft.com/windows/win32/api//winsatcominterfacei/ne-winsatcominterfacei-winsat_assessment_type
 * @namespace Windows.Win32.System.AssessmentTool
 * @version v4.0.30319
 */
class WINSAT_ASSESSMENT_TYPE{

    /**
     * Assess the memory of the computer.
     * @type {Integer (Int32)}
     */
    static WINSAT_ASSESSMENT_MEMORY => 0

    /**
     * Assess the processors on the computer.
     * @type {Integer (Int32)}
     */
    static WINSAT_ASSESSMENT_CPU => 1

    /**
     * Assess the primary hard disk on the computer.
     * @type {Integer (Int32)}
     */
    static WINSAT_ASSESSMENT_DISK => 2

    /**
     * After Windows 8.1, WinSAT no longer assesses the three-dimensional graphics (gaming) capabilities of the computer and the graphics driver's ability to render objects and execute shaders using this assessment. For compatibility, WinSAT reports sentinel values for the metrics and scores, however these are not calculated in real time.
     * @type {Integer (Int32)}
     */
    static WINSAT_ASSESSMENT_D3D => 3

    /**
     * Assess the video card abilities required for Desktop Window Manager (DWM) composition.
     * @type {Integer (Int32)}
     */
    static WINSAT_ASSESSMENT_GRAPHICS => 4
}
