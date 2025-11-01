#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Iis
 * @version v4.0.30319
 */
class IFtpHomeDirectoryProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFtpHomeDirectoryProvider
     * @type {Guid}
     */
    static IID => Guid("{0933b392-18dd-4097-8b9c-83325c35d9a6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetUserHomeDirectoryData"]

    /**
     * 
     * @param {PWSTR} pszSessionId 
     * @param {PWSTR} pszSiteName 
     * @param {PWSTR} pszUserName 
     * @param {Pointer<PWSTR>} ppszHomeDirectoryData 
     * @returns {HRESULT} 
     */
    GetUserHomeDirectoryData(pszSessionId, pszSiteName, pszUserName, ppszHomeDirectoryData) {
        pszSessionId := pszSessionId is String ? StrPtr(pszSessionId) : pszSessionId
        pszSiteName := pszSiteName is String ? StrPtr(pszSiteName) : pszSiteName
        pszUserName := pszUserName is String ? StrPtr(pszUserName) : pszUserName

        result := ComCall(3, this, "ptr", pszSessionId, "ptr", pszSiteName, "ptr", pszUserName, "ptr", ppszHomeDirectoryData, "HRESULT")
        return result
    }
}
