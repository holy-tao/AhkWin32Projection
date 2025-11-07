#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfSystemLangBarItemSink interface is implemented by a system language bar menu extension and used by a system language bar menu (host) to allow menu items to be added to an existing system language bar menu.
 * @remarks
 * 
 * A system language bar menu is an object on the language bar that supports menu items added to it by third-partyextensions. The system item must support the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfsource">ITfSource</a> interface and support the IID_ITfSystemLangBarItemSink identifier in its <b>ITfSource::AdviseSink</b> implementation. The system item should also implement the <a href="https://docs.microsoft.com/windows/desktop/api/ctfutb/nn-ctfutb-itfsystemlangbaritem">ITfSystemLangBarItem</a> interface. The system item uses the <b>ITfSystemLangBarItemSink</b> interface to allow the extension to add its items.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//ctfutb/nn-ctfutb-itfsystemlangbaritemsink
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfSystemLangBarItemSink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfSystemLangBarItemSink
     * @type {Guid}
     */
    static IID => Guid("{1449d9ab-13cf-4687-aa3e-8d8b18574396}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitMenu", "OnMenuSelect"]

    /**
     * 
     * @param {ITfMenu} pMenu 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itfsystemlangbaritemsink-initmenu
     */
    InitMenu(pMenu) {
        result := ComCall(3, this, "ptr", pMenu, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itfsystemlangbaritemsink-onmenuselect
     */
    OnMenuSelect(wID) {
        result := ComCall(4, this, "uint", wID, "HRESULT")
        return result
    }
}
