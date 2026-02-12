#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\SIZE.ahk
#Include .\TF_LBBALLOONINFO.ahk
#Include .\ITfLangBarItem.ahk

/**
 * The ITfLangBarItemBalloon interface is implemented by an application or text service and is used by the language bar manager to obtain information specific to a balloon item on the language bar.
 * @remarks
 * A language bar balloon acts as a pop-up notification on the language bar.
 * @see https://learn.microsoft.com/windows/win32/api//content/ctfutb/nn-ctfutb-itflangbaritemballoon
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfLangBarItemBalloon extends ITfLangBarItem{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfLangBarItemBalloon
     * @type {Guid}
     */
    static IID => Guid("{01c2d285-d3c7-4b7b-b5b5-d97411d0c283}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnClick", "GetPreferredSize", "GetBalloonInfo"]

    /**
     * ITfLangBarItemBalloon::OnClick method
     * @param {Integer} click Contains one of the <a href="https://docs.microsoft.com/windows/win32/api/ctfutb/ne-ctfutb-tflbiclick">TfLBIClick</a> values that indicate which mouse button was used to click the balloon.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/ctfutb/nf-ctfutb-itflangbaritemballoon-onclick
     */
    OnClick(click, pt, prcArea) {
        result := ComCall(7, this, "int", click, "ptr", pt, "ptr", prcArea, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/ctfutb/nf-ctfutb-itflangbaritemballoon-getpreferredsize
     */
    GetPreferredSize(pszDefault) {
        psz := SIZE()
        result := ComCall(8, this, "ptr", pszDefault, "ptr", psz, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return psz
    }

    /**
     * ITfLangBarItemBalloon::GetBalloonInfo method
     * @returns {TF_LBBALLOONINFO} Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/ctfutb/ns-ctfutb-tf_lbballooninfo">TF_LBBALLOONINFO</a> structure that receives the information about the balloon.
     * @see https://learn.microsoft.com/windows/win32/api//content/ctfutb/nf-ctfutb-itflangbaritemballoon-getballooninfo
     */
    GetBalloonInfo() {
        pInfo := TF_LBBALLOONINFO()
        result := ComCall(9, this, "ptr", pInfo, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pInfo
    }
}
