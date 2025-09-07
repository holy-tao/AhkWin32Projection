#Requires AutoHotkey v2.0.0 64-bit

/**
 * Elements of the TfLBIClick enumeration specify which mouse button was used to click a toolbar item.
 * @see https://learn.microsoft.com/windows/win32/api/ctfutb/ne-ctfutb-tflbiclick
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class TfLBIClick{

    /**
     * The user right-clicked the button.
     * @type {Integer (Int32)}
     */
    static TF_LBI_CLK_RIGHT => 1

    /**
     * The user left-clicked the button.
     * @type {Integer (Int32)}
     */
    static TF_LBI_CLK_LEFT => 2
}
