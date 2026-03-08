#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IInspectable.ahk

/**
 * Enables interoperability with a WinRT UserConsentVerifier class object and provides access to UserConsentVerifier members to verify the current user.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/userconsentverifierinterop/nn-userconsentverifierinterop-iuserconsentverifierinterop
 * @namespace Windows.Win32.System.WinRT
 * @version v4.0.30319
 */
class IUserConsentVerifierInterop extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUserConsentVerifierInterop
     * @type {Guid}
     */
    static IID => Guid("{39e050c3-4e74-441a-8dc0-b81104df949c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RequestVerificationForWindowAsync"]

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
        appWindow := appWindow is Win32Handle ? NumGet(appWindow, "ptr") : appWindow
        message := message is Win32Handle ? NumGet(message, "ptr") : message

        result := ComCall(6, this, "ptr", appWindow, "ptr", message, "ptr", riid, "ptr*", &asyncOperation := 0, "HRESULT")
        return asyncOperation
    }
}
