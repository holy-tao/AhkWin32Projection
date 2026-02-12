#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Called by GINA to create alternate application desktops for the user.
 * @see https://learn.microsoft.com/windows/win32/api//content/winwlx/nc-winwlx-pwlx_create_user_desktop
 * @namespace Windows.Win32.Security.WinWlx
 * @version v4.0.30319
 */
class PWLX_CREATE_USER_DESKTOP extends IUnknown {

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
     * @param {HANDLE} hToken 
     * @param {Integer} Flags 
     * @param {PWSTR} pszDesktopName 
     * @param {Pointer<Pointer<WLX_DESKTOP>>} ppDesktop 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hWlx, hToken, Flags, pszDesktopName, ppDesktop) {
        hWlx := hWlx is Win32Handle ? NumGet(hWlx, "ptr") : hWlx
        hToken := hToken is Win32Handle ? NumGet(hToken, "ptr") : hToken
        pszDesktopName := pszDesktopName is String ? StrPtr(pszDesktopName) : pszDesktopName

        ppDesktopMarshal := ppDesktop is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", hWlx, "ptr", hToken, "uint", Flags, "ptr", pszDesktopName, ppDesktopMarshal, ppDesktop, "int")
        return result
    }
}
