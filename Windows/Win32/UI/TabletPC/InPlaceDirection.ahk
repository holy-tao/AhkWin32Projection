#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the preferred direction of the In-Place Input Panel relative to the text entry field.
 * @remarks
 * 
 * An application can specify whether the In-Place Input Panel defaults appear above or below a text entry field by setting the <a href="https://docs.microsoft.com/windows/desktop/api/peninputpanel/nf-peninputpanel-itextinputpanel-get_preferredinplacedirection">ITextInputPanel::PreferredInPlaceDirection Property</a> to <b>InPlaceDirection_Bottom</b> or <b>InPlaceDirection_Top</b>. <b>ITextInputPanel::PreferredInPlaceDirection Property</b> is a preference because the In-Place Input Panel overrides the preference set by the application when necessary to keep Input Panel on the screen. The system default is to position the In-Place Input Panel below a text field when possible; otherwise it is positioned above. Setting the <b>ITextInputPanel::PreferredInPlaceDirection Property</b> to <b>InPlaceDirection_Auto</b> restores the system default.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//peninputpanel/ne-peninputpanel-inplacedirection
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class InPlaceDirection extends Win32Enum{

    /**
     * Restores the system default.
     * @type {Integer (Int32)}
     */
    static InPlaceDirection_Auto => 0

    /**
     * The preferred direction is above the text entry field.
     * @type {Integer (Int32)}
     */
    static InPlaceDirection_Bottom => 1

    /**
     * The preferred direction is below the text entry field.
     * @type {Integer (Int32)}
     */
    static InPlaceDirection_Top => 2
}
