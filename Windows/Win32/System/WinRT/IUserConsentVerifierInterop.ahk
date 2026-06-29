#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IInspectable.ahk" { IInspectable }
#Import ".\HSTRING.ahk" { HSTRING }

/**
 * Enables interoperability with a WinRT UserConsentVerifier class object and provides access to UserConsentVerifier members to verify the current user.
 * @see https://learn.microsoft.com/windows/win32/api/userconsentverifierinterop/nn-userconsentverifierinterop-iuserconsentverifierinterop
 * @namespace Windows.Win32.System.WinRT
 */
export default struct IUserConsentVerifierInterop extends IInspectable {
    /**
     * The interface identifier for IUserConsentVerifierInterop
     * @type {Guid}
     */
    static IID := Guid("{39e050c3-4e74-441a-8dc0-b81104df949c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUserConsentVerifierInterop interfaces
    */
    struct Vtbl extends IInspectable.Vtbl {
        RequestVerificationForWindowAsync : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUserConsentVerifierInterop.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Performs a verification using a device such as Microsoft Passport PIN, Windows Hello, or a fingerprint reader.
     * @param {HWND} appWindow Handle to the window of the active application.
     * @param {HSTRING} message A message to display to the user for this biometric verification request.
     * @param {Pointer<Guid>} riid The GUID for the resource interface.
     * 
     * The REFIID, or GUID, of the interface to the resource can be obtained by using the __uuidof() macro. For example: 
     * 
     * `__uuidof(IAsyncOperation)`
     * @returns {Pointer<Void>} A [IAsyncOperation](/uwp/api/windows.foundation.iasyncoperation-1) value that returns a value from the [UserConsentVerificationResult](/uwp/api/windows.security.credentials.ui.userconsentverificationresult) enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/userconsentverifierinterop/nf-userconsentverifierinterop-iuserconsentverifierinterop-requestverificationforwindowasync
     */
    RequestVerificationForWindowAsync(appWindow, message, riid) {
        result := ComCall(6, this, HWND, appWindow, HSTRING, message, Guid.Ptr, riid, "ptr*", &asyncOperation := 0, "HRESULT")
        return asyncOperation
    }

    Query(iid) {
        if (IUserConsentVerifierInterop.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RequestVerificationForWindowAsync := CallbackCreate(GetMethod(implObj, "RequestVerificationForWindowAsync"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RequestVerificationForWindowAsync)
    }
}
