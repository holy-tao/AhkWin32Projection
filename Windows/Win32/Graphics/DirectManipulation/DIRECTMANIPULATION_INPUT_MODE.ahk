#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the threading behavior for SetInputMode or SetUpdateMode. The exact meaning of each constant depends on the method called.
 * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/ne-directmanipulation-directmanipulation_input_mode
 * @namespace Windows.Win32.Graphics.DirectManipulation
 * @version v4.0.30319
 */
class DIRECTMANIPULATION_INPUT_MODE{

    /**
     * Input is automatically passed to the viewport in an independent thread.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_INPUT_MODE_AUTOMATIC => 0

    /**
     * Input is manually passed by   the app on its thread via the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationmanager-processinput">ProcessInput</a> method.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_INPUT_MODE_MANUAL => 1
}
