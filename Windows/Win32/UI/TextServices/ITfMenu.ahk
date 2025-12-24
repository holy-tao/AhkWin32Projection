#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfMenu interface is implemented by the language bar and used by a language bar button provider to add items to the menu that the language bar will display for the button.
 * @see https://docs.microsoft.com/windows/win32/api//ctfutb/nn-ctfutb-itfmenu
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfMenu extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfMenu
     * @type {Guid}
     */
    static IID => Guid("{6f8a98e4-aaa0-4f15-8c5b-07e0df0a3dd8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddMenuItem"]

    /**
     * ITfMenu::AddMenuItem method
     * @param {Integer} uId Contains the menu item identifier.
     * @param {Integer} dwFlags Contains zero or a combination of one or more of the <a href="https://docs.microsoft.com/windows/desktop/TSF/tf-lbmenuf--constants">TF_LBMENUF_*</a> values that specify the type and state of the menu item.
     * @param {HBITMAP} hbmp Contains the handle of the bitmap drawn for the menu item. If this is <b>NULL</b>, no bitmap is displayed for the menu item.
     * @param {HBITMAP} hbmpMask Contains the handle of the mask bitmap. This is a monochrome bitmap that functions as a mask for <i>hbmp</i>. Each black pixel in this bitmap will cause the corresponding pixel in <i>hbmp</i> to be displayed in its normal color. Each white pixel in this bitmap will cause the corresponding pixel in <i>hbmp</i> to be displayed in the inverse of its normal color.
     * 
     * To have the bitmap displayed without any color conversion, create a monochrome bitmap the same size as <i>hbmp</i> and set each pixel to black (RGB(0, 0, 0)).
     * 
     * If <i>hbmp</i> is <b>NULL</b>, this parameter is ignored.
     * @param {PWSTR} pch Pointer to a <b>WCHAR</b> buffer that contains the text to be displayed for the menu item. The length of the text is specified by <i>cch</i>.
     * @param {Integer} cch Specifies the length, in <b>WCHAR</b>, of the menu item text in <i>pch</i>.
     * @param {Pointer<ITfMenu>} ppMenu [in, out] Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/ctfutb/nn-ctfutb-itfmenu">ITfMenu</a> interface pointer that receives the submenu object. This parameter is not used and must be <b>NULL</b> if <i>dwFlags</i> does not contain <b>TF_LBMENUF_SUBMENU</b>.
     * 
     * If the submenu item is successfully created, this parameter receives an <a href="https://docs.microsoft.com/windows/desktop/api/ctfutb/nn-ctfutb-itfmenu">ITfMenu</a> object that the caller uses to add items to the submenu.
     * 
     * If <i>dwFlags</i> contains <b>TF_LBMENUF_SUBMENU</b>, this value must be initialized to <b>NULL</b> prior to calling this method because, in most cases, this is a marshalled call. Not initializing this variable results in the marshaller attempting to access random memory.
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
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
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
     * @see https://docs.microsoft.com/windows/win32/api//ctfutb/nf-ctfutb-itfmenu-addmenuitem
     */
    AddMenuItem(uId, dwFlags, hbmp, hbmpMask, pch, cch, ppMenu) {
        hbmp := hbmp is Win32Handle ? NumGet(hbmp, "ptr") : hbmp
        hbmpMask := hbmpMask is Win32Handle ? NumGet(hbmpMask, "ptr") : hbmpMask
        pch := pch is String ? StrPtr(pch) : pch

        result := ComCall(3, this, "uint", uId, "uint", dwFlags, "ptr", hbmp, "ptr", hbmpMask, "ptr", pch, "uint", cch, "ptr*", ppMenu, "HRESULT")
        return result
    }
}
