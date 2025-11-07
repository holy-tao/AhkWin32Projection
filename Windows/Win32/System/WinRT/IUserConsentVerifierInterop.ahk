#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IInspectable.ahk

/**
 * Enables interoperability with a WinRT UserConsentVerifier class object and provides access to UserConsentVerifier members to verify the current user.
 * @remarks
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//userconsentverifierinterop/nn-userconsentverifierinterop-iuserconsentverifierinterop
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
     * 
     * @param {HWND} appWindow 
     * @param {HSTRING} message 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/userconsentverifierinterop/nf-userconsentverifierinterop-iuserconsentverifierinterop-requestverificationforwindowasync
     */
    RequestVerificationForWindowAsync(appWindow, message, riid) {
        appWindow := appWindow is Win32Handle ? NumGet(appWindow, "ptr") : appWindow
        message := message is Win32Handle ? NumGet(message, "ptr") : message

        result := ComCall(6, this, "ptr", appWindow, "ptr", message, "ptr", riid, "ptr*", &asyncOperation := 0, "HRESULT")
        return asyncOperation
    }
}
