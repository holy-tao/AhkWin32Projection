#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the direction that an elliptical arc is drawn.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_sweep_direction
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_SWEEP_DIRECTION{

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
