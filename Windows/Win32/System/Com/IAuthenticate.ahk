#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IAuthenticate extends IUnknown{
    /**
     * The interface identifier for IAuthenticate
     * @type {Guid}
     */
    static IID => Guid("{79eac9d0-baf9-11ce-8c82-00aa004ba90b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<HWND>} phwnd 
     * @param {Pointer<PWSTR>} pszUsername 
     * @param {Pointer<PWSTR>} pszPassword 
     * @returns {HRESULT} 
     */
    Authenticate(phwnd, pszUsername, pszPassword) {
        result := ComCall(3, this, "ptr", phwnd, "ptr", pszUsername, "ptr", pszPassword, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
