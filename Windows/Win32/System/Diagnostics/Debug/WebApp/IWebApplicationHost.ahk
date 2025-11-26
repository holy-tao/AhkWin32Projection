#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Web\MsHtml\IHTMLDocument2.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * Exposes methods and properties that are implemented by the WWAHost.
 * @see https://docs.microsoft.com/windows/win32/api//webapplication/nn-webapplication-iwebapplicationhost
 * @namespace Windows.Win32.System.Diagnostics.Debug.WebApp
 * @version v4.0.30319
 */
class IWebApplicationHost extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebApplicationHost
     * @type {Guid}
     */
    static IID => Guid("{cecbd2c3-a3a5-4749-9681-20e9161c6794}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_HWND", "get_Document", "Refresh", "Advise", "Unadvise"]

    /**
     */
    HWND {
        get => this.get_HWND()
    }

    /**
     * @type {IHTMLDocument2} 
     */
    Document {
        get => this.get_Document()
    }

    /**
     * Gets the handle of the current WWAHost window.
     * @param {Pointer<HWND>} hwnd 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//webapplication/nf-webapplication-iwebapplicationhost-get_hwnd
     */
    get_HWND(hwnd) {
        result := ComCall(3, this, "ptr", hwnd, "HRESULT")
        return result
    }

    /**
     * Gets the HTML document object model of the current top-level document.
     * @returns {IHTMLDocument2} 
     * @see https://docs.microsoft.com/windows/win32/api//webapplication/nf-webapplication-iwebapplicationhost-get_document
     */
    get_Document() {
        result := ComCall(4, this, "ptr*", &htmlDocument := 0, "HRESULT")
        return IHTMLDocument2(htmlDocument)
    }

    /**
     * Refreshes the current document without sending a 'Pragma:no-cache' HTTP header to the server.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//webapplication/nf-webapplication-iwebapplicationhost-refresh
     */
    Refresh() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Establishes a connection to allow a client to receive events.
     * @param {Pointer<Guid>} interfaceId Type: <b>REFIID</b>
     * 
     * The identifier of the event interface.
     * @param {IUnknown} callback Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * The caller's event interface.
     * @param {Pointer<Integer>} cookie Type: <b>DWORD*</b>
     * 
     * A token that uniquely identifies this connection.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//webapplication/nf-webapplication-iwebapplicationhost-advise
     */
    Advise(interfaceId, callback, cookie) {
        cookieMarshal := cookie is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "ptr", interfaceId, "ptr", callback, cookieMarshal, cookie, "HRESULT")
        return result
    }

    /**
     * Removes a previously established connection.
     * @param {Integer} cookie Type: <b>DWORD</b>
     * 
     * A connection token previously returned from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/debug_wwahost/iwebapplicationhost-advise">Advise</a> method.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//webapplication/nf-webapplication-iwebapplicationhost-unadvise
     */
    Unadvise(cookie) {
        result := ComCall(7, this, "uint", cookie, "HRESULT")
        return result
    }
}
