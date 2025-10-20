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
     * 
     * @param {HWND} appWindow 
     * @param {HSTRING} sourceIdentity 
     * @param {HSTRING} targetIdentity 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} asyncOperation 
     * @returns {HRESULT} 
     */
    RequestAccessForWindowAsync(appWindow, sourceIdentity, targetIdentity, riid, asyncOperation) {
        appWindow := appWindow is Win32Handle ? NumGet(appWindow, "ptr") : appWindow
        sourceIdentity := sourceIdentity is Win32Handle ? NumGet(sourceIdentity, "ptr") : sourceIdentity
        targetIdentity := targetIdentity is Win32Handle ? NumGet(targetIdentity, "ptr") : targetIdentity

        result := ComCall(6, this, "ptr", appWindow, "ptr", sourceIdentity, "ptr", targetIdentity, "ptr", riid, "ptr", asyncOperation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} appWindow 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} result 
     * @returns {HRESULT} 
     */
    GetForWindow(appWindow, riid, result) {
        appWindow := appWindow is Win32Handle ? NumGet(appWindow, "ptr") : appWindow

        result := ComCall(7, this, "ptr", appWindow, "ptr", riid, "ptr", result, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
