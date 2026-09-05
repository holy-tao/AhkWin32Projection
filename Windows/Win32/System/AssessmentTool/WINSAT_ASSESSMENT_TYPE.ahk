#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the possible subcomponents of an assessment.
 * @see https://learn.microsoft.com/windows/win32/api/winsatcominterfacei/ne-winsatcominterfacei-winsat_assessment_type
 * @namespace Windows.Win32.System.AssessmentTool
 */
class WINSAT_ASSESSMENT_TYPE extends Win32Enum {

    /**
     * Assess the memory of the computer.
     * Native name: WINSAT_ASSESSMENT_MEMORY
     * @type {Integer (Int32)}
     */
    static MEMORY => 0

    /**
     * Assess the processors on the computer.
     * Native name: WINSAT_ASSESSMENT_CPU
     * @type {Integer (Int32)}
     */
    static CPU => 1

    /**
     * Assess the primary hard disk on the computer.
     * Native name: WINSAT_ASSESSMENT_DISK
     * @type {Integer (Int32)}
     */
    static DISK => 2

    /**
     * After Windows 8.1, WinSAT no longer assesses the three-dimensional graphics (gaming) capabilities of the computer and the graphics driver's ability to render objects and execute shaders using this assessment. For compatibility, WinSAT reports sentinel values for the metrics and scores, however these are not calculated in real time.
     * Native name: WINSAT_ASSESSMENT_D3D
     * @type {Integer (Int32)}
     */
    static D3D => 3

    /**
     * Assess the video card abilities required for Desktop Window Manager (DWM) composition.
     * Native name: WINSAT_ASSESSMENT_GRAPHICS
     * @type {Integer (Int32)}
     */
    static GRAPHICS => 4
}
