#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Called by GINA to notify Winlogon of a secure attention sequence (SAS) event.
 * @see https://learn.microsoft.com/windows/win32/api//content/winwlx/nc-winwlx-pwlx_sas_notify
 * @namespace Windows.Win32.Security.WinWlx
 * @version v4.0.30319
 */
class PWLX_SAS_NOTIFY extends IUnknown {

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
     * @param {Integer} dwSasType 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hWlx, dwSasType) {
        hWlx := hWlx is Win32Handle ? NumGet(hWlx, "ptr") : hWlx

        ComCall(3, this, "ptr", hWlx, "uint", dwSasType)
    }
}
