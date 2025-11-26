#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWizardExtension.ahk

/**
 * Extends the IWizardExtension interface by exposing methods to set the wizard extension's initial URL, and a specific URL in case of an error.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nn-shobjidl-iwebwizardextension
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IWebWizardExtension extends IWizardExtension{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebWizardExtension
     * @type {Guid}
     */
    static IID => Guid("{0e6b3f66-98d1-48c0-a222-fbde74e2fbc5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetInitialURL", "SetErrorURL"]

    /**
     * Sets the URL of the initial server-provided HTML page in a hosted wizard.
     * @param {PWSTR} pszURL Type: <b>LPCWSTR</b>
     * 
     * The URL of the initial server-provided HTML page.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-iwebwizardextension-setinitialurl
     */
    SetInitialURL(pszURL) {
        pszURL := pszURL is String ? StrPtr(pszURL) : pszURL

        result := ComCall(6, this, "ptr", pszURL, "HRESULT")
        return result
    }

    /**
     * Specifies the URL of a page that displays when a user experiences an error while navigating through the wizard extension pages.
     * @param {PWSTR} pszErrorURL Type: <b>LPCWSTR</b>
     * 
     * The URL of the page to display.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-iwebwizardextension-seterrorurl
     */
    SetErrorURL(pszErrorURL) {
        pszErrorURL := pszErrorURL is String ? StrPtr(pszErrorURL) : pszErrorURL

        result := ComCall(7, this, "ptr", pszErrorURL, "HRESULT")
        return result
    }
}
