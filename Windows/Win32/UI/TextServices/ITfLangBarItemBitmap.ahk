#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\SIZE.ahk
#Include .\ITfLangBarItem.ahk

/**
 * The ITfLangBarItemBitmap interface is implemented by an application or text service and used by the language bar manager to obtain information specific to a bitmap item on the language bar.
 * @remarks
 * 
 * A language bar bitmap functions as a static item on the language bar that displays a bitmap.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//ctfutb/nn-ctfutb-itflangbaritembitmap
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfLangBarItemBitmap extends ITfLangBarItem{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfLangBarItemBitmap
     * @type {Guid}
     */
    static IID => Guid("{73830352-d722-4179-ada5-f045c98df355}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnClick", "GetPreferredSize", "DrawBitmap"]

    /**
     * ITfLangBarItemBitmap::OnClick method
     * @param {Integer} click Contains one of the <a href="https://docs.microsoft.com/windows/win32/api/ctfutb/ne-ctfutb-tflbiclick">TfLBIClick</a> values that indicate which mouse button was used to click the bitmap.
     * @param {POINT} pt Pointer to a <a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a> structure that contains the position of the mouse cursor, in screen coordinates, at the time of the click event.
     * @param {Pointer<RECT>} prcArea Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that contains the bounding rectangle, in screen coordinates, of the bitmap.
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
     * @see https://docs.microsoft.com/windows/win32/api//ctfutb/nf-ctfutb-itflangbaritembitmap-onclick
     */
    OnClick(click, pt, prcArea) {
        result := ComCall(7, this, "int", click, "ptr", pt, "ptr", prcArea, "HRESULT")
        return result
    }

    /**
     * ITfLangBarItemBitmap::GetPreferredSize method
     * @param {Pointer<SIZE>} pszDefault Pointer to a <a href="https://docs.microsoft.com/previous-versions/dd145106(v=vs.85)">SIZE</a> structure that contains the default size, in pixels, of the bitmap.
     * @returns {SIZE} Pointer to a <b>SIZE</b> structure that receives the preferred size, in pixels, of the bitmap. The <b>cy</b> member of this structure is ignored.
     * @see https://docs.microsoft.com/windows/win32/api//ctfutb/nf-ctfutb-itflangbaritembitmap-getpreferredsize
     */
    GetPreferredSize(pszDefault) {
        psz := SIZE()
        result := ComCall(8, this, "ptr", pszDefault, "ptr", psz, "HRESULT")
        return psz
    }

    /**
     * ITfLangBarItemBitmap::DrawBitmap method
     * @param {Integer} bmWidth Contains the width, in pixels, of the bitmap item.
     * @param {Integer} bmHeight Contains the height, in pixels, of the bitmap item.
     * @param {Integer} dwFlags Not currently used.
     * @param {Pointer<HBITMAP>} phbmp Pointer to an <i>HBITMAP</i> value that receives the handle of the bitmap drawn for the bitmap item.
     * @param {Pointer<HBITMAP>} phbmpMask Pointer to an <b>HBITMAP</b> value that receives the handle of the mask bitmap. This is a monochrome bitmap that functions as a mask for <i>phbmp</i>. Each black pixel in this bitmap will cause the cooresponding pixel in <i>phbmp</i> to be displayed in its normal color. Every white pixel in this bitmap will cause the cooresponding pixel in <i>phbmp</i> to be displayed in the inverse of its normal color.
     * 
     * To display the bitmap without any color conversion, create a monochrome bitmap the same size as <i>phbmp</i> and set each pixel to black (RGB(0, 0, 0)).
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A memory allocation failure occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ctfutb/nf-ctfutb-itflangbaritembitmap-drawbitmap
     */
    DrawBitmap(bmWidth, bmHeight, dwFlags, phbmp, phbmpMask) {
        result := ComCall(9, this, "int", bmWidth, "int", bmHeight, "uint", dwFlags, "ptr", phbmp, "ptr", phbmpMask, "HRESULT")
        return result
    }
}
