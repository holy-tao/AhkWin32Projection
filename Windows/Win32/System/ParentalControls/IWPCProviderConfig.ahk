#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes configuration methods that are implemented by third parties.
 * @see https://learn.microsoft.com/windows/win32/api/wpcapi/nn-wpcapi-iwpcproviderconfig
 * @namespace Windows.Win32.System.ParentalControls
 */
export default struct IWPCProviderConfig extends IUnknown {
    /**
     * The interface identifier for IWPCProviderConfig
     * @type {Guid}
     */
    static IID := Guid("{bef54196-2d02-4a26-b6e5-d65af295d0f1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWPCProviderConfig interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetUserSummary  : IntPtr
        Configure       : IntPtr
        RequestOverride : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWPCProviderConfig.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the information for each user by using the Parental Controls Control Panel.
     * @remarks
     * The user summary string is used to display information under each user in the Parental Controls Control Panel.
     * @param {BSTR} bstrSID A string that contains the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID) of the user whose settings you want to obtain.
     * @returns {BSTR} A pointer to a string that contains the summary details for the user specified in the <i>bstrSID</i> parameter.
     * @see https://learn.microsoft.com/windows/win32/api/wpcapi/nf-wpcapi-iwpcproviderconfig-getusersummary
     */
    GetUserSummary(bstrSID) {
        bstrSID := bstrSID is String ? BSTR.Alloc(bstrSID).Value : bstrSID

        pbstrUserSummary := BSTR.Owned()
        result := ComCall(3, this, BSTR, bstrSID, BSTR.Ptr, pbstrUserSummary, "HRESULT")
        return pbstrUserSummary
    }

    /**
     * Called for the current provider when you click a user tile in the Parental Controls Control Panel. This method allows for changes to the configuration.
     * @param {HWND} _hWnd A handle to the parent window.
     * @param {BSTR} bstrSID A string that contains the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID) of the user to configure.
     * @returns {HRESULT} If the method succeeds, the method returns <b>S_OK</b>.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/wpcapi/nf-wpcapi-iwpcproviderconfig-configure
     */
    Configure(_hWnd, bstrSID) {
        bstrSID := bstrSID is String ? BSTR.Alloc(bstrSID).Value : bstrSID

        result := ComCall(4, this, HWND, _hWnd, BSTR, bstrSID, "HRESULT")
        return result
    }

    /**
     * Called for the current provider to enable configuration override.
     * @param {HWND} _hWnd A handle to the parent window.
     * @param {BSTR} bstrPath Pointer to a string that contains the path.
     * @param {Integer} dwFlags 
     * @returns {HRESULT} If the method succeeds, the method returns <b>S_OK</b>.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wpcapi/nf-wpcapi-iwpcproviderconfig-requestoverride
     */
    RequestOverride(_hWnd, bstrPath, dwFlags) {
        bstrPath := bstrPath is String ? BSTR.Alloc(bstrPath).Value : bstrPath

        result := ComCall(5, this, HWND, _hWnd, BSTR, bstrPath, "uint", dwFlags, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWPCProviderConfig.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetUserSummary := CallbackCreate(GetMethod(implObj, "GetUserSummary"), flags, 3)
        this.vtbl.Configure := CallbackCreate(GetMethod(implObj, "Configure"), flags, 3)
        this.vtbl.RequestOverride := CallbackCreate(GetMethod(implObj, "RequestOverride"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetUserSummary)
        CallbackFree(this.vtbl.Configure)
        CallbackFree(this.vtbl.RequestOverride)
    }
}
