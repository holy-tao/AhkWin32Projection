#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies values that identify whether the font size of a highlighted text run should be incremented or decremented.
 * @remarks
 * 
  * When you highlight a run of heterogeneously sized text, the Ribbon framework sets the <b>Font size</b> control to blank.  When you click the <b>Font grow</b> button or the <b>Font shrink</b> button, the highlighted text is resized, and the relative size variations in the text run are maintained.
  * 
  * The following screen shot shows the <b>Font grow</b> and <b>Font shrink</b> buttons on the <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-element-fontcontrol">FontControl</a>.
  * 
  * <img alt="Screen shot of the Font grow and Font shrink buttons on the FontControl." src="./images/FontControl_IncDec.png"/>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//uiribbon/ne-uiribbon-ui_fontdeltasize
 * @namespace Windows.Win32.UI.Ribbon
 * @version v4.0.30319
 */
class UI_FONTDELTASIZE{

    /**
     * Increment the font size.
     * @type {Integer (Int32)}
     */
    static UI_FONTDELTASIZE_GROW => 0

    /**
     * Decrement the font size.
     * @type {Integer (Int32)}
     */
    static UI_FONTDELTASIZE_SHRINK => 1
}
