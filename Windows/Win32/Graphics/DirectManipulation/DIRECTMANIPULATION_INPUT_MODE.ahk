#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the threading behavior for SetInputMode or SetUpdateMode. The exact meaning of each constant depends on the method called.
 * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/ne-directmanipulation-directmanipulation_input_mode
 * @namespace Windows.Win32.Graphics.DirectManipulation
 */
export default struct DIRECTMANIPULATION_INPUT_MODE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
