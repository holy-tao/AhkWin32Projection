#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Exposes configuration methods that are implemented by third parties.
 * @see https://docs.microsoft.com/windows/win32/api//wpcapi/nn-wpcapi-iwpcproviderconfig
 * @namespace Windows.Win32.System.ParentalControls
 * @version v4.0.30319
 */
class IWPCProviderConfig extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWPCProviderConfig
     * @type {Guid}
     */
    static IID => Guid("{bef54196-2d02-4a26-b6e5-d65af295d0f1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetUserSummary", "Configure", "RequestOverride"]

    /**
     * Retrieves the information for each user by using the Parental Controls Control Panel.
     * @param {BSTR} bstrSID A string that contains the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID) of the user whose settings you want to obtain.
     * @returns {BSTR} A pointer to a string that contains the summary details for the user specified in the <i>bstrSID</i> parameter.
     * @see https://docs.microsoft.com/windows/win32/api//wpcapi/nf-wpcapi-iwpcproviderconfig-getusersummary
     */
    GetUserSummary(bstrSID) {
        bstrSID := bstrSID is String ? BSTR.Alloc(bstrSID).Value : bstrSID

        pbstrUserSummary := BSTR()
        result := ComCall(3, this, "ptr", bstrSID, "ptr", pbstrUserSummary, "HRESULT")
        return pbstrUserSummary
    }

    /**
     * Called for the current provider when you click a user tile in the Parental Controls Control Panel. This method allows for changes to the configuration.
     * @param {HWND} hWnd A handle to the parent window.
     * @param {BSTR} bstrSID A string that contains the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID) of the user to configure.
     * @returns {HRESULT} If the method succeeds, the method returns <b>S_OK</b>.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Allows the provider to not handle the configuration user interface and instead to rely on the in-box Parental Controls configuration user interface.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wpcapi/nf-wpcapi-iwpcproviderconfig-configure
     */
    Configure(hWnd, bstrSID) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd
        bstrSID := bstrSID is String ? BSTR.Alloc(bstrSID).Value : bstrSID

        result := ComCall(4, this, "ptr", hWnd, "ptr", bstrSID, "HRESULT")
        return result
    }

    /**
     * Called for the current provider to enable configuration override.
     * @param {HWND} hWnd A handle to the parent window.
     * @param {BSTR} bstrPath Pointer to a string that contains the path.
     * @param {Integer} dwFlags 
     * @returns {HRESULT} If the method succeeds, the method returns <b>S_OK</b>.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wpcapi/nf-wpcapi-iwpcproviderconfig-requestoverride
     */
    RequestOverride(hWnd, bstrPath, dwFlags) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd
        bstrPath := bstrPath is String ? BSTR.Alloc(bstrPath).Value : bstrPath

        result := ComCall(5, this, "ptr", hWnd, "ptr", bstrPath, "uint", dwFlags, "HRESULT")
        return result
    }
}
