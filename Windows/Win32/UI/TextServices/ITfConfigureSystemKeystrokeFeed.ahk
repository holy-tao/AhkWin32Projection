#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ITfConfigureSystemKeystrokeFeed interface is implemented by the TSF manager to enable and disable the processing of keystrokes.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/nn-msctf-itfconfiguresystemkeystrokefeed
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfConfigureSystemKeystrokeFeed extends IUnknown {
    /**
     * The interface identifier for ITfConfigureSystemKeystrokeFeed
     * @type {Guid}
     */
    static IID := Guid("{0d2c969a-bc9c-437c-84ee-951c49b1a764}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfConfigureSystemKeystrokeFeed interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        DisableSystemKeystrokeFeed : IntPtr
        EnableSystemKeystrokeFeed  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfConfigureSystemKeystrokeFeed.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfConfigureSystemKeystrokeFeed::DisableSystemKeystrokeFeed method
     * @remarks
     * By default, the TSF manager will process keystrokes and pass them to the text services. An application prevents this by calling this method. Typically, this method is called when text service input is inappropriate, for example when a menu is displayed.
     * 
     * Calls to this method are cumulative, so every call to this method requires a subsequent call to <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfconfiguresystemkeystrokefeed-enablesystemkeystrokefeed">ITfConfigureSystemKeystrokeFeed::EnableSystemKeystrokeFeed</a>.
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfconfiguresystemkeystrokefeed-disablesystemkeystrokefeed
     */
    DisableSystemKeystrokeFeed() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * ITfConfigureSystemKeystrokeFeed::EnableSystemKeystrokeFeed method
     * @remarks
     * By default, the TSF manager will process keystrokes and pass them to the text services. An application prevents this by calling <b>DisableSystemKeystrokeFeed</b> .
     * 
     * Calls to <b>DisableSystemKeystrokeFeed</b> are cumulative, so every call to <b>DisableSystemKeystrokeFeed</b> requires a subsequent call to <b>EnableSystemKeystrokeFeed</b>. Calling <b>EnableSystemKeystrokeFeed</b> will not enable keystroke processing if <b>DisableSystemKeystrokeFeed</b> is called more than once.
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
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was no corresponding call to DisableSystemKeystrokeFeed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfconfiguresystemkeystrokefeed-enablesystemkeystrokefeed
     */
    EnableSystemKeystrokeFeed() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITfConfigureSystemKeystrokeFeed.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.DisableSystemKeystrokeFeed := CallbackCreate(GetMethod(implObj, "DisableSystemKeystrokeFeed"), flags, 1)
        this.vtbl.EnableSystemKeystrokeFeed := CallbackCreate(GetMethod(implObj, "EnableSystemKeystrokeFeed"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.DisableSystemKeystrokeFeed)
        CallbackFree(this.vtbl.EnableSystemKeystrokeFeed)
    }
}
