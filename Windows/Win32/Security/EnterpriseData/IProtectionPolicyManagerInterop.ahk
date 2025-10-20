#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\WinRT\IInspectable.ahk

/**
 * Manages enterprise protection policy on protected content.
 * @see https://docs.microsoft.com/windows/win32/api//efswrtinterop/nn-efswrtinterop-iprotectionpolicymanagerinterop
 * @namespace Windows.Win32.Security.EnterpriseData
 * @version v4.0.30319
 */
class IProtectionPolicyManagerInterop extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProtectionPolicyManagerInterop
     * @type {Guid}
     */
    static IID => Guid("{4652651d-c1fe-4ba1-9f0a-c0f56596f721}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RequestAccessForWindowAsync", "GetForWindow"]

    /**
     * 
     * @param {HWND} appWindow 
     * @param {HSTRING} sourceIdentity 
     * @param {HSTRING} targetIdentity 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} asyncOperation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/efswrtinterop/nf-efswrtinterop-iprotectionpolicymanagerinterop-requestaccessforwindowasync
     */
    RequestAccessForWindowAsync(appWindow, sourceIdentity, targetIdentity, riid, asyncOperation) {
        appWindow := appWindow is Win32Handle ? NumGet(appWindow, "ptr") : appWindow
        sourceIdentity := sourceIdentity is Win32Handle ? NumGet(sourceIdentity, "ptr") : sourceIdentity
        targetIdentity := targetIdentity is Win32Handle ? NumGet(targetIdentity, "ptr") : targetIdentity

        result := ComCall(6, this, "ptr", appWindow, "ptr", sourceIdentity, "ptr", targetIdentity, "ptr", riid, "ptr*", asyncOperation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} appWindow 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} result 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/efswrtinterop/nf-efswrtinterop-iprotectionpolicymanagerinterop-getforwindow
     */
    GetForWindow(appWindow, riid, result) {
        appWindow := appWindow is Win32Handle ? NumGet(appWindow, "ptr") : appWindow

        result := ComCall(7, this, "ptr", appWindow, "ptr", riid, "ptr*", result, "HRESULT")
        return result
    }
}
