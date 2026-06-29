#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The MMC_BUTTON_STATE enumeration defines the possible states of buttons available in MMC. These values are used in the nState parameter of IConsoleVerb::GetVerbState, IConsoleVerb::SetVerbState, IToolbar::GetButtonState, and IToolbar::SetButtonState.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/ne-mmc-mmc_button_state
 * @namespace Windows.Win32.System.Mmc
 */
export default struct MMC_BUTTON_STATE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The button accepts user input. A button that does not have this state does not accept user input and appears dimmed.
     * @type {Integer (Int32)}
     */
    static ENABLED => 1

    /**
     * The button has the CHECKED style and is being pressed.
     * @type {Integer (Int32)}
     */
    static CHECKED => 2

    /**
     * The button is not visible and cannot receive user input.
     * @type {Integer (Int32)}
     */
    static HIDDEN => 4

    /**
     * The button appears dimmed.
     * @type {Integer (Int32)}
     */
    static INDETERMINATE => 8

    /**
     * The button is being pressed.
     * @type {Integer (Int32)}
     */
    static BUTTONPRESSED => 16
}
