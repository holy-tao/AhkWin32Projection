#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IExtensionServices extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IExtensionServices
     * @type {Guid}
     */
    static IID => Guid("{79eac9cb-baf9-11ce-8c82-00aa004ba90b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetAdditionalHeaders", "SetAuthenticateData"]

    /**
     * 
     * @param {PWSTR} pwzAdditionalHeaders 
     * @returns {HRESULT} 
     */
    SetAdditionalHeaders(pwzAdditionalHeaders) {
        pwzAdditionalHeaders := pwzAdditionalHeaders is String ? StrPtr(pwzAdditionalHeaders) : pwzAdditionalHeaders

        result := ComCall(3, this, "ptr", pwzAdditionalHeaders, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} phwnd 
     * @param {PWSTR} pwzUsername 
     * @param {PWSTR} pwzPassword 
     * @returns {HRESULT} 
     */
    SetAuthenticateData(phwnd, pwzUsername, pwzPassword) {
        phwnd := phwnd is Win32Handle ? NumGet(phwnd, "ptr") : phwnd
        pwzUsername := pwzUsername is String ? StrPtr(pwzUsername) : pwzUsername
        pwzPassword := pwzPassword is String ? StrPtr(pwzPassword) : pwzPassword

        result := ComCall(4, this, "ptr", phwnd, "ptr", pwzUsername, "ptr", pwzPassword, "HRESULT")
        return result
    }
}
