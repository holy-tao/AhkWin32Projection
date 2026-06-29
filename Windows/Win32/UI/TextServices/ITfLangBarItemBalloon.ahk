#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\TF_LBBALLOONINFO.ahk" { TF_LBBALLOONINFO }
#Import "..\..\Foundation\POINT.ahk" { POINT }
#Import ".\ITfLangBarItem.ahk" { ITfLangBarItem }
#Import ".\TfLBIClick.ahk" { TfLBIClick }
#Import "..\..\Foundation\SIZE.ahk" { SIZE }
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * The ITfLangBarItemBalloon interface is implemented by an application or text service and is used by the language bar manager to obtain information specific to a balloon item on the language bar.
 * @remarks
 * A language bar balloon acts as a pop-up notification on the language bar.
 * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nn-ctfutb-itflangbaritemballoon
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfLangBarItemBalloon extends ITfLangBarItem {
    /**
     * The interface identifier for ITfLangBarItemBalloon
     * @type {Guid}
     */
    static IID := Guid("{01c2d285-d3c7-4b7b-b5b5-d97411d0c283}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfLangBarItemBalloon interfaces
    */
    struct Vtbl extends ITfLangBarItem.Vtbl {
        OnClick          : IntPtr
        GetPreferredSize : IntPtr
        GetBalloonInfo   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfLangBarItemBalloon.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfLangBarItemBalloon::OnClick method
     * @param {TfLBIClick} click Contains one of the <a href="https://docs.microsoft.com/windows/win32/api/ctfutb/ne-ctfutb-tflbiclick">TfLBIClick</a> values that indicate which mouse button was used to click the balloon.
     * @param {POINT} pt Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a> structure that contains the position of the mouse cursor, in screen coordinates, at the time of the click event.
     * @param {Pointer<RECT>} prcArea Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that contains the bounding rectangle, in screen coordinates, of the balloon.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbaritemballoon-onclick
     */
    OnClick(click, pt, prcArea) {
        result := ComCall(7, this, TfLBIClick, click, POINT, pt, RECT.Ptr, prcArea, "HRESULT")
        return result
    }

    /**
     * ITfLangBarItemBalloon::GetPreferredSize method
     * @remarks
     * This method is required. The balloon must supply the preferred size in response to this method.
     * 
     * To obtain the font used to draw the balloon, call <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-getstockobject">GetStockObject</a> with DEFAULT_GUI_FONT. This font can be used to calculate the preferred balloon size at runtime.
     * 
     * If the balloon text will not fit into the preferred size obtained from this method, the language bar truncates the text and adds an ellipses to the text.
     * @param {Pointer<SIZE>} pszDefault Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-size">SIZE</a> structure that contains the default size, in pixels, of the balloon.
     * @returns {SIZE} Pointer to a <b>SIZE</b> structure that receives the preferred balloon size, in pixels. The <b>cy</b> member of this structure is ignored.
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbaritemballoon-getpreferredsize
     */
    GetPreferredSize(pszDefault) {
        psz := SIZE()
        result := ComCall(8, this, SIZE.Ptr, pszDefault, SIZE.Ptr, psz, "HRESULT")
        return psz
    }

    /**
     * ITfLangBarItemBalloon::GetBalloonInfo method
     * @returns {TF_LBBALLOONINFO} Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/ctfutb/ns-ctfutb-tf_lbballooninfo">TF_LBBALLOONINFO</a> structure that receives the information about the balloon.
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbaritemballoon-getballooninfo
     */
    GetBalloonInfo() {
        pInfo := TF_LBBALLOONINFO()
        result := ComCall(9, this, TF_LBBALLOONINFO.Ptr, pInfo, "HRESULT")
        return pInfo
    }

    Query(iid) {
        if (ITfLangBarItemBalloon.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnClick := CallbackCreate(GetMethod(implObj, "OnClick"), flags, 4)
        this.vtbl.GetPreferredSize := CallbackCreate(GetMethod(implObj, "GetPreferredSize"), flags, 3)
        this.vtbl.GetBalloonInfo := CallbackCreate(GetMethod(implObj, "GetBalloonInfo"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnClick)
        CallbackFree(this.vtbl.GetPreferredSize)
        CallbackFree(this.vtbl.GetBalloonInfo)
    }
}
