#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfSystemLangBarItem interface is implemented by a system language bar menu and is used by a system language bar extension to modify the icon and/or tooltip string displayed for the menu.
 * @remarks
 * 
  * A system language bar menu is an object on the language bar that supports menu items added to it by third-partyextensions. The system item must support the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfsource">ITfSource</a> interface and support the IID_ITfSystemLangBarItemSink identifier in its <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfsource-advisesink">ITfSource::AdviseSink</a> implementation. The system item should also implement the <b>ITfSystemLangBarItem</b> interface. The system item uses the <a href="https://docs.microsoft.com/windows/desktop/api/ctfutb/nn-ctfutb-itfsystemlangbaritemsink">ITfSystemLangBarItemSink</a> interface to enable the extension to add items.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//ctfutb/nn-ctfutb-itfsystemlangbaritem
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfSystemLangBarItem extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfSystemLangBarItem
     * @type {Guid}
     */
    static IID => Guid("{1e13e9ec-6b33-4d4a-b5eb-8a92f029f356}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetIcon", "SetTooltipString"]

    /**
     * 
     * @param {HICON} hIcon 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itfsystemlangbaritem-seticon
     */
    SetIcon(hIcon) {
        hIcon := hIcon is Win32Handle ? NumGet(hIcon, "ptr") : hIcon

        result := ComCall(3, this, "ptr", hIcon, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pchToolTip 
     * @param {Integer} cch 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itfsystemlangbaritem-settooltipstring
     */
    SetTooltipString(pchToolTip, cch) {
        pchToolTip := pchToolTip is String ? StrPtr(pchToolTip) : pchToolTip

        result := ComCall(4, this, "ptr", pchToolTip, "uint", cch, "HRESULT")
        return result
    }
}
