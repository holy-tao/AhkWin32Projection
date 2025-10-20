#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IAuthenticate.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IAuthenticateEx extends IAuthenticate{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAuthenticateEx
     * @type {Guid}
     */
    static IID => Guid("{2ad1edaf-d83d-48b5-9adf-03dbe19f53bd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AuthenticateEx"]

    /**
     * 
     * @param {Pointer<HWND>} phwnd 
     * @param {Pointer<PWSTR>} pszUsername 
     * @param {Pointer<PWSTR>} pszPassword 
     * @param {Pointer<AUTHENTICATEINFO>} pauthinfo 
     * @returns {HRESULT} 
     */
    AuthenticateEx(phwnd, pszUsername, pszPassword, pauthinfo) {
        result := ComCall(4, this, "ptr", phwnd, "ptr", pszUsername, "ptr", pszPassword, "ptr", pauthinfo, "HRESULT")
        return result
    }
}
