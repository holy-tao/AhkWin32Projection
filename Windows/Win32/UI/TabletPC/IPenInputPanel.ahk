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
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-ipeninputpanel-get_busy
     */
    get_Busy() {
        result := ComCall(7, this, "short*", &Busy := 0, "HRESULT")
        return Busy
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-ipeninputpanel-get_factoid
     */
    get_Factoid() {
        Factoid := BSTR()
        result := ComCall(8, this, "ptr", Factoid, "HRESULT")
        return Factoid
    }

    /**
     * 
     * @param {BSTR} Factoid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-ipeninputpanel-put_factoid
     */
    put_Factoid(Factoid) {
        Factoid := Factoid is String ? BSTR.Alloc(Factoid).Value : Factoid

        result := ComCall(9, this, "ptr", Factoid, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-ipeninputpanel-get_attachededitwindow
     */
    get_AttachedEditWindow() {
        result := ComCall(10, this, "int*", &AttachedEditWindow := 0, "HRESULT")
        return AttachedEditWindow
    }

    /**
     * 
     * @param {Integer} AttachedEditWindow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-ipeninputpanel-put_attachededitwindow
     */
    put_AttachedEditWindow(AttachedEditWindow) {
        result := ComCall(11, this, "int", AttachedEditWindow, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-ipeninputpanel-get_currentpanel
     */
    get_CurrentPanel() {
        result := ComCall(12, this, "int*", &CurrentPanel := 0, "HRESULT")
        return CurrentPanel
    }

    /**
     * 
     * @param {Integer} CurrentPanel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-ipeninputpanel-put_currentpanel
     */
    put_CurrentPanel(CurrentPanel) {
        result := ComCall(13, this, "int", CurrentPanel, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-ipeninputpanel-get_defaultpanel
     */
    get_DefaultPanel() {
        result := ComCall(14, this, "int*", &pDefaultPanel := 0, "HRESULT")
        return pDefaultPanel
    }

    /**
     * 
     * @param {Integer} DefaultPanel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-ipeninputpanel-put_defaultpanel
     */
    put_DefaultPanel(DefaultPanel) {
        result := ComCall(15, this, "int", DefaultPanel, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-ipeninputpanel-get_visible
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
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-ipeninputpanel-get_top
     */
    get_Top() {
        result := ComCall(18, this, "int*", &Top := 0, "HRESULT")
        return Top
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-ipeninputpanel-get_left
     */
    get_Left() {
        result := ComCall(19, this, "int*", &Left := 0, "HRESULT")
        return Left
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-ipeninputpanel-get_width
     */
    get_Width() {
        result := ComCall(20, this, "int*", &Width := 0, "HRESULT")
        return Width
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-ipeninputpanel-get_height
     */
    get_Height() {
        result := ComCall(21, this, "int*", &Height := 0, "HRESULT")
        return Height
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-ipeninputpanel-get_verticaloffset
     */
    get_VerticalOffset() {
        result := ComCall(22, this, "int*", &VerticalOffset := 0, "HRESULT")
        return VerticalOffset
    }

    /**
     * 
     * @param {Integer} VerticalOffset 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-ipeninputpanel-put_verticaloffset
     */
    put_VerticalOffset(VerticalOffset) {
        result := ComCall(23, this, "int", VerticalOffset, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-ipeninputpanel-get_horizontaloffset
     */
    get_HorizontalOffset() {
        result := ComCall(24, this, "int*", &HorizontalOffset := 0, "HRESULT")
        return HorizontalOffset
    }

    /**
     * 
     * @param {Integer} HorizontalOffset 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-ipeninputpanel-put_horizontaloffset
     */
    put_HorizontalOffset(HorizontalOffset) {
        result := ComCall(25, this, "int", HorizontalOffset, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-ipeninputpanel-get_autoshow
     */
    get_AutoShow() {
        result := ComCall(26, this, "short*", &pAutoShow := 0, "HRESULT")
        return pAutoShow
    }

    /**
     * 
     * @param {VARIANT_BOOL} AutoShow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-ipeninputpanel-put_autoshow
     */
    put_AutoShow(AutoShow) {
        result := ComCall(27, this, "short", AutoShow, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Left 
     * @param {Integer} Top 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-ipeninputpanel-moveto
     */
    MoveTo(Left, Top) {
        result := ComCall(28, this, "int", Left, "int", Top, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-ipeninputpanel-commitpendinginput
     */
    CommitPendingInput() {
        result := ComCall(29, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-ipeninputpanel-refresh
     */
    Refresh() {
        result := ComCall(30, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} Enable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-ipeninputpanel-enabletsf
     */
    EnableTsf(Enable) {
        result := ComCall(31, this, "short", Enable, "HRESULT")
        return result
    }
}
