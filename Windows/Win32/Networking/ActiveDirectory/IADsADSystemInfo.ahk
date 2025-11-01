#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IADsADSystemInfo interface retrieves data about the local computer if it is running a Windows operating system in a Windows domain. For example, you can get the domain, site, and distinguished name of the local computer.
 * @see https://docs.microsoft.com/windows/win32/api//iads/nn-iads-iadsadsysteminfo
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADsADSystemInfo extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IADsADSystemInfo
     * @type {Guid}
     */
    static IID => Guid("{5bb11929-afd1-11d2-9cb9-0000f87a369e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_UserName", "get_ComputerName", "get_SiteName", "get_DomainShortName", "get_DomainDNSName", "get_ForestDNSName", "get_PDCRoleOwner", "get_SchemaRoleOwner", "get_IsNativeMode", "GetAnyDCName", "GetDCSiteName", "RefreshSchemaCache", "GetTrees"]

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_UserName(retval) {
        result := ComCall(7, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_ComputerName(retval) {
        result := ComCall(8, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_SiteName(retval) {
        result := ComCall(9, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_DomainShortName(retval) {
        result := ComCall(10, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_DomainDNSName(retval) {
        result := ComCall(11, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_ForestDNSName(retval) {
        result := ComCall(12, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_PDCRoleOwner(retval) {
        result := ComCall(13, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_SchemaRoleOwner(retval) {
        result := ComCall(14, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} retval 
     * @returns {HRESULT} 
     */
    get_IsNativeMode(retval) {
        result := ComCall(15, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pszDCName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsadsysteminfo-getanydcname
     */
    GetAnyDCName(pszDCName) {
        result := ComCall(16, this, "ptr", pszDCName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} szServer 
     * @param {Pointer<BSTR>} pszSiteName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsadsysteminfo-getdcsitename
     */
    GetDCSiteName(szServer, pszSiteName) {
        szServer := szServer is String ? BSTR.Alloc(szServer).Value : szServer

        result := ComCall(17, this, "ptr", szServer, "ptr", pszSiteName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsadsysteminfo-refreshschemacache
     */
    RefreshSchemaCache() {
        result := ComCall(18, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvTrees 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsadsysteminfo-gettrees
     */
    GetTrees(pvTrees) {
        result := ComCall(19, this, "ptr", pvTrees, "HRESULT")
        return result
    }
}
