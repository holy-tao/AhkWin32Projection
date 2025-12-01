#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Modifies how the final inertia end position is calculated.
 * @remarks
 * For <b>DIRECTMANIPULATION_SNAPPOINT_MANDATORY</b> or <b>DIRECTMANIPULATION_SNAPPOINT_OPTIONAL</b> snap points, the snap points are chosen based on the natural ending position of inertia as calculated by the touch interaction engine. For <b>DIRECTMANIPULATION_SNAPPOINT_MANDATORY_SINGLE</b> or <b>DIRECTMANIPULATION_SNAPPOINT_OPTIONAL_SINGLE</b> snap points, the selected snap point depends on where inertia started.
 * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/ne-directmanipulation-directmanipulation_snappoint_type
 * @namespace Windows.Win32.Graphics.DirectManipulation
 * @version v4.0.30319
 */
class DIRECTMANIPULATION_SNAPPOINT_TYPE extends Win32Enum{

    /**
     * Content always stops at the snap point closest to where inertia would naturally stop along the direction of inertia.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_SNAPPOINT_MANDATORY => 0

    /**
     * Content stops at a snap point closest to where inertia would naturally stop along the direction of inertia, depending on how close the snap point is.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_SNAPPOINT_OPTIONAL => 1

    /**
     * Content always stops at the snap point closest to the release point along the direction of inertia.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_SNAPPOINT_MANDATORY_SINGLE => 2

    /**
     * Content stops at the next snap point, if the motion starts far from it.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_SNAPPOINT_OPTIONAL_SINGLE => 3
}
