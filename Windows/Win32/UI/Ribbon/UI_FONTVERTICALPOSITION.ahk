#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies values that identify the vertical-alignment state of a FontControl.
 * @remarks
 * 
  * <b>UI_FONTVERTICALPOSITION</b> is associated with the <b>Subscript</b> and <b>Superscript</b> toggle buttons of the <i>RichFont</i> <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-element-fontcontrol">FontControl</a> as shown in the following screen shot.
  * 
  * <img alt="Screen shot of the FontControl element with the RichFont attribute set to true." src="./images/FontControl_SubSuper.png"/>
  * The <b>Subscript</b> and <b>Superscript</b> toggle buttons  are displayed by default in a <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-element-fontcontrol">FontControl</a>, depending on the value of the <i>FontType</i> attribute. 
  * 
  * The <b>Subscript</b> and <b>Superscript</b> buttons are toggled based on the <b>UI_FONTVERTICALPOSITION</b> value in <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-reference-properties-uipkey-fontproperties-verticalpositioning">UI_PKEY_FontProperties_VerticalPositioning</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//uiribbon/ne-uiribbon-ui_fontverticalposition
 * @namespace Windows.Win32.UI.Ribbon
 * @version v4.0.30319
 */
class UI_FONTVERTICALPOSITION{

    /**
     * Vertical positioning is not enabled.
     * @type {Integer (Int32)}
     */
    static UI_FONTVERTICALPOSITION_NOTAVAILABLE => 0

    /**
     * Vertical positioning is enabled but not toggled.
     * @type {Integer (Int32)}
     */
    static UI_FONTVERTICALPOSITION_NOTSET => 1

    /**
     * Vertical positioning is enabled and toggled for superscript.
     * @type {Integer (Int32)}
     */
    static UI_FONTVERTICALPOSITION_SUPERSCRIPT => 2

    /**
     * Vertical positioning is enabled and toggled for subscript.
     * @type {Integer (Int32)}
     */
    static UI_FONTVERTICALPOSITION_SUBSCRIPT => 3
}
