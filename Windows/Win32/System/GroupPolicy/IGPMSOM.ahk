#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * The IGPMSOM interface contains methods that allow you to create and retrieve GPO links for a scope of management (SOM), and to set and retrieve security attributes and various properties for a SOM. A SOM can be a site, domain or OU.
 * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nn-gpmgmt-igpmsom
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class IGPMSOM extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGPMSOM
     * @type {Guid}
     */
    static IID => Guid("{c0a7f09e-05a1-4f0c-8158-9e5c33684f6b}")

    /**
     * The class identifier for GPMSOM
     * @type {Guid}
     */
    static CLSID => Guid("{32d93fac-450e-44cf-829c-8b22ff6bdae1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_GPOInheritanceBlocked", "put_GPOInheritanceBlocked", "get_Name", "get_Path", "CreateGPOLink", "get_Type", "GetGPOLinks", "GetInheritedGPOLinks", "GetSecurityInfo", "SetSecurityInfo"]

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pVal 
     * @returns {HRESULT} 
     */
    get_GPOInheritanceBlocked(pVal) {
        result := ComCall(7, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} newVal 
     * @returns {HRESULT} 
     */
    put_GPOInheritanceBlocked(newVal) {
        result := ComCall(8, this, "short", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_Name(pVal) {
        result := ComCall(9, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_Path(pVal) {
        result := ComCall(10, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * The CreateGPOLink function creates a link between the specified GPO and the specified site, domain, or organizational unit.
     * @param {Integer} lLinkPos 
     * @param {IGPMGPO} pGPO 
     * @param {Pointer<IGPMGPOLink>} ppNewGPOLink 
     * @returns {HRESULT} If the function succeeds, the return value is <b>S_OK</b>. Otherwise, the function returns 
     *        one of the COM error codes defined in the header file WinError.h. Be aware that you should test explicitly for 
     *        the return value <b>S_OK</b>. Do not use the <b>SUCCEEDED</b> or 
     *        <b>FAILED</b> macro on the returned <b>HRESULT</b> to determine success or failure of the 
     *        function.
     * @see https://docs.microsoft.com/windows/win32/api//gpedit/nf-gpedit-creategpolink
     */
    CreateGPOLink(lLinkPos, pGPO, ppNewGPOLink) {
        result := ComCall(11, this, "int", lLinkPos, "ptr", pGPO, "ptr*", ppNewGPOLink, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_Type(pVal) {
        result := ComCall(12, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IGPMGPOLinksCollection>} ppGPOLinks 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmsom-getgpolinks
     */
    GetGPOLinks(ppGPOLinks) {
        result := ComCall(13, this, "ptr*", ppGPOLinks, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IGPMGPOLinksCollection>} ppGPOLinks 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmsom-getinheritedgpolinks
     */
    GetInheritedGPOLinks(ppGPOLinks) {
        result := ComCall(14, this, "ptr*", ppGPOLinks, "HRESULT")
        return result
    }

    /**
     * Retrieves a copy of the security descriptor for an object specified by a handle.
     * @param {Pointer<IGPMSecurityInfo>} ppSecurityInfo 
     * @returns {HRESULT} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in WinError.h.
     * @see https://docs.microsoft.com/windows/win32/api//aclapi/nf-aclapi-getsecurityinfo
     */
    GetSecurityInfo(ppSecurityInfo) {
        result := ComCall(15, this, "ptr*", ppSecurityInfo, "HRESULT")
        return result
    }

    /**
     * Sets specified security information in the security descriptor of a specified object. The caller identifies the object by a handle.
     * @param {IGPMSecurityInfo} pSecurityInfo 
     * @returns {HRESULT} If the function succeeds, the function returns ERROR_SUCCESS.
     * 
     * If the function fails, it returns a nonzero error code defined in WinError.h.
     * @see https://docs.microsoft.com/windows/win32/api//aclapi/nf-aclapi-setsecurityinfo
     */
    SetSecurityInfo(pSecurityInfo) {
        result := ComCall(16, this, "ptr", pSecurityInfo, "HRESULT")
        return result
    }
}
