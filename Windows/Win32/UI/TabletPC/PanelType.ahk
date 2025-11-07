#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the type of input currently available in the PenInputPanel object.
 * @remarks
 * 
 * The end user can change the handwriting panel between lined and boxed input modes using buttons on the Tablet PC Input Panel user interface (UI). There is no programmatic way to get or set lined or boxed mode. By default, western languages use lined input and East Asian languages use boxed input, but the user is free to change between these modes.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//peninputpanel/ne-peninputpanel-paneltype
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class PanelType{

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/tablet/peninputpanel-class">PenInputPanel</a> object displays the last panel type used for any pen input panel in any application. If all previous references to the pen input panel have been destroyed in all active applications, a new pen input panel will use the handwriting panel type.
     * @type {Integer (Int32)}
     */
    static PT_Default => 0

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/tablet/peninputpanel-class">PenInputPanel</a> object does not accept input. This value is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/peninputpanel/nf-peninputpanel-ipeninputpanel-get_currentpanel">CurrentPanel</a> property when the panel window is owned by another instance of the <b>PenInputPanel</b> object. This value is also returned if the panel window has not yet been activated.
     * @type {Integer (Int32)}
     */
    static PT_Inactive => 1

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/tablet/peninputpanel-class">PenInputPanel</a> object displays the default handwriting panel for the current input language.
     * @type {Integer (Int32)}
     */
    static PT_Handwriting => 2

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/tablet/peninputpanel-class">PenInputPanel</a> object displays the default keyboard panel for the current input language.
     * @type {Integer (Int32)}
     */
    static PT_Keyboard => 3
}
