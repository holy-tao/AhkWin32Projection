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
     * 
     * @returns {HWND} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-itextinputpanel-get_attachededitwindow
     */
    get_AttachedEditWindow() {
        AttachedEditWindow := HWND()
        result := ComCall(3, this, "ptr", AttachedEditWindow, "HRESULT")
        return AttachedEditWindow
    }

    /**
     * 
     * @param {HWND} AttachedEditWindow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-itextinputpanel-put_attachededitwindow
     */
    put_AttachedEditWindow(AttachedEditWindow) {
        AttachedEditWindow := AttachedEditWindow is Win32Handle ? NumGet(AttachedEditWindow, "ptr") : AttachedEditWindow

        result := ComCall(4, this, "ptr", AttachedEditWindow, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-itextinputpanel-get_currentinteractionmode
     */
    get_CurrentInteractionMode() {
        result := ComCall(5, this, "int*", &CurrentInteractionMode := 0, "HRESULT")
        return CurrentInteractionMode
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-itextinputpanel-get_defaultinplacestate
     */
    get_DefaultInPlaceState() {
        result := ComCall(6, this, "int*", &State := 0, "HRESULT")
        return State
    }

    /**
     * 
     * @param {Integer} State 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-itextinputpanel-put_defaultinplacestate
     */
    put_DefaultInPlaceState(State) {
        result := ComCall(7, this, "int", State, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-itextinputpanel-get_currentinplacestate
     */
    get_CurrentInPlaceState() {
        result := ComCall(8, this, "int*", &State := 0, "HRESULT")
        return State
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-itextinputpanel-get_defaultinputarea
     */
    get_DefaultInputArea() {
        result := ComCall(9, this, "int*", &Area := 0, "HRESULT")
        return Area
    }

    /**
     * 
     * @param {Integer} Area 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-itextinputpanel-put_defaultinputarea
     */
    put_DefaultInputArea(Area) {
        result := ComCall(10, this, "int", Area, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-itextinputpanel-get_currentinputarea
     */
    get_CurrentInputArea() {
        result := ComCall(11, this, "int*", &Area := 0, "HRESULT")
        return Area
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-itextinputpanel-get_currentcorrectionmode
     */
    get_CurrentCorrectionMode() {
        result := ComCall(12, this, "int*", &Mode := 0, "HRESULT")
        return Mode
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-itextinputpanel-get_preferredinplacedirection
     */
    get_PreferredInPlaceDirection() {
        result := ComCall(13, this, "int*", &Direction := 0, "HRESULT")
        return Direction
    }

    /**
     * 
     * @param {Integer} Direction 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-itextinputpanel-put_preferredinplacedirection
     */
    put_PreferredInPlaceDirection(Direction) {
        result := ComCall(14, this, "int", Direction, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-itextinputpanel-get_expandpostinsertioncorrection
     */
    get_ExpandPostInsertionCorrection() {
        result := ComCall(15, this, "int*", &Expand := 0, "HRESULT")
        return Expand
    }

    /**
     * 
     * @param {BOOL} Expand 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-itextinputpanel-put_expandpostinsertioncorrection
     */
    put_ExpandPostInsertionCorrection(Expand) {
        result := ComCall(16, this, "int", Expand, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-itextinputpanel-get_inplacevisibleonfocus
     */
    get_InPlaceVisibleOnFocus() {
        result := ComCall(17, this, "int*", &Visible := 0, "HRESULT")
        return Visible
    }

    /**
     * 
     * @param {BOOL} Visible 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-itextinputpanel-put_inplacevisibleonfocus
     */
    put_InPlaceVisibleOnFocus(Visible) {
        result := ComCall(18, this, "int", Visible, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {RECT} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-itextinputpanel-get_inplaceboundingrectangle
     */
    get_InPlaceBoundingRectangle() {
        BoundingRectangle := RECT()
        result := ComCall(19, this, "ptr", BoundingRectangle, "HRESULT")
        return BoundingRectangle
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-itextinputpanel-get_popupcorrectionheight
     */
    get_PopUpCorrectionHeight() {
        result := ComCall(20, this, "int*", &Height := 0, "HRESULT")
        return Height
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-itextinputpanel-get_popdowncorrectionheight
     */
    get_PopDownCorrectionHeight() {
        result := ComCall(21, this, "int*", &Height := 0, "HRESULT")
        return Height
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-itextinputpanel-commitpendinginput
     */
    CommitPendingInput() {
        result := ComCall(22, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} Visible 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-itextinputpanel-setinplacevisibility
     */
    SetInPlaceVisibility(Visible) {
        result := ComCall(23, this, "int", Visible, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} xPosition 
     * @param {Integer} yPosition 
     * @param {Integer} position 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-itextinputpanel-setinplaceposition
     */
    SetInPlacePosition(xPosition, yPosition, position) {
        result := ComCall(24, this, "int", xPosition, "int", yPosition, "int", position, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} xPosition 
     * @param {Integer} yPosition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-itextinputpanel-setinplacehovertargetposition
     */
    SetInPlaceHoverTargetPosition(xPosition, yPosition) {
        result := ComCall(25, this, "int", xPosition, "int", yPosition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITextInputPanelEventSink} EventSink 
     * @param {Integer} EventMask 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-itextinputpanel-advise
     */
    Advise(EventSink, EventMask) {
        result := ComCall(26, this, "ptr", EventSink, "uint", EventMask, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITextInputPanelEventSink} EventSink 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-itextinputpanel-unadvise
     */
    Unadvise(EventSink) {
        result := ComCall(27, this, "ptr", EventSink, "HRESULT")
        return result
    }
}
