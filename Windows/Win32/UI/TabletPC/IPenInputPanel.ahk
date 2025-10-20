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
     * 
     * @param {Pointer<VARIANT_BOOL>} Busy 
     * @returns {HRESULT} 
     */
    get_Busy(Busy) {
        result := ComCall(7, this, "ptr", Busy, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} Factoid 
     * @returns {HRESULT} 
     */
    get_Factoid(Factoid) {
        result := ComCall(8, this, "ptr", Factoid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} Factoid 
     * @returns {HRESULT} 
     */
    put_Factoid(Factoid) {
        Factoid := Factoid is String ? BSTR.Alloc(Factoid).Value : Factoid

        result := ComCall(9, this, "ptr", Factoid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} AttachedEditWindow 
     * @returns {HRESULT} 
     */
    get_AttachedEditWindow(AttachedEditWindow) {
        result := ComCall(10, this, "int*", AttachedEditWindow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} AttachedEditWindow 
     * @returns {HRESULT} 
     */
    put_AttachedEditWindow(AttachedEditWindow) {
        result := ComCall(11, this, "int", AttachedEditWindow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} CurrentPanel 
     * @returns {HRESULT} 
     */
    get_CurrentPanel(CurrentPanel) {
        result := ComCall(12, this, "int*", CurrentPanel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} CurrentPanel 
     * @returns {HRESULT} 
     */
    put_CurrentPanel(CurrentPanel) {
        result := ComCall(13, this, "int", CurrentPanel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pDefaultPanel 
     * @returns {HRESULT} 
     */
    get_DefaultPanel(pDefaultPanel) {
        result := ComCall(14, this, "int*", pDefaultPanel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} DefaultPanel 
     * @returns {HRESULT} 
     */
    put_DefaultPanel(DefaultPanel) {
        result := ComCall(15, this, "int", DefaultPanel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} Visible 
     * @returns {HRESULT} 
     */
    get_Visible(Visible) {
        result := ComCall(16, this, "ptr", Visible, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} Visible 
     * @returns {HRESULT} 
     */
    put_Visible(Visible) {
        result := ComCall(17, this, "short", Visible, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} Top 
     * @returns {HRESULT} 
     */
    get_Top(Top) {
        result := ComCall(18, this, "int*", Top, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} Left 
     * @returns {HRESULT} 
     */
    get_Left(Left) {
        result := ComCall(19, this, "int*", Left, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} Width 
     * @returns {HRESULT} 
     */
    get_Width(Width) {
        result := ComCall(20, this, "int*", Width, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} Height 
     * @returns {HRESULT} 
     */
    get_Height(Height) {
        result := ComCall(21, this, "int*", Height, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} VerticalOffset 
     * @returns {HRESULT} 
     */
    get_VerticalOffset(VerticalOffset) {
        result := ComCall(22, this, "int*", VerticalOffset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} VerticalOffset 
     * @returns {HRESULT} 
     */
    put_VerticalOffset(VerticalOffset) {
        result := ComCall(23, this, "int", VerticalOffset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} HorizontalOffset 
     * @returns {HRESULT} 
     */
    get_HorizontalOffset(HorizontalOffset) {
        result := ComCall(24, this, "int*", HorizontalOffset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} HorizontalOffset 
     * @returns {HRESULT} 
     */
    put_HorizontalOffset(HorizontalOffset) {
        result := ComCall(25, this, "int", HorizontalOffset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pAutoShow 
     * @returns {HRESULT} 
     */
    get_AutoShow(pAutoShow) {
        result := ComCall(26, this, "ptr", pAutoShow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} AutoShow 
     * @returns {HRESULT} 
     */
    put_AutoShow(AutoShow) {
        result := ComCall(27, this, "short", AutoShow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Left 
     * @param {Integer} Top 
     * @returns {HRESULT} 
     */
    MoveTo(Left, Top) {
        result := ComCall(28, this, "int", Left, "int", Top, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CommitPendingInput() {
        result := ComCall(29, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Refresh() {
        result := ComCall(30, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} Enable 
     * @returns {HRESULT} 
     */
    EnableTsf(Enable) {
        result := ComCall(31, this, "short", Enable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
