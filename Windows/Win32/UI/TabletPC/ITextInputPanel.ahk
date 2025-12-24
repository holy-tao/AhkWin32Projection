#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\..\Foundation\RECT.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides control of appearance and behavior of the Tablet PC Input Panel.
 * @remarks
 * 
 * <b>ITextInputPanel Interface</b> gives application developers more control and information about Input Panel's state than <a href="https://docs.microsoft.com/windows/desktop/tablet/peninputpanel-class">PenInputPanel Class</a>. <b>ITextInputPanel Interface</b> replaces the <b>PenInputPanel Class</b> as the preferred mechanism for programmatically interacting with the Input Panel.
 * 
 * <b>ITextInputPanel Interface</b> provides:
 * 
 * <ul>
 * <li>A complete control over the positioning of the in-place Input Panel when the application has focus.</li>
 * <li>An access to the ink objects from the Input Panel text insertion in addition to the recognized text.</li>
 * <li>A set of properties that correspond exactly to Input Panel's capabilities giving both the ability to know Input Panel's current state and to customize Input Panel's configuration.</li>
 * </ul>
 * The <b>ITextInputPanel Interface</b> continues to provide nearly all of the programmatic capabilities of the <a href="https://docs.microsoft.com/windows/desktop/tablet/peninputpanel-class">PenInputPanel Class</a> thus superseding the <b>PenInputPanel Class</b>.
 * 
 * This element is declared in Peninputpanel.h.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//peninputpanel/nn-peninputpanel-itextinputpanel
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class ITextInputPanel extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextInputPanel
     * @type {Guid}
     */
    static IID => Guid("{6b6a65a5-6af3-46c2-b6ea-56cd1f80df71}")

    /**
     * The class identifier for TextInputPanel
     * @type {Guid}
     */
    static CLSID => Guid("{f9b189d7-228b-4f2b-8650-b97f59e02c8c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AttachedEditWindow", "put_AttachedEditWindow", "get_CurrentInteractionMode", "get_DefaultInPlaceState", "put_DefaultInPlaceState", "get_CurrentInPlaceState", "get_DefaultInputArea", "put_DefaultInputArea", "get_CurrentInputArea", "get_CurrentCorrectionMode", "get_PreferredInPlaceDirection", "put_PreferredInPlaceDirection", "get_ExpandPostInsertionCorrection", "put_ExpandPostInsertionCorrection", "get_InPlaceVisibleOnFocus", "put_InPlaceVisibleOnFocus", "get_InPlaceBoundingRectangle", "get_PopUpCorrectionHeight", "get_PopDownCorrectionHeight", "CommitPendingInput", "SetInPlaceVisibility", "SetInPlacePosition", "SetInPlaceHoverTargetPosition", "Advise", "Unadvise"]

    /**
     * @type {HWND} 
     */
    AttachedEditWindow {
        get => this.get_AttachedEditWindow()
        set => this.put_AttachedEditWindow(value)
    }

    /**
     * @type {Integer} 
     */
    CurrentInteractionMode {
        get => this.get_CurrentInteractionMode()
    }

    /**
     * @type {Integer} 
     */
    DefaultInPlaceState {
        get => this.get_DefaultInPlaceState()
        set => this.put_DefaultInPlaceState(value)
    }

    /**
     * @type {Integer} 
     */
    CurrentInPlaceState {
        get => this.get_CurrentInPlaceState()
    }

    /**
     * @type {Integer} 
     */
    DefaultInputArea {
        get => this.get_DefaultInputArea()
        set => this.put_DefaultInputArea(value)
    }

    /**
     * @type {Integer} 
     */
    CurrentInputArea {
        get => this.get_CurrentInputArea()
    }

    /**
     * @type {Integer} 
     */
    CurrentCorrectionMode {
        get => this.get_CurrentCorrectionMode()
    }

    /**
     * @type {Integer} 
     */
    PreferredInPlaceDirection {
        get => this.get_PreferredInPlaceDirection()
        set => this.put_PreferredInPlaceDirection(value)
    }

    /**
     * @type {BOOL} 
     */
    ExpandPostInsertionCorrection {
        get => this.get_ExpandPostInsertionCorrection()
        set => this.put_ExpandPostInsertionCorrection(value)
    }

    /**
     * @type {BOOL} 
     */
    InPlaceVisibleOnFocus {
        get => this.get_InPlaceVisibleOnFocus()
        set => this.put_InPlaceVisibleOnFocus(value)
    }

    /**
     * @type {RECT} 
     */
    InPlaceBoundingRectangle {
        get => this.get_InPlaceBoundingRectangle()
    }

    /**
     * @type {Integer} 
     */
    PopUpCorrectionHeight {
        get => this.get_PopUpCorrectionHeight()
    }

    /**
     * @type {Integer} 
     */
    PopDownCorrectionHeight {
        get => this.get_PopDownCorrectionHeight()
    }

    /**
     * Gets or sets the window handle of the object to which the ITextInputPanel object is attached.
     * @remarks
     * 
     * The window handle of an object may change.
     * 
     * 
     * 
     * @returns {HWND} 
     * @see https://docs.microsoft.com/windows/win32/api//peninputpanel/nf-peninputpanel-itextinputpanel-get_attachededitwindow
     */
    get_AttachedEditWindow() {
        AttachedEditWindow := HWND()
        result := ComCall(3, this, "ptr", AttachedEditWindow, "HRESULT")
        return AttachedEditWindow
    }

    /**
     * Gets or sets the window handle of the object to which the ITextInputPanel object is attached.
     * @remarks
     * 
     * The window handle of an object may change.
     * 
     * 
     * 
     * @param {HWND} AttachedEditWindow 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//peninputpanel/nf-peninputpanel-itextinputpanel-put_attachededitwindow
     */
    put_AttachedEditWindow(AttachedEditWindow) {
        AttachedEditWindow := AttachedEditWindow is Win32Handle ? NumGet(AttachedEditWindow, "ptr") : AttachedEditWindow

        result := ComCall(4, this, "ptr", AttachedEditWindow, "HRESULT")
        return result
    }

    /**
     * Gets the positioning of the Tablet PC Input Panel as specified by the InteractionMode Enumeration.
     * @remarks
     * 
     * The current interaction mode is dictated by the user. However, the <a href="https://docs.microsoft.com/windows/win32/api/peninputpanel/ne-peninputpanel-interactionmode">InteractionMode_InPlace</a> mode can be disabled by the application on a per field basis.
     * 
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//peninputpanel/nf-peninputpanel-itextinputpanel-get_currentinteractionmode
     */
    get_CurrentInteractionMode() {
        result := ComCall(5, this, "int*", &CurrentInteractionMode := 0, "HRESULT")
        return CurrentInteractionMode
    }

    /**
     * Gets or sets the default in-place state as specified by the InPlaceState Enumeration.
     * @remarks
     * 
     * Set this property to <a href="https://docs.microsoft.com/windows/win32/api/peninputpanel/ne-peninputpanel-inplacestate">InPlaceState_Expanded</a> to have the Input Panel open without requiring the user to tap the hover target. Setting the default state to <b>InPlaceState_HoverTarget</b> overrides the Input Panel's heuristics for remaining expanded. When switching between fields, setting the default forces Input Panel to the collapsed or hover state, after a focus change. The system default is <b>InPlaceState_Auto</b>.
     * 
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//peninputpanel/nf-peninputpanel-itextinputpanel-get_defaultinplacestate
     */
    get_DefaultInPlaceState() {
        result := ComCall(6, this, "int*", &State := 0, "HRESULT")
        return State
    }

    /**
     * Gets or sets the default in-place state as specified by the InPlaceState Enumeration.
     * @remarks
     * 
     * Set this property to <a href="https://docs.microsoft.com/windows/win32/api/peninputpanel/ne-peninputpanel-inplacestate">InPlaceState_Expanded</a> to have the Input Panel open without requiring the user to tap the hover target. Setting the default state to <b>InPlaceState_HoverTarget</b> overrides the Input Panel's heuristics for remaining expanded. When switching between fields, setting the default forces Input Panel to the collapsed or hover state, after a focus change. The system default is <b>InPlaceState_Auto</b>.
     * 
     * 
     * 
     * @param {Integer} State 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//peninputpanel/nf-peninputpanel-itextinputpanel-put_defaultinplacestate
     */
    put_DefaultInPlaceState(State) {
        result := ComCall(7, this, "int", State, "HRESULT")
        return result
    }

    /**
     * Gets the current in-place state as specified by the InPlaceState Enumeration.
     * @remarks
     * 
     * When the Tablet PC Input Panel is closed or hidden, the current in-place state is reset to the default state, unless the default state is <a href="https://docs.microsoft.com/windows/win32/api/peninputpanel/ne-peninputpanel-inplacestate">Auto</a>, in which case, the current in-place state is reset to <b>Hover</b>.
     * 
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//peninputpanel/nf-peninputpanel-itextinputpanel-get_currentinplacestate
     */
    get_CurrentInPlaceState() {
        result := ComCall(8, this, "int*", &State := 0, "HRESULT")
        return State
    }

    /**
     * Gets or sets the default input area as specified by the PanelInputArea Enumeration.
     * @remarks
     * 
     * The system default is <a href="https://docs.microsoft.com/windows/win32/api/peninputpanel/ne-peninputpanel-panelinputarea">PanelInputArea_Auto</a>, except in password fields where the system default is <b>PanelInputArea_Keyboard</b>. Setting the default input area overrides the system default in all cases, except when an input area is unavailable because the current recognizer does not support that mode or because there is no recognizer for the current input language.
     * 
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//peninputpanel/nf-peninputpanel-itextinputpanel-get_defaultinputarea
     */
    get_DefaultInputArea() {
        result := ComCall(9, this, "int*", &Area := 0, "HRESULT")
        return Area
    }

    /**
     * Gets or sets the default input area as specified by the PanelInputArea Enumeration.
     * @remarks
     * 
     * The system default is <a href="https://docs.microsoft.com/windows/win32/api/peninputpanel/ne-peninputpanel-panelinputarea">PanelInputArea_Auto</a>, except in password fields where the system default is <b>PanelInputArea_Keyboard</b>. Setting the default input area overrides the system default in all cases, except when an input area is unavailable because the current recognizer does not support that mode or because there is no recognizer for the current input language.
     * 
     * 
     * 
     * @param {Integer} Area 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//peninputpanel/nf-peninputpanel-itextinputpanel-put_defaultinputarea
     */
    put_DefaultInputArea(Area) {
        result := ComCall(10, this, "int", Area, "HRESULT")
        return result
    }

    /**
     * Gets the current input area as specified by the PanelInputArea Enumeration.
     * @remarks
     * 
     * The current input area is different from the default input area when the user has explicitly switched input areas. It is also different if the default input area is unavailable because the current recognizer does not support that mode or because there is no recognizer for the current input language. When the Tablet PC Input Panel is closed or hidden, the current input areas is reset to equal the default input area, unless the default state is <a href="https://docs.microsoft.com/windows/win32/api/peninputpanel/ne-peninputpanel-panelinputarea">Auto</a>, in which case, the current input area is not reset and represents the last visible input area.
     * 
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//peninputpanel/nf-peninputpanel-itextinputpanel-get_currentinputarea
     */
    get_CurrentInputArea() {
        result := ComCall(11, this, "int*", &Area := 0, "HRESULT")
        return Area
    }

    /**
     * Gets the current correction comb mode as specified by the CorrectionMode Enumeration.
     * @remarks
     * 
     * <div class="alert"><b>Note</b>  In Windows 7, the behavior of the ITextInputPanel interface has changed and the <i>Mode</i> parameter will always be set to "no correction" when returned.
     * 		</div>
     * <div> </div>
     * When the Tablet PC Input Panel or the correction comb is not visible, the current mode is <a href="https://docs.microsoft.com/windows/win32/api/peninputpanel/ne-peninputpanel-correctionmode">CorrectionMode_NotVisible</a>.
     * 
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//peninputpanel/nf-peninputpanel-itextinputpanel-get_currentcorrectionmode
     */
    get_CurrentCorrectionMode() {
        result := ComCall(12, this, "int*", &Mode := 0, "HRESULT")
        return Mode
    }

    /**
     * Gets or sets the preferred direction of the in-place Input Panel relative to the text entry field.
     * @remarks
     * 
     * An application can specify whether the in-place Input Panel defaults to appearing above or below a text entry field. To do this the application can set the <b>ITextInputPanel::PreferredInPlaceDirection Property</b> to <a href="https://docs.microsoft.com/windows/win32/api/peninputpanel/ne-peninputpanel-inplacedirection">InPlaceDirection_Bottom</a> or <b>InPlaceDirection_Top</b>. <b>ITextInputPanel::PreferredInPlaceDirection Property</b> is a preference because the in-place Input Panel overrides the preference set by the application when necessary to keep Input Panel on the screen. The system default is to position the in-place Input Panel below a text field when possible and otherwise to position it above. Setting the <b>PreferredInPlaceDirection</b> to <b>InPlaceDirection_Auto</b> restores the system default.
     * 
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//peninputpanel/nf-peninputpanel-itextinputpanel-get_preferredinplacedirection
     */
    get_PreferredInPlaceDirection() {
        result := ComCall(13, this, "int*", &Direction := 0, "HRESULT")
        return Direction
    }

    /**
     * Gets or sets the preferred direction of the in-place Input Panel relative to the text entry field.
     * @remarks
     * 
     * An application can specify whether the in-place Input Panel defaults to appearing above or below a text entry field. To do this the application can set the <b>ITextInputPanel::PreferredInPlaceDirection Property</b> to <a href="https://docs.microsoft.com/windows/win32/api/peninputpanel/ne-peninputpanel-inplacedirection">InPlaceDirection_Bottom</a> or <b>InPlaceDirection_Top</b>. <b>ITextInputPanel::PreferredInPlaceDirection Property</b> is a preference because the in-place Input Panel overrides the preference set by the application when necessary to keep Input Panel on the screen. The system default is to position the in-place Input Panel below a text field when possible and otherwise to position it above. Setting the <b>PreferredInPlaceDirection</b> to <b>InPlaceDirection_Auto</b> restores the system default.
     * 
     * 
     * 
     * @param {Integer} Direction 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//peninputpanel/nf-peninputpanel-itextinputpanel-put_preferredinplacedirection
     */
    put_PreferredInPlaceDirection(Direction) {
        result := ComCall(14, this, "int", Direction, "HRESULT")
        return result
    }

    /**
     * Gets or sets a value that indicates whether the correction comb on the Tablet PC Input Panel is automatically expanded.
     * @remarks
     * 
     * <div class="alert"><b>Note</b>  In Windows 7, the behavior of the <a href="https://docs.microsoft.com/windows/desktop/api/peninputpanel/nn-peninputpanel-itextinputpanel">ITextInputPanel</a> interface has changed. The <i>Expand</i> parameter will always be set to "not expanded" when returned. Setting this property no longer performs any operations.</div>
     * <div> </div>
     * 
     * 
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//peninputpanel/nf-peninputpanel-itextinputpanel-get_expandpostinsertioncorrection
     */
    get_ExpandPostInsertionCorrection() {
        result := ComCall(15, this, "int*", &Expand := 0, "HRESULT")
        return Expand
    }

    /**
     * Gets or sets a value that indicates whether the correction comb on the Tablet PC Input Panel is automatically expanded.
     * @remarks
     * 
     * <div class="alert"><b>Note</b>  In Windows 7, the behavior of the <a href="https://docs.microsoft.com/windows/desktop/api/peninputpanel/nn-peninputpanel-itextinputpanel">ITextInputPanel</a> interface has changed. The <i>Expand</i> parameter will always be set to "not expanded" when returned. Setting this property no longer performs any operations.</div>
     * <div> </div>
     * 
     * 
     * @param {BOOL} Expand 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//peninputpanel/nf-peninputpanel-itextinputpanel-put_expandpostinsertioncorrection
     */
    put_ExpandPostInsertionCorrection(Expand) {
        result := ComCall(16, this, "int", Expand, "HRESULT")
        return result
    }

    /**
     * Gets or sets a value that indicates whether the Tablet PC Input Panel is displayed automatically when the window to which it is attached gets focus.
     * @remarks
     * 
     * If <b>ITextInputPanel::InPlaceVisibleOnFocus Property</b> is set to <b>TRUE</b> for a control, then when the control gains focus, the Tablet PC Input Panel automatically shows in the default <a href="https://docs.microsoft.com/windows/win32/api/peninputpanel/ne-peninputpanel-inplacestate">InPlaceState Enumeration</a> provided it is a legal operation.
     * 
     * It is possible to prevent the in-place Input Panel and the Input Panel Icon from ever appearing by setting the <b>ITextInputPanel::InPlaceVisibleOnFocus Property</b> to <b>FALSE</b>. Setting it to <b>TRUE</b> reverts it to the system default of appearing when possible, provided it has not been disabled by the user or Group Policy. This option is useful for applications that include custom text entry solutions as an alternative to the Input Panel.
     * 
     * The default value is <b>TRUE</b>.
     * 
     * 
     * 
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//peninputpanel/nf-peninputpanel-itextinputpanel-get_inplacevisibleonfocus
     */
    get_InPlaceVisibleOnFocus() {
        result := ComCall(17, this, "int*", &Visible := 0, "HRESULT")
        return Visible
    }

    /**
     * Gets or sets a value that indicates whether the Tablet PC Input Panel is displayed automatically when the window to which it is attached gets focus.
     * @remarks
     * 
     * If <b>ITextInputPanel::InPlaceVisibleOnFocus Property</b> is set to <b>TRUE</b> for a control, then when the control gains focus, the Tablet PC Input Panel automatically shows in the default <a href="https://docs.microsoft.com/windows/win32/api/peninputpanel/ne-peninputpanel-inplacestate">InPlaceState Enumeration</a> provided it is a legal operation.
     * 
     * It is possible to prevent the in-place Input Panel and the Input Panel Icon from ever appearing by setting the <b>ITextInputPanel::InPlaceVisibleOnFocus Property</b> to <b>FALSE</b>. Setting it to <b>TRUE</b> reverts it to the system default of appearing when possible, provided it has not been disabled by the user or Group Policy. This option is useful for applications that include custom text entry solutions as an alternative to the Input Panel.
     * 
     * The default value is <b>TRUE</b>.
     * 
     * 
     * 
     * @param {BOOL} Visible 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//peninputpanel/nf-peninputpanel-itextinputpanel-put_inplacevisibleonfocus
     */
    put_InPlaceVisibleOnFocus(Visible) {
        result := ComCall(18, this, "int", Visible, "HRESULT")
        return result
    }

    /**
     * Gets the bounding rectangle for Tablet PC Input Panel.
     * @remarks
     * 
     * If the Writing Pad or Character Pad is active, then the height of the Insert button is included in the bounding rectangle for the in-place Input Panel. The bounding rectangle does not include the height of the correction comb. When the in-place Input Panel auto grows, the <a href="https://docs.microsoft.com/windows/desktop/api/peninputpanel/nf-peninputpanel-itextinputpaneleventsink-inplacesizechanging">ITextInputPanelEventSink::InPlaceSizeChanging Method</a>/<a href="https://docs.microsoft.com/windows/desktop/api/peninputpanel/nf-peninputpanel-itextinputpaneleventsink-inplacesizechanged">ITextInputPanelEventSink::InPlaceSizeChanged Method</a> event pair is fired and the value of this property is updated to include the additional writing area or writing line.
     * 
     * 
     * 
     * @returns {RECT} 
     * @see https://docs.microsoft.com/windows/win32/api//peninputpanel/nf-peninputpanel-itextinputpanel-get_inplaceboundingrectangle
     */
    get_InPlaceBoundingRectangle() {
        BoundingRectangle := RECT()
        result := ComCall(19, this, "ptr", BoundingRectangle, "HRESULT")
        return BoundingRectangle
    }

    /**
     * Gets the height of the Post-Insertion correction comb when it is positioned above Input Panel.
     * @remarks
     * 
     * <div class="alert"><b>Note</b>  In Windows 7, this function will always return the height as 0.
     * 		</div>
     * <div> </div>
     * To get the full height of the in-place Input Panel with the Post-Insertion correction comb popped-up, add the height of the <a href="https://docs.microsoft.com/windows/desktop/api/peninputpanel/nf-peninputpanel-itextinputpanel-get_inplaceboundingrectangle">ITextInputPanel::InPlaceBoundingRectangle Property</a> to the <b>ITextInputPanel::PopUpCorrectionHeight Property</b>.
     * 
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//peninputpanel/nf-peninputpanel-itextinputpanel-get_popupcorrectionheight
     */
    get_PopUpCorrectionHeight() {
        result := ComCall(20, this, "int*", &Height := 0, "HRESULT")
        return Height
    }

    /**
     * Gets the height of the Post-Insertion correction comb when it is positioned below Input Panel.
     * @remarks
     * 
     * <div class="alert"><b>Note</b>  In Windows 7, this function will always return the height as 0.
     * 		</div>
     * <div> </div>
     * To get the full height of the in-place Input Panel with the Post-Insertion correction comb popped-down, add the height of the <a href="https://docs.microsoft.com/windows/desktop/api/peninputpanel/nf-peninputpanel-itextinputpanel-get_inplaceboundingrectangle">ITextInputPanel::InPlaceBoundingRectangle Property</a> to the <b>ITextInputPanel::PopDownCorrectionHeight Property</b>.
     * 
     * <div class="alert"><b>Note</b>  The <a href="https://docs.microsoft.com/windows/desktop/api/peninputpanel/nf-peninputpanel-itextinputpanel-get_popupcorrectionheight">ITextInputPanel::PopUpCorrectionHeight Property</a> is greater than or equal to the <b>ITextInputPanel::PopDownCorrectionHeight Property</b>.</div>
     * <div> </div>
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//peninputpanel/nf-peninputpanel-itextinputpanel-get_popdowncorrectionheight
     */
    get_PopDownCorrectionHeight() {
        result := ComCall(21, this, "int*", &Height := 0, "HRESULT")
        return Height
    }

    /**
     * Sends collected ink to the recognizer and posts the recognition result.
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
     * @see https://docs.microsoft.com/windows/win32/api//peninputpanel/nf-peninputpanel-itextinputpanel-commitpendinginput
     */
    CommitPendingInput() {
        result := ComCall(22, this, "HRESULT")
        return result
    }

    /**
     * Shows or hides the Tablet PC Input Panel.
     * @param {BOOL} Visible <b>TRUE</b> to show the Input Panel; <b>FALSE</b> to hide the Input Panel.
     * @returns {HRESULT} If the Input Panel can display, the method returns <b>S_OK</b>, otherwise <b>E_FAIL</b>. See the Remarks section for more information about when the Input Panel can and cannot be affected by the <b>ITextInputPanel::SetInPlaceVisibility Method</b>.
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
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//peninputpanel/nf-peninputpanel-itextinputpanel-setinplacevisibility
     */
    SetInPlaceVisibility(Visible) {
        result := ComCall(23, this, "int", Visible, "HRESULT")
        return result
    }

    /**
     * Explicitly positions the Tablet PC Input Panel in screen coordinates.
     * @param {Integer} xPosition The horizontal x-coordinate for the top left corner of the Input Panel, with no correction comb visible.
     * @param {Integer} yPosition The vertical y-coordinate for the top left corner of the Input Panel, with no correction comb visible.
     * @param {Integer} position The direction the post insertion correction comb should pop up in, as defined by the <a href="https://docs.microsoft.com/windows/win32/api/peninputpanel/ne-peninputpanel-correctionposition">CorrectionPosition</a> enumeration.
     * @returns {HRESULT} Returns <b>false</b> when the Input Panel is open (docked or floating) and cannot be moved; otherwise it returns <b>true</b>.
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
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//peninputpanel/nf-peninputpanel-itextinputpanel-setinplaceposition
     */
    SetInPlacePosition(xPosition, yPosition, position) {
        result := ComCall(24, this, "int", xPosition, "int", yPosition, "int", position, "HRESULT")
        return result
    }

    /**
     * Explicitly positions the Tablet PC Input Panel hover target in screen coordinates.
     * @param {Integer} xPosition The horizontal x-coordinate for the top left corner of the hover target, with no correction comb visible.
     * @param {Integer} yPosition The vertical y-coordinate for the top left corner of the hover target, with no correction comb visible.
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
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//peninputpanel/nf-peninputpanel-itextinputpanel-setinplacehovertargetposition
     */
    SetInPlaceHoverTargetPosition(xPosition, yPosition) {
        result := ComCall(25, this, "int", xPosition, "int", yPosition, "HRESULT")
        return result
    }

    /**
     * Establishes an advisory connection between the Tablet PC Input Panel and the specified sink object.
     * @param {ITextInputPanelEventSink} EventSink Reference to the sink object to receive event notifications from the Input Panel.
     * @param {Integer} EventMask A bitwise value of the <a href="https://docs.microsoft.com/windows/win32/api/peninputpanel/ne-peninputpanel-eventmask">EventMask Enumeration</a>, indicating the events of interest.
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
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//peninputpanel/nf-peninputpanel-itextinputpanel-advise
     */
    Advise(EventSink, EventMask) {
        result := ComCall(26, this, "ptr", EventSink, "uint", EventMask, "HRESULT")
        return result
    }

    /**
     * Terminates an advisory connection previously established through ITextInputPanel::Advise Method.
     * @param {ITextInputPanelEventSink} EventSink Reference to the sink object currently receiving event notifications from the Input Panel.
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
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//peninputpanel/nf-peninputpanel-itextinputpanel-unadvise
     */
    Unadvise(EventSink) {
        result := ComCall(27, this, "ptr", EventSink, "HRESULT")
        return result
    }
}
