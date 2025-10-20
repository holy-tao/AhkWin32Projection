#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Ole\IOleWindow.ahk

/**
 * Implemented by hosts of Shell views (objects that implement IShellView). Exposes methods that provide services for the view it is hosting and other objects that run in the context of the Explorer window.
 * @remarks
 * 
  * Windows Explorer and the <b>Open File</b> common dialog box are examples of implementations of this interface. It is a companion to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a> interface exposed by extensions.
  * 
  * 
  * 
  * Objects that have access to the site chain of the browser can get a reference to the browser on <b>IShellBrowser</b> using  <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/cc678966(v=vs.85)">IServiceProvider::QueryService</a>, with Service IDs such as SID_STopLevelBrowser and SID_SCommDlgBrowser. See the Knowledge Base article <a href="https://support.microsoft.com/kb/257717">Retrieve the Top-Level IWebBrowser2 Interface from an ActiveX Control</a> for more information on using service IDs.
  * 
  * <b>Windows 7 and later</b>.  Windows Explorer context menus  can support in-place navigation by using  <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/cc678966(v=vs.85)">IServiceProvider::QueryService</a> with the Service ID SID_SlnPlaceBrowser.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ishellbrowser
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellBrowser extends IOleWindow{
    /**
     * The interface identifier for IShellBrowser
     * @type {Guid}
     */
    static IID => Guid("{000214e2-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * 
     * @param {HMENU} hmenuShared 
     * @param {Pointer<OLEMENUGROUPWIDTHS>} lpMenuWidths 
     * @returns {HRESULT} 
     */
    InsertMenusSB(hmenuShared, lpMenuWidths) {
        hmenuShared := hmenuShared is Win32Handle ? NumGet(hmenuShared, "ptr") : hmenuShared

        result := ComCall(5, this, "ptr", hmenuShared, "ptr", lpMenuWidths, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HMENU} hmenuShared 
     * @param {Pointer} holemenuRes 
     * @param {HWND} hwndActiveObject 
     * @returns {HRESULT} 
     */
    SetMenuSB(hmenuShared, holemenuRes, hwndActiveObject) {
        hmenuShared := hmenuShared is Win32Handle ? NumGet(hmenuShared, "ptr") : hmenuShared
        hwndActiveObject := hwndActiveObject is Win32Handle ? NumGet(hwndActiveObject, "ptr") : hwndActiveObject

        result := ComCall(6, this, "ptr", hmenuShared, "ptr", holemenuRes, "ptr", hwndActiveObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HMENU} hmenuShared 
     * @returns {HRESULT} 
     */
    RemoveMenusSB(hmenuShared) {
        hmenuShared := hmenuShared is Win32Handle ? NumGet(hmenuShared, "ptr") : hmenuShared

        result := ComCall(7, this, "ptr", hmenuShared, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszStatusText 
     * @returns {HRESULT} 
     */
    SetStatusTextSB(pszStatusText) {
        pszStatusText := pszStatusText is String ? StrPtr(pszStatusText) : pszStatusText

        result := ComCall(8, this, "ptr", pszStatusText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fEnable 
     * @returns {HRESULT} 
     */
    EnableModelessSB(fEnable) {
        result := ComCall(9, this, "int", fEnable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<MSG>} pmsg 
     * @param {Integer} wID 
     * @returns {HRESULT} 
     */
    TranslateAcceleratorSB(pmsg, wID) {
        result := ComCall(10, this, "ptr", pmsg, "ushort", wID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITEMIDLIST>} pidl 
     * @param {Integer} wFlags 
     * @returns {HRESULT} 
     */
    BrowseObject(pidl, wFlags) {
        result := ComCall(11, this, "ptr", pidl, "uint", wFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} grfMode 
     * @param {Pointer<IStream>} ppStrm 
     * @returns {HRESULT} 
     */
    GetViewStateStream(grfMode, ppStrm) {
        result := ComCall(12, this, "uint", grfMode, "ptr", ppStrm, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} id 
     * @param {Pointer<HWND>} phwnd 
     * @returns {HRESULT} 
     */
    GetControlWindow(id, phwnd) {
        result := ComCall(13, this, "uint", id, "ptr", phwnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} id 
     * @param {Integer} uMsg 
     * @param {WPARAM} wParam 
     * @param {LPARAM} lParam 
     * @param {Pointer<LRESULT>} pret 
     * @returns {HRESULT} 
     */
    SendControlMsg(id, uMsg, wParam, lParam, pret) {
        result := ComCall(14, this, "uint", id, "uint", uMsg, "ptr", wParam, "ptr", lParam, "ptr", pret, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IShellView>} ppshv 
     * @returns {HRESULT} 
     */
    QueryActiveShellView(ppshv) {
        result := ComCall(15, this, "ptr", ppshv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IShellView>} pshv 
     * @returns {HRESULT} 
     */
    OnViewWindowActive(pshv) {
        result := ComCall(16, this, "ptr", pshv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<TBBUTTON>} lpButtons 
     * @param {Integer} nButtons 
     * @param {Integer} uFlags 
     * @returns {HRESULT} 
     */
    SetToolbarItems(lpButtons, nButtons, uFlags) {
        result := ComCall(17, this, "ptr", lpButtons, "uint", nButtons, "uint", uFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
