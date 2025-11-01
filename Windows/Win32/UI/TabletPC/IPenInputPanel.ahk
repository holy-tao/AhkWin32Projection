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
     * 
     * @param {Pointer<VARIANT_BOOL>} Busy 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-ipeninputpanel-get_busy
     */
    get_Busy(Busy) {
        result := ComCall(7, this, "ptr", Busy, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} Factoid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-ipeninputpanel-get_factoid
     */
    get_Factoid(Factoid) {
        result := ComCall(8, this, "ptr", Factoid, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} AttachedEditWindow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-ipeninputpanel-get_attachededitwindow
     */
    get_AttachedEditWindow(AttachedEditWindow) {
        AttachedEditWindowMarshal := AttachedEditWindow is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, AttachedEditWindowMarshal, AttachedEditWindow, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} CurrentPanel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-ipeninputpanel-get_currentpanel
     */
    get_CurrentPanel(CurrentPanel) {
        CurrentPanelMarshal := CurrentPanel is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, CurrentPanelMarshal, CurrentPanel, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pDefaultPanel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-ipeninputpanel-get_defaultpanel
     */
    get_DefaultPanel(pDefaultPanel) {
        pDefaultPanelMarshal := pDefaultPanel is VarRef ? "int*" : "ptr"

        result := ComCall(14, this, pDefaultPanelMarshal, pDefaultPanel, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} Visible 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-ipeninputpanel-get_visible
     */
    get_Visible(Visible) {
        result := ComCall(16, this, "ptr", Visible, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} Top 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-ipeninputpanel-get_top
     */
    get_Top(Top) {
        TopMarshal := Top is VarRef ? "int*" : "ptr"

        result := ComCall(18, this, TopMarshal, Top, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Left 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-ipeninputpanel-get_left
     */
    get_Left(Left) {
        LeftMarshal := Left is VarRef ? "int*" : "ptr"

        result := ComCall(19, this, LeftMarshal, Left, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Width 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-ipeninputpanel-get_width
     */
    get_Width(Width) {
        WidthMarshal := Width is VarRef ? "int*" : "ptr"

        result := ComCall(20, this, WidthMarshal, Width, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Height 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-ipeninputpanel-get_height
     */
    get_Height(Height) {
        HeightMarshal := Height is VarRef ? "int*" : "ptr"

        result := ComCall(21, this, HeightMarshal, Height, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} VerticalOffset 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-ipeninputpanel-get_verticaloffset
     */
    get_VerticalOffset(VerticalOffset) {
        VerticalOffsetMarshal := VerticalOffset is VarRef ? "int*" : "ptr"

        result := ComCall(22, this, VerticalOffsetMarshal, VerticalOffset, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} HorizontalOffset 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-ipeninputpanel-get_horizontaloffset
     */
    get_HorizontalOffset(HorizontalOffset) {
        HorizontalOffsetMarshal := HorizontalOffset is VarRef ? "int*" : "ptr"

        result := ComCall(24, this, HorizontalOffsetMarshal, HorizontalOffset, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} pAutoShow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/nf-peninputpanel-ipeninputpanel-get_autoshow
     */
    get_AutoShow(pAutoShow) {
        result := ComCall(26, this, "ptr", pAutoShow, "HRESULT")
        return result
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
