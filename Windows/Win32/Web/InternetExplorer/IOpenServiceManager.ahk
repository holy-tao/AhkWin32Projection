#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IOpenService.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class IOpenServiceManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOpenServiceManager
     * @type {Guid}
     */
    static IID => Guid("{5664125f-4e10-4e90-98e4-e4513d955a14}")

    /**
     * The class identifier for OpenServiceManager
     * @type {Guid}
     */
    static CLSID => Guid("{098870b6-39ea-480b-b8b5-dd0167c4db59}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InstallService", "UninstallService", "GetServiceByID"]

    /**
     * 
     * @param {PWSTR} pwzServiceUrl 
     * @returns {IOpenService} 
     */
    InstallService(pwzServiceUrl) {
        pwzServiceUrl := pwzServiceUrl is String ? StrPtr(pwzServiceUrl) : pwzServiceUrl

        result := ComCall(3, this, "ptr", pwzServiceUrl, "ptr*", &ppService := 0, "HRESULT")
        return IOpenService(ppService)
    }

    /**
     * 
     * @param {IOpenService} pService 
     * @returns {HRESULT} 
     */
    UninstallService(pService) {
        result := ComCall(4, this, "ptr", pService, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwzID 
     * @returns {IOpenService} 
     */
    GetServiceByID(pwzID) {
        pwzID := pwzID is String ? StrPtr(pwzID) : pwzID

        result := ComCall(5, this, "ptr", pwzID, "ptr*", &ppService := 0, "HRESULT")
        return IOpenService(ppService)
    }
}
