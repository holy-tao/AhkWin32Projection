#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Iis
 * @version v4.0.30319
 */
class AsyncIFtpHomeDirectoryProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for AsyncIFtpHomeDirectoryProvider
     * @type {Guid}
     */
    static IID => Guid("{73f81638-6295-42bd-a2be-4a657f7c479c}")

    /**
     * The class identifier for AsyncIFtpHomeDirectoryProvider
     * @type {Guid}
     */
    static CLSID => Guid("{73f81638-6295-42bd-a2be-4a657f7c479c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Begin_GetUserHomeDirectoryData", "Finish_GetUserHomeDirectoryData"]

    /**
     * 
     * @param {PWSTR} pszSessionId 
     * @param {PWSTR} pszSiteName 
     * @param {PWSTR} pszUserName 
     * @returns {HRESULT} 
     */
    Begin_GetUserHomeDirectoryData(pszSessionId, pszSiteName, pszUserName) {
        pszSessionId := pszSessionId is String ? StrPtr(pszSessionId) : pszSessionId
        pszSiteName := pszSiteName is String ? StrPtr(pszSiteName) : pszSiteName
        pszUserName := pszUserName is String ? StrPtr(pszUserName) : pszUserName

        result := ComCall(3, this, "ptr", pszSessionId, "ptr", pszSiteName, "ptr", pszUserName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszHomeDirectoryData 
     * @returns {HRESULT} 
     */
    Finish_GetUserHomeDirectoryData(ppszHomeDirectoryData) {
        result := ComCall(4, this, "ptr", ppszHomeDirectoryData, "HRESULT")
        return result
    }
}
