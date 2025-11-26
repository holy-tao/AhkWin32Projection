#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * .
 * @see https://docs.microsoft.com/windows/win32/api//peninputpanel/nn-peninputpanel-ipeninputpanel
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IPenInputPanel extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPenInputPanel
     * @type {Guid}
     */
    static IID => Guid("{fa7a4083-5747-4040-a182-0b0e9fd4fac7}")

    /**
     * The class identifier for PenInputPanel
     * @type {Guid}
     */
    static CLSID => Guid("{f744e496-1b5a-489e-81dc-fbd7ac6298a8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Busy", "get_Factoid", "put_Factoid", "get_AttachedEditWindow", "put_AttachedEditWindow", "get_CurrentPanel", "put_CurrentPanel", "get_DefaultPanel", "put_DefaultPanel", "get_Visible", "put_Visible", "get_Top", "get_Left", "get_Width", "get_Height", "get_VerticalOffset", "put_VerticalOffset", "get_HorizontalOffset", "put_HorizontalOffset", "get_AutoShow", "put_AutoShow", "MoveTo", "CommitPendingInput", "Refresh", "EnableTsf"]

    /**
     * @type {VARIANT_BOOL} 
     */
    Busy {
        get => this.get_Busy()
    }

    /**
     * @type {BSTR} 
     */
    Factoid {
        get => this.get_Factoid()
        set => this.put_Factoid(value)
    }

    /**
     * @type {Integer} 
     */
    AttachedEditWindow {
        get => this.get_AttachedEditWindow()
        set => this.put_AttachedEditWindow(value)
    }

    /**
     * @type {Integer} 
     */
    CurrentPanel {
        get => this.get_CurrentPanel()
        set => this.put_CurrentPanel(value)
    }

    /**
     * @type {Integer} 
     */
    DefaultPanel {
        get => this.get_DefaultPanel()
        set => this.put_DefaultPanel(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Visible {
        get => this.get_Visible()
        set => this.put_Visible(value)
    }

    /**
     * @type {Integer} 
     */
    Top {
        get => this.get_Top()
    }

    /**
     * @type {Integer} 
     */
    Left {
        get => this.get_Left()
    }

    /**
     * @type {Integer} 
     */
    Width {
        get => this.get_Width()
    }

    /**
     * @type {Integer} 
     */
    Height {
        get => this.get_Height()
    }

    /**
     * @type {Integer} 
     */
    VerticalOffset {
        get => this.get_VerticalOffset()
        set => this.put_VerticalOffset(value)
    }

    /**
     * @type {Integer} 
     */
    HorizontalOffset {
        get => this.get_HorizontalOffset()
        set => this.put_HorizontalOffset(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    AutoShow {
        get => this.get_AutoShow()
        set => this.put_AutoShow(value)
    }

    /**
     * Deprecated. The PenInputPanel has been replaced by the Text Input Panel (TIP).Gets a a value that indicates whether the PenInputPanel object is currently processing ink.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//peninputpanel/nf-peninputpanel-ipeninputpanel-get_busy
     */
    get_Busy() {
        result := ComCall(7, this, "short*", &Busy := 0, "HRESULT")
        return Busy
    }

    /**
     * Deprecated. The PenInputPanel has been replaced by the Text Input Panel (TIP).Gets or sets the string name of the factoid used by the PenInputPanel object.
     * @remarks
     * 
     * A factoid provides a recognizer context for ink within a particular field. You specify a factoid if an input field is of a known type. For example, if the input field contains a date, specify the <a href="https://docs.microsoft.com/windows/desktop/tablet/factoid-constants">Date</a> factoid.
     * 
     * For more information about factoids and how to use them, see <a href="https://docs.microsoft.com/windows/desktop/tablet/using-context-to-improve-accuracy">Using Context to Improve Accuracy</a>. For a list of possible values for the <b>Factoid</b> property, see <a href="https://docs.microsoft.com/windows/desktop/tablet/supported-factoids-from-version-1">Supported Factoids from Version 1</a>.
     * 
     * <div class="alert"><b>Note</b>  String representations of factoids are case-sensitive.</div>
     * <div> </div>
     * This property has no effect on keypads or keyboards.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/tablet/factoid-constants">WordList</a> factoid is not supported for the <a href="https://docs.microsoft.com/windows/desktop/tablet/peninputpanel-class">PenInputPanel</a> object.
     * 
     * The default value for the <b>Factoid</b> property is DEFAULT. In locales that use recognizers of Latin script, all factoids may be used. In locales that use recognizers of East Asian characters, the following factoid values are relevant:
     * 
     * <ul>
     * <li>DIGIT: Implies the Num bias button on the East Asian writing pad.</li>
     * <li>ONECAHR: Implies the Alpha bias button on the East Asian writing pad.</li>
     * <li>Common <a href="https://docs.microsoft.com/windows/desktop/tablet/factoid-constants">factoids</a> (JapaneseCommon, ChineseSimpleCommon, ChineseTraditionalCommon, KoreanCommon, KanjiCommon, and HangulCommon) imply the Alpha/Num bias button on the East Asian writing pad.</li>
     * </ul>
     * All factoid values other than DIGIT and ONECHAR are interpreted as the common factoid that is appropriate for the current input locale.
     * 
     * If the <b>Factoid</b> property is set, it is forwarded to the recognizer only if the <a href="https://docs.microsoft.com/windows/desktop/api/inputscope/nf-inputscope-setinputscope">SetInputScope</a> function has not also been called.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//peninputpanel/nf-peninputpanel-ipeninputpanel-get_factoid
     */
    get_Factoid() {
        Factoid := BSTR()
        result := ComCall(8, this, "ptr", Factoid, "HRESULT")
        return Factoid
    }

    /**
     * Deprecated. The PenInputPanel has been replaced by the Text Input Panel (TIP).Gets or sets the string name of the factoid used by the PenInputPanel object.
     * @remarks
     * 
     * A factoid provides a recognizer context for ink within a particular field. You specify a factoid if an input field is of a known type. For example, if the input field contains a date, specify the <a href="https://docs.microsoft.com/windows/desktop/tablet/factoid-constants">Date</a> factoid.
     * 
     * For more information about factoids and how to use them, see <a href="https://docs.microsoft.com/windows/desktop/tablet/using-context-to-improve-accuracy">Using Context to Improve Accuracy</a>. For a list of possible values for the <b>Factoid</b> property, see <a href="https://docs.microsoft.com/windows/desktop/tablet/supported-factoids-from-version-1">Supported Factoids from Version 1</a>.
     * 
     * <div class="alert"><b>Note</b>  String representations of factoids are case-sensitive.</div>
     * <div> </div>
     * This property has no effect on keypads or keyboards.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/tablet/factoid-constants">WordList</a> factoid is not supported for the <a href="https://docs.microsoft.com/windows/desktop/tablet/peninputpanel-class">PenInputPanel</a> object.
     * 
     * The default value for the <b>Factoid</b> property is DEFAULT. In locales that use recognizers of Latin script, all factoids may be used. In locales that use recognizers of East Asian characters, the following factoid values are relevant:
     * 
     * <ul>
     * <li>DIGIT: Implies the Num bias button on the East Asian writing pad.</li>
     * <li>ONECAHR: Implies the Alpha bias button on the East Asian writing pad.</li>
     * <li>Common <a href="https://docs.microsoft.com/windows/desktop/tablet/factoid-constants">factoids</a> (JapaneseCommon, ChineseSimpleCommon, ChineseTraditionalCommon, KoreanCommon, KanjiCommon, and HangulCommon) imply the Alpha/Num bias button on the East Asian writing pad.</li>
     * </ul>
     * All factoid values other than DIGIT and ONECHAR are interpreted as the common factoid that is appropriate for the current input locale.
     * 
     * If the <b>Factoid</b> property is set, it is forwarded to the recognizer only if the <a href="https://docs.microsoft.com/windows/desktop/api/inputscope/nf-inputscope-setinputscope">SetInputScope</a> function has not also been called.
     * 
     * 
     * @param {BSTR} Factoid 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//peninputpanel/nf-peninputpanel-ipeninputpanel-put_factoid
     */
    put_Factoid(Factoid) {
        Factoid := Factoid is String ? BSTR.Alloc(Factoid).Value : Factoid

        result := ComCall(9, this, "ptr", Factoid, "HRESULT")
        return result
    }

    /**
     * Deprecated. The PenInputPanel has been replaced by the Text Input Panel (TIP).Sets or gets the window handle of the object that the PenInputPanel object is attached to.
     * @remarks
     * 
     * The window handle of an object may change.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//peninputpanel/nf-peninputpanel-ipeninputpanel-get_attachededitwindow
     */
    get_AttachedEditWindow() {
        result := ComCall(10, this, "int*", &AttachedEditWindow := 0, "HRESULT")
        return AttachedEditWindow
    }

    /**
     * Deprecated. The PenInputPanel has been replaced by the Text Input Panel (TIP).Sets or gets the window handle of the object that the PenInputPanel object is attached to.
     * @remarks
     * 
     * The window handle of an object may change.
     * 
     * 
     * @param {Integer} AttachedEditWindow 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//peninputpanel/nf-peninputpanel-ipeninputpanel-put_attachededitwindow
     */
    put_AttachedEditWindow(AttachedEditWindow) {
        result := ComCall(11, this, "int", AttachedEditWindow, "HRESULT")
        return result
    }

    /**
     * Deprecated. The PenInputPanel has been replaced by the Text Input Panel (TIP).Gets or sets which panel type is currently being used for input within the PenInputPanel object.
     * @remarks
     * 
     * <div class="alert"><b>Note</b>  The <b>CurrentPanel</b> property cannot be set to <a href="https://docs.microsoft.com/windows/desktop/api/peninputpanel/ne-peninputpanel-paneltype">Default</a> or <b>Inactive</b>, only <b>Handwriting</b> or <b>Keyboard</b>.</div>
     * <div> </div>
     * When you create a <a href="https://docs.microsoft.com/windows/desktop/tablet/peninputpanel-class">PenInputPanel</a> object, the <a href="https://docs.microsoft.com/windows/desktop/api/peninputpanel/ne-peninputpanel-paneltype">Handwriting</a> panel - also known as the writing pad - is the default input UI.
     * 
     * If you change the panel by setting the <b>CurrentPanel</b> property before the <a href="https://docs.microsoft.com/windows/desktop/tablet/peninputpanel-class">PenInputPanel</a> object becomes active for the first time, a <a href="https://docs.microsoft.com/windows/desktop/tablet/peninputpanel-panelchanged">PanelChanged</a> event occurs.
     * 
     * <b>CurrentPanel</b> returns the <a href="https://docs.microsoft.com/windows/desktop/api/peninputpanel/ne-peninputpanel-paneltype">Inactive</a> enumeration value if the panel window is associated with another instance of the <a href="https://docs.microsoft.com/windows/desktop/tablet/peninputpanel-class">PenInputPanel</a> object. Setting the <b>CurrentPanel</b> property raises an exception if the panel is inactive or if the panel type is invalid.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//peninputpanel/nf-peninputpanel-ipeninputpanel-get_currentpanel
     */
    get_CurrentPanel() {
        result := ComCall(12, this, "int*", &CurrentPanel := 0, "HRESULT")
        return CurrentPanel
    }

    /**
     * Deprecated. The PenInputPanel has been replaced by the Text Input Panel (TIP).Gets or sets which panel type is currently being used for input within the PenInputPanel object.
     * @remarks
     * 
     * <div class="alert"><b>Note</b>  The <b>CurrentPanel</b> property cannot be set to <a href="https://docs.microsoft.com/windows/desktop/api/peninputpanel/ne-peninputpanel-paneltype">Default</a> or <b>Inactive</b>, only <b>Handwriting</b> or <b>Keyboard</b>.</div>
     * <div> </div>
     * When you create a <a href="https://docs.microsoft.com/windows/desktop/tablet/peninputpanel-class">PenInputPanel</a> object, the <a href="https://docs.microsoft.com/windows/desktop/api/peninputpanel/ne-peninputpanel-paneltype">Handwriting</a> panel - also known as the writing pad - is the default input UI.
     * 
     * If you change the panel by setting the <b>CurrentPanel</b> property before the <a href="https://docs.microsoft.com/windows/desktop/tablet/peninputpanel-class">PenInputPanel</a> object becomes active for the first time, a <a href="https://docs.microsoft.com/windows/desktop/tablet/peninputpanel-panelchanged">PanelChanged</a> event occurs.
     * 
     * <b>CurrentPanel</b> returns the <a href="https://docs.microsoft.com/windows/desktop/api/peninputpanel/ne-peninputpanel-paneltype">Inactive</a> enumeration value if the panel window is associated with another instance of the <a href="https://docs.microsoft.com/windows/desktop/tablet/peninputpanel-class">PenInputPanel</a> object. Setting the <b>CurrentPanel</b> property raises an exception if the panel is inactive or if the panel type is invalid.
     * 
     * 
     * @param {Integer} CurrentPanel 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//peninputpanel/nf-peninputpanel-ipeninputpanel-put_currentpanel
     */
    put_CurrentPanel(CurrentPanel) {
        result := ComCall(13, this, "int", CurrentPanel, "HRESULT")
        return result
    }

    /**
     * Deprecated. The PenInputPanel has been replaced by the Text Input Panel (TIP).Gets or sets the default panel type used for input within the PenInputPanel object.
     * @remarks
     * 
     * <div class="alert"><b>Note</b>  The <b>DefaultPanel</b> property cannot be set to <a href="https://docs.microsoft.com/windows/desktop/api/peninputpanel/ne-peninputpanel-paneltype">Inactive</a>.</div>
     * <div> </div>
     * The <a href="https://docs.microsoft.com/windows/desktop/api/peninputpanel/ne-peninputpanel-paneltype">Handwriting</a> panel-also known as the writing pad-is the default input UI for a <a href="https://docs.microsoft.com/windows/desktop/tablet/peninputpanel-class">PenInputPanel</a>.
     * 
     * If the value of this property is <a href="https://docs.microsoft.com/windows/desktop/api/peninputpanel/ne-peninputpanel-paneltype">Default</a>, then the <a href="https://docs.microsoft.com/windows/desktop/tablet/peninputpanel-class">PenInputPanel</a> object uses the last panel type used for any pen input panel in any application. If all previous references to the pen input panel have been destroyed in all active applications, a new <b>PenInputPanel</b> object uses the <b>Handwriting</b> panel type.
     * 
     * If the panel is changed by setting the <a href="https://docs.microsoft.com/windows/desktop/api/peninputpanel/nf-peninputpanel-ipeninputpanel-get_currentpanel">CurrentPanel</a> property before the <a href="https://docs.microsoft.com/windows/desktop/tablet/peninputpanel-class">PenInputPanel</a> object becomes active for the first time, a <a href="https://docs.microsoft.com/windows/desktop/tablet/peninputpanel-panelchanged">PanelChanged</a> event occurs.
     * 
     * Setting the <b>DefaultPanel</b> property enables you to specify which type of panel shows by default in that instance of the <a href="https://docs.microsoft.com/windows/desktop/tablet/peninputpanel-class">PenInputPanel</a> object. If the value of this property is <a href="https://docs.microsoft.com/windows/desktop/api/peninputpanel/ne-peninputpanel-paneltype">Handwriting</a> or <b>Keyboard</b>, then each time the panel is made visible, it uses the handwriting or keyboard panel type, respectively.
     * 
     * If you re-attach the <a href="https://docs.microsoft.com/windows/desktop/tablet/peninputpanel-class">PenInputPanel</a> to a different control and change the <b>DefaultPanel</b> property when the focus changes to the new control, be sure to set the <b>DefaultPanel</b> property before setting the <a href="https://docs.microsoft.com/windows/desktop/api/peninputpanel/nf-peninputpanel-ipeninputpanel-get_attachededitwindow">AttachedEditWindow</a> property to ensure that the correct panel is displayed.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//peninputpanel/nf-peninputpanel-ipeninputpanel-get_defaultpanel
     */
    get_DefaultPanel() {
        result := ComCall(14, this, "int*", &pDefaultPanel := 0, "HRESULT")
        return pDefaultPanel
    }

    /**
     * Deprecated. The PenInputPanel has been replaced by the Text Input Panel (TIP).Gets or sets the default panel type used for input within the PenInputPanel object.
     * @remarks
     * 
     * <div class="alert"><b>Note</b>  The <b>DefaultPanel</b> property cannot be set to <a href="https://docs.microsoft.com/windows/desktop/api/peninputpanel/ne-peninputpanel-paneltype">Inactive</a>.</div>
     * <div> </div>
     * The <a href="https://docs.microsoft.com/windows/desktop/api/peninputpanel/ne-peninputpanel-paneltype">Handwriting</a> panel-also known as the writing pad-is the default input UI for a <a href="https://docs.microsoft.com/windows/desktop/tablet/peninputpanel-class">PenInputPanel</a>.
     * 
     * If the value of this property is <a href="https://docs.microsoft.com/windows/desktop/api/peninputpanel/ne-peninputpanel-paneltype">Default</a>, then the <a href="https://docs.microsoft.com/windows/desktop/tablet/peninputpanel-class">PenInputPanel</a> object uses the last panel type used for any pen input panel in any application. If all previous references to the pen input panel have been destroyed in all active applications, a new <b>PenInputPanel</b> object uses the <b>Handwriting</b> panel type.
     * 
     * If the panel is changed by setting the <a href="https://docs.microsoft.com/windows/desktop/api/peninputpanel/nf-peninputpanel-ipeninputpanel-get_currentpanel">CurrentPanel</a> property before the <a href="https://docs.microsoft.com/windows/desktop/tablet/peninputpanel-class">PenInputPanel</a> object becomes active for the first time, a <a href="https://docs.microsoft.com/windows/desktop/tablet/peninputpanel-panelchanged">PanelChanged</a> event occurs.
     * 
     * Setting the <b>DefaultPanel</b> property enables you to specify which type of panel shows by default in that instance of the <a href="https://docs.microsoft.com/windows/desktop/tablet/peninputpanel-class">PenInputPanel</a> object. If the value of this property is <a href="https://docs.microsoft.com/windows/desktop/api/peninputpanel/ne-peninputpanel-paneltype">Handwriting</a> or <b>Keyboard</b>, then each time the panel is made visible, it uses the handwriting or keyboard panel type, respectively.
     * 
     * If you re-attach the <a href="https://docs.microsoft.com/windows/desktop/tablet/peninputpanel-class">PenInputPanel</a> to a different control and change the <b>DefaultPanel</b> property when the focus changes to the new control, be sure to set the <b>DefaultPanel</b> property before setting the <a href="https://docs.microsoft.com/windows/desktop/api/peninputpanel/nf-peninputpanel-ipeninputpanel-get_attachededitwindow">AttachedEditWindow</a> property to ensure that the correct panel is displayed.
     * 
     * 
     * @param {Integer} DefaultPanel 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//peninputpanel/nf-peninputpanel-ipeninputpanel-put_defaultpanel
     */
    put_DefaultPanel(DefaultPanel) {
        result := ComCall(15, this, "int", DefaultPanel, "HRESULT")
        return result
    }

    /**
     * Deprecated. The PenInputPanel has been replaced by the Text Input Panel (TIP).Gets or sets a value that indicates whether the PenInputPanel object is visible.
     * @remarks
     * 
     * You can set the <b>Visible</b> property to <b>VARIANT_TRUE</b> only when the attached control has focus. Otherwise, setting this property generates an error.
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//peninputpanel/nf-peninputpanel-ipeninputpanel-get_visible
     */
    get_Visible() {
        result := ComCall(16, this, "short*", &Visible := 0, "HRESULT")
        return Visible
    }

    /**
     * 
     * @param {VARIANT_BOOL} Visible 
     * @returns {HRESULT} 
     */
    put_Visible(Visible) {
        result := ComCall(17, this, "short", Visible, "HRESULT")
        return result
    }

    /**
     * Deprecated. The PenInputPanel has been replaced by the Text Input Panel (TIP).Gets the vertical, or y-axis, location of the top edge of the PenInputPanel object, in screen coordinates.
     * @remarks
     * 
     * To explicitly override the automatic positioning behavior of the <a href="https://docs.microsoft.com/windows/desktop/tablet/peninputpanel-class">PenInputPanel</a> object, use the <a href="https://docs.microsoft.com/windows/desktop/api/peninputpanel/nf-peninputpanel-ipeninputpanel-get_left">Left</a> and <b>Top</b> properties of the object to determine the current position of the pen input panel. If the pen input panel is located on a section of the screen that should be visible, use the <a href="https://docs.microsoft.com/windows/desktop/api/peninputpanel/nf-peninputpanel-ipeninputpanel-moveto">MoveTo</a> method to relocate the pen input panel.
     * 
     * You can also override the automatic positioning behavior of the <a href="https://docs.microsoft.com/windows/desktop/tablet/peninputpanel-class">PenInputPanel</a> object by listening for the <i>Left</i> and <i>Top</i> parameters during a <a href="https://docs.microsoft.com/windows/desktop/tablet/peninputpanel-panelmoving">PanelMoving</a> event. If the pen input panel is located on a section of the screen that should be visible, use the <a href="https://docs.microsoft.com/windows/desktop/api/peninputpanel/nf-peninputpanel-ipeninputpanel-moveto">MoveTo</a> method to relocate the pen input panel.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//peninputpanel/nf-peninputpanel-ipeninputpanel-get_top
     */
    get_Top() {
        result := ComCall(18, this, "int*", &Top := 0, "HRESULT")
        return Top
    }

    /**
     * Deprecated. The PenInputPanel has been replaced by the Text Input Panel (TIP).Gets the horizontal, or x-axis, location of the left edge of the PenInputPanel object, in screen coordinates.
     * @remarks
     * 
     * To explicitly override the automatic positioning behavior of the <a href="https://docs.microsoft.com/windows/desktop/tablet/peninputpanel-class">PenInputPanel</a> object, use the <b>Left</b> and <a href="https://docs.microsoft.com/windows/desktop/api/peninputpanel/nf-peninputpanel-ipeninputpanel-get_top">Top</a> properties of the object to determine the current position of the pen input panel. If the pen input panel is located on a section of the screen that should be visible, use the <a href="https://docs.microsoft.com/windows/desktop/api/peninputpanel/nf-peninputpanel-ipeninputpanel-moveto">MoveTo</a> method to relocate the pen input panel.
     * 
     * You can also override the automatic positioning behavior of the <a href="https://docs.microsoft.com/windows/desktop/tablet/peninputpanel-class">PenInputPanel</a> object by listening for the <i>Left</i> and <i>Top</i> parameters during a <a href="https://docs.microsoft.com/windows/desktop/tablet/peninputpanel-panelmoving">PanelMoving</a> event. If the pen input panel is located on a section of the screen that should be visible, use the <a href="https://docs.microsoft.com/windows/desktop/api/peninputpanel/nf-peninputpanel-ipeninputpanel-moveto">MoveTo</a> method to relocate the pen input panel.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//peninputpanel/nf-peninputpanel-ipeninputpanel-get_left
     */
    get_Left() {
        result := ComCall(19, this, "int*", &Left := 0, "HRESULT")
        return Left
    }

    /**
     * Deprecated. The PenInputPanel has been replaced by the Text Input Panel (TIP).Gets the width of the pen input panel in client coordinates.
     * @remarks
     * 
     * The width of the <a href="https://docs.microsoft.com/windows/desktop/tablet/peninputpanel-class">PenInputPanel</a> object is dependent on the screen resolution for the particular Tablet PC. The default value at 96 dots per inch (dpi) is 570 pixels. The default value at 120 dpi is 712 pixels. The default value at 133 dpi is 790 pixels.
     * 
     * Starting with Microsoft Windows XP Tablet PC Edition 2005, the Tablet PC Input Panel allows the user to continue entering handwriting by automatically increasing the size of the Tablet PC Input Panel to accommodate new handwriting. The <a href="https://docs.microsoft.com/windows/desktop/api/peninputpanel/nf-peninputpanel-ipeninputpanel-get_height">Height</a> and <b>Width</b> properties do not update to reflect the new size as the Tablet PC Input Panel grows. These properties return the original size of the Tablet PC Input Panel. They also do not report the dimensions of the Tablet PC Input Panel hover target.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//peninputpanel/nf-peninputpanel-ipeninputpanel-get_width
     */
    get_Width() {
        result := ComCall(20, this, "int*", &Width := 0, "HRESULT")
        return Width
    }

    /**
     * Deprecated. The PenInputPanel has been replaced by the Text Input Panel (TIP).Gets the height of the pen input panel in client coordinates.
     * @remarks
     * 
     * The height of the pen input panel is dependent on the screen resolution for the particular Tablet PC. The panel height is the number of pixels equal to 1.25 inches. The default value at 96 dots per inch (dpi) is 157 pixels. The default value at 120 dpi is 196 pixels. The default value at 133 dpi is 218 pixels.
     * 
     * Starting with Microsoft Windows XP Tablet PC Edition 2005, the Tablet PC Input Panel allows the user to continue entering handwriting by automatically increasing the size of the Tablet PC Input Panel to accommodate new handwriting. The <b>Height</b> and <a href="https://docs.microsoft.com/windows/desktop/api/peninputpanel/nf-peninputpanel-ipeninputpanel-get_width">Width</a> properties do not update to reflect the new size as the Tablet PC Input Panel grows. These properties return the original size of the Tablet PC Input Panel. They also do not report the dimensions of the Tablet PC Input Panel hover target.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//peninputpanel/nf-peninputpanel-ipeninputpanel-get_height
     */
    get_Height() {
        result := ComCall(21, this, "int*", &Height := 0, "HRESULT")
        return Height
    }

    /**
     * Deprecated. The PenInputPanel has been replaced by the Text Input Panel (TIP).Gets or sets the offset between the closest horizontal edge of the pen input panel and the closest horizontal edge of the control to which it is attached.
     * @remarks
     * 
     * The default value is the equivalent of 1/16 inches in pixels, dependent on screen resolution settings. A value of 0 (zero) attaches the <a href="https://docs.microsoft.com/windows/desktop/tablet/peninputpanel-class">PenInputPanel</a> object directly to the bottom of the control. A value of -1 places it 1 pixel above the control.
     * 
     * If the new position of the <a href="https://docs.microsoft.com/windows/desktop/tablet/peninputpanel-class">PenInputPanel</a> causes the panel to appear outside the boundary of the screen working area, the panel is shifted toward the center of the working area so that the edges of the panel are adjacent to the nearest edges of the screen.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//peninputpanel/nf-peninputpanel-ipeninputpanel-get_verticaloffset
     */
    get_VerticalOffset() {
        result := ComCall(22, this, "int*", &VerticalOffset := 0, "HRESULT")
        return VerticalOffset
    }

    /**
     * Deprecated. The PenInputPanel has been replaced by the Text Input Panel (TIP).Gets or sets the offset between the closest horizontal edge of the pen input panel and the closest horizontal edge of the control to which it is attached.
     * @remarks
     * 
     * The default value is the equivalent of 1/16 inches in pixels, dependent on screen resolution settings. A value of 0 (zero) attaches the <a href="https://docs.microsoft.com/windows/desktop/tablet/peninputpanel-class">PenInputPanel</a> object directly to the bottom of the control. A value of -1 places it 1 pixel above the control.
     * 
     * If the new position of the <a href="https://docs.microsoft.com/windows/desktop/tablet/peninputpanel-class">PenInputPanel</a> causes the panel to appear outside the boundary of the screen working area, the panel is shifted toward the center of the working area so that the edges of the panel are adjacent to the nearest edges of the screen.
     * 
     * 
     * @param {Integer} VerticalOffset 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//peninputpanel/nf-peninputpanel-ipeninputpanel-put_verticaloffset
     */
    put_VerticalOffset(VerticalOffset) {
        result := ComCall(23, this, "int", VerticalOffset, "HRESULT")
        return result
    }

    /**
     * Deprecated. The PenInputPanel has been replaced by the Text Input Panel (TIP).Gets or sets the offset between the left edge of the pen input panel and the left edge of the control to which it is attached.
     * @remarks
     * 
     * The default value is the equivalent of 0.25 inches in pixels, dependent on screen resolution settings. A negative value indicates a shift to the left of the control. A positive value indicates a shift to the right. A zero value indicates that the left edge of the pen input panel is positioned exactly at the left edge of the control.
     * 
     * If the new position causes the panel to appear outside the boundary of the screen working area, the panel is shifted toward the center of the working area so that the edges of the panel are adjacent to the nearest edges of the screen.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//peninputpanel/nf-peninputpanel-ipeninputpanel-get_horizontaloffset
     */
    get_HorizontalOffset() {
        result := ComCall(24, this, "int*", &HorizontalOffset := 0, "HRESULT")
        return HorizontalOffset
    }

    /**
     * Deprecated. The PenInputPanel has been replaced by the Text Input Panel (TIP).Gets or sets the offset between the left edge of the pen input panel and the left edge of the control to which it is attached.
     * @remarks
     * 
     * The default value is the equivalent of 0.25 inches in pixels, dependent on screen resolution settings. A negative value indicates a shift to the left of the control. A positive value indicates a shift to the right. A zero value indicates that the left edge of the pen input panel is positioned exactly at the left edge of the control.
     * 
     * If the new position causes the panel to appear outside the boundary of the screen working area, the panel is shifted toward the center of the working area so that the edges of the panel are adjacent to the nearest edges of the screen.
     * 
     * 
     * @param {Integer} HorizontalOffset 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//peninputpanel/nf-peninputpanel-ipeninputpanel-put_horizontaloffset
     */
    put_HorizontalOffset(HorizontalOffset) {
        result := ComCall(25, this, "int", HorizontalOffset, "HRESULT")
        return result
    }

    /**
     * Deprecated. The PenInputPanel has been replaced by the Text Input Panel (TIP).Gets or sets a value that indicates whether the pen input panel appears when focus is set on the attached control by using the pen.
     * @remarks
     * 
     * When the <b>AutoShow</b> property is set to <b>VARIANT_FALSE</b>, Tablet PC Input Panel does not show until the <a href="https://docs.microsoft.com/windows/desktop/api/peninputpanel/nf-peninputpanel-ipeninputpanel-get_visible">Visible</a> property is set to <b>VARIANT_TRUE</b>. At this point, Tablet PC Input Panel is displayed but no hover target is shown.
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//peninputpanel/nf-peninputpanel-ipeninputpanel-get_autoshow
     */
    get_AutoShow() {
        result := ComCall(26, this, "short*", &pAutoShow := 0, "HRESULT")
        return pAutoShow
    }

    /**
     * Deprecated. The PenInputPanel has been replaced by the Text Input Panel (TIP).Gets or sets a value that indicates whether the pen input panel appears when focus is set on the attached control by using the pen.
     * @remarks
     * 
     * When the <b>AutoShow</b> property is set to <b>VARIANT_FALSE</b>, Tablet PC Input Panel does not show until the <a href="https://docs.microsoft.com/windows/desktop/api/peninputpanel/nf-peninputpanel-ipeninputpanel-get_visible">Visible</a> property is set to <b>VARIANT_TRUE</b>. At this point, Tablet PC Input Panel is displayed but no hover target is shown.
     * 
     * 
     * @param {VARIANT_BOOL} AutoShow 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//peninputpanel/nf-peninputpanel-ipeninputpanel-put_autoshow
     */
    put_AutoShow(AutoShow) {
        result := ComCall(27, this, "short", AutoShow, "HRESULT")
        return result
    }

    /**
     * Deprecated. The PenInputPanel has been replaced by the Text Input Panel (TIP).Sets the position of the PenInputPanel object to a static screen position.
     * @param {Integer} Left The new horizontal position in screen coordinates.
     * @param {Integer} Top The new vertical position in screen coordinates.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unexpected parameter or property type.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//peninputpanel/nf-peninputpanel-ipeninputpanel-moveto
     */
    MoveTo(Left, Top) {
        result := ComCall(28, this, "int", Left, "int", Top, "HRESULT")
        return result
    }

    /**
     * Deprecated. The PenInputPanel has been replaced by the Text Input Panel (TIP).Sends collected ink to the recognizer and posts the recognition result.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unexpected parameter or property type.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//peninputpanel/nf-peninputpanel-ipeninputpanel-commitpendinginput
     */
    CommitPendingInput() {
        result := ComCall(29, this, "HRESULT")
        return result
    }

    /**
     * Refresh is no longer available for use as of Windows XP Tablet PC Edition.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unexpected parameter or property type.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//peninputpanel/nf-peninputpanel-ipeninputpanel-refresh
     */
    Refresh() {
        result := ComCall(30, this, "HRESULT")
        return result
    }

    /**
     * Deprecated. Gets or sets a Boolean value that indicates whether the PenInputPanel object attempts to send text to the attached control through the Text Services Framework (TSF) and enables the use of the correction user interface.
     * @param {VARIANT_BOOL} Enable <b>TRUE</b> if the <a href="https://docs.microsoft.com/windows/desktop/tablet/peninputpanel-class">PenInputPanel</a> object should attempt to send text to the attached control using TSF and that the correction user interface should be enabled; otherwise <b>FALSE</b>. The default value is <b>TRUE</b>.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unexpected parameter or property type.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOINTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * TSF interfaces are not exposed on the attached control.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//peninputpanel/nf-peninputpanel-ipeninputpanel-enabletsf
     */
    EnableTsf(Enable) {
        result := ComCall(31, this, "short", Enable, "HRESULT")
        return result
    }
}
