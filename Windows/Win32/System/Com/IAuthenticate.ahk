#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IAuthenticate extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Authenticate"]

    /**
     * 
     * @param {Pointer<HWND>} phwnd 
     * @param {Pointer<PWSTR>} pszUsername 
     * @param {Pointer<PWSTR>} pszPassword 
     * @returns {HRESULT} 
     */
    Authenticate(phwnd, pszUsername, pszPassword) {
        result := ComCall(3, this, "ptr", phwnd, "ptr", pszUsername, "ptr", pszPassword, "HRESULT")
        return result
    }
}
