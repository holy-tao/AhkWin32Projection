#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Modifies how the final inertia end position is calculated.
 * @remarks
 * For <b>DIRECTMANIPULATION_SNAPPOINT_MANDATORY</b> or <b>DIRECTMANIPULATION_SNAPPOINT_OPTIONAL</b> snap points, the snap points are chosen based on the natural ending position of inertia as calculated by the touch interaction engine. For <b>DIRECTMANIPULATION_SNAPPOINT_MANDATORY_SINGLE</b> or <b>DIRECTMANIPULATION_SNAPPOINT_OPTIONAL_SINGLE</b> snap points, the selected snap point depends on where inertia started.
 * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/ne-directmanipulation-directmanipulation_snappoint_type
 * @namespace Windows.Win32.Graphics.DirectManipulation
 */
export default struct DIRECTMANIPULATION_SNAPPOINT_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
