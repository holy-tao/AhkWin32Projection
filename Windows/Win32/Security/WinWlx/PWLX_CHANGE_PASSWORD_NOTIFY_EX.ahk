#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Called by GINA to tell a specific network provider (or all network providers) that a password has changed.
 * @remarks
 * This function supersedes the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_change_password_notify">WlxChangePasswordNotify</a> function.
 * @see https://learn.microsoft.com/windows/win32/api//content/winwlx/nc-winwlx-pwlx_change_password_notify_ex
 * @namespace Windows.Win32.Security.WinWlx
 * @version v4.0.30319
 */
class PWLX_CHANGE_PASSWORD_NOTIFY_EX extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {HANDLE} hWlx 
     * @param {Pointer<WLX_MPR_NOTIFY_INFO>} pMprInfo 
     * @param {Integer} dwChangeInfo 
     * @param {PWSTR} ProviderName 
     * @param {Pointer<Void>} Reserved 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hWlx, pMprInfo, dwChangeInfo, ProviderName, Reserved) {
        hWlx := hWlx is Win32Handle ? NumGet(hWlx, "ptr") : hWlx
        ProviderName := ProviderName is String ? StrPtr(ProviderName) : ProviderName

        ReservedMarshal := Reserved is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", hWlx, "ptr", pMprInfo, "uint", dwChangeInfo, "ptr", ProviderName, ReservedMarshal, Reserved, "int")
        return result
    }
}
