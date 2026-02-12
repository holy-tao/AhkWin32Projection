#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include ..\..\System\Com\IMoniker.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IHlinkSite extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHlinkSite
     * @type {Guid}
     */
    static IID => Guid("{79eac9c2-baf9-11ce-8c82-00aa004ba90b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryService", "GetMoniker", "ReadyToNavigate", "OnNavigationComplete"]

    /**
     * Retrieves the configuration parameters of the specified service. (Unicode)
     * @remarks
     * The 
     * <b>QueryServiceConfig</b> function returns the service configuration information kept in the registry for a particular service. This configuration information is first set by a service control program using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-createservicea">CreateService</a> function. This information may have been updated by a service configuration program using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-changeserviceconfiga">ChangeServiceConfig</a> function.
     * 
     * If the service was running when the configuration information was last changed, the information returned by 
     * <b>QueryServiceConfig</b> will not reflect the current configuration of the service. Instead, it will reflect the configuration of the service when it is next run. The <b>DisplayName</b> key is an exception to this. When the <b>DisplayName</b> key is changed, it takes effect immediately, regardless of whether the service is running.
     * @param {Integer} dwSiteData 
     * @param {Pointer<Guid>} guidService 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<IUnknown>} 
     * @see https://learn.microsoft.com/windows/win32/api//content/winsvc/nf-winsvc-queryserviceconfigw
     */
    QueryService(dwSiteData, guidService, riid) {
        result := ComCall(3, this, "uint", dwSiteData, "ptr", guidService, "ptr", riid, "ptr*", &ppiunk := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppiunk
    }

    /**
     * 
     * @param {Integer} dwSiteData 
     * @param {Integer} dwAssign 
     * @param {Integer} dwWhich 
     * @returns {IMoniker} 
     */
    GetMoniker(dwSiteData, dwAssign, dwWhich) {
        result := ComCall(4, this, "uint", dwSiteData, "uint", dwAssign, "uint", dwWhich, "ptr*", &ppimk := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMoniker(ppimk)
    }

    /**
     * 
     * @param {Integer} dwSiteData 
     * @param {Integer} dwReserved 
     * @returns {HRESULT} 
     */
    ReadyToNavigate(dwSiteData, dwReserved) {
        result := ComCall(5, this, "uint", dwSiteData, "uint", dwReserved, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} dwSiteData 
     * @param {Integer} dwreserved 
     * @param {HRESULT} hrError 
     * @param {PWSTR} pwzError 
     * @returns {HRESULT} 
     */
    OnNavigationComplete(dwSiteData, dwreserved, hrError, pwzError) {
        pwzError := pwzError is String ? StrPtr(pwzError) : pwzError

        result := ComCall(6, this, "uint", dwSiteData, "uint", dwreserved, "int", hrError, "ptr", pwzError, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
