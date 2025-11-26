#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUpdateService.ahk

/**
 * Contains information about a service that is registered with Windows Update Agent (WUA) or with Automatic Updates.
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-iupdateservice2
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IUpdateService2 extends IUpdateService{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUpdateService2
     * @type {Guid}
     */
    static IID => Guid("{1518b460-6518-4172-940f-c75883b24ceb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 20

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsDefaultAUService"]

    /**
     * @type {VARIANT_BOOL} 
     */
    IsDefaultAUService {
        get => this.get_IsDefaultAUService()
    }

    /**
     * Gets a Boolean value that indicates whether the service is registered with Automatic Updates and whether the service is currently used by Automatic Updates as the default service.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdateservice2-get_isdefaultauservice
     */
    get_IsDefaultAUService() {
        result := ComCall(20, this, "short*", &retval := 0, "HRESULT")
        return retval
    }
}
