#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the direction that an elliptical arc is drawn.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_sweep_direction
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_SWEEP_DIRECTION {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Arcs are drawn in a counterclockwise (negative-angle) direction.
     * @type {Integer (Int32)}
     */
    static D2D1_SWEEP_DIRECTION_COUNTER_CLOCKWISE => 0

    /**
     * Arcs are drawn in a clockwise (positive-angle) direction.
     * @type {Integer (Int32)}
     */
    static D2D1_SWEEP_DIRECTION_CLOCKWISE => 1
}
