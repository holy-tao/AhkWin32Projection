#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes how a render target behaves when it presents its content. This enumeration allows a bitwise combination of its member values.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1/ne-d2d1-d2d1_present_options
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_PRESENT_OPTIONS{

    /**
     * The render target waits until the display refreshes to present and discards the frame upon presenting.
     * @type {Integer (Int32)}
     */
    static D2D1_PRESENT_OPTIONS_NONE => 0

    /**
     * The render target does not discard the frame upon presenting.
     * @type {Integer (Int32)}
     */
    static D2D1_PRESENT_OPTIONS_RETAIN_CONTENTS => 1

    /**
     * The render target does not wait until the display refreshes to present.
     * @type {Integer (Int32)}
     */
    static D2D1_PRESENT_OPTIONS_IMMEDIATELY => 2
}
