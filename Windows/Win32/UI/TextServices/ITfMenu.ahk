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
     * 
     * @param {Integer} uId 
     * @param {Integer} dwFlags 
     * @param {HBITMAP} hbmp 
     * @param {HBITMAP} hbmpMask 
     * @param {PWSTR} pch 
     * @param {Integer} cch 
     * @param {Pointer<ITfMenu>} ppMenu 
     * @returns {HRESULT} 
     */
    AddMenuItem(uId, dwFlags, hbmp, hbmpMask, pch, cch, ppMenu) {
        hbmp := hbmp is Win32Handle ? NumGet(hbmp, "ptr") : hbmp
        hbmpMask := hbmpMask is Win32Handle ? NumGet(hbmpMask, "ptr") : hbmpMask
        pch := pch is String ? StrPtr(pch) : pch

        result := ComCall(3, this, "uint", uId, "uint", dwFlags, "ptr", hbmp, "ptr", hbmpMask, "ptr", pch, "uint", cch, "ptr", ppMenu, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
