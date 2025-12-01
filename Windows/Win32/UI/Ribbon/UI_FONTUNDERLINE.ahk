#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies values that identify the underline state of a FontControl.
 * @remarks
 * <b>UI_FONTUNDERLINE</b> is associated with the <b>Underline</b> toggle button of the <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-element-fontcontrol">FontControl</a> as shown in the following screen shot.
 * 
 * <img alt="Screen shot of the FontControl element with the RichFont attribute set to true." src="./images/FontControl_Underline.png"/>
 * The <b>Underline</b> toggle button is displayed by default in a <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-element-fontcontrol">FontControl</a> but can be hidden, depending on the value of the <i>FontType</i> attribute.
 * 
 * The <b>Underline</b> button is toggled based on the <b>UI_FONTUNDERLINE</b> value in <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-reference-properties-uipkey-fontproperties-underline">UI_PKEY_FontProperties_Underline</a>.
 * 
 * A solid single line is the only underline style supported by the <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-element-fontcontrol">FontControl</a>.
 * @see https://learn.microsoft.com/windows/win32/api/uiribbon/ne-uiribbon-ui_fontunderline
 * @namespace Windows.Win32.UI.Ribbon
 * @version v4.0.30319
 */
class UI_FONTUNDERLINE extends Win32Enum{

    /**
     * Underlining is not enabled.
     * @type {Integer (Int32)}
     */
    static UI_FONTUNDERLINE_NOTAVAILABLE => 0

    /**
     * Underlining is off.
     * @type {Integer (Int32)}
     */
    static UI_FONTUNDERLINE_NOTSET => 1

    /**
     * Underlining is on.
     * @type {Integer (Int32)}
     */
    static UI_FONTUNDERLINE_SET => 2
}
