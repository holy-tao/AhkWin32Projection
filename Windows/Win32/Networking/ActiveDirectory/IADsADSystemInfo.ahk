#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
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
     * @type {BSTR} 
     */
    UserName {
        get => this.get_UserName()
    }

    /**
     * @type {BSTR} 
     */
    ComputerName {
        get => this.get_ComputerName()
    }

    /**
     * @type {BSTR} 
     */
    SiteName {
        get => this.get_SiteName()
    }

    /**
     * @type {BSTR} 
     */
    DomainShortName {
        get => this.get_DomainShortName()
    }

    /**
     * @type {BSTR} 
     */
    DomainDNSName {
        get => this.get_DomainDNSName()
    }

    /**
     * @type {BSTR} 
     */
    ForestDNSName {
        get => this.get_ForestDNSName()
    }

    /**
     * @type {BSTR} 
     */
    PDCRoleOwner {
        get => this.get_PDCRoleOwner()
    }

    /**
     * @type {BSTR} 
     */
    SchemaRoleOwner {
        get => this.get_SchemaRoleOwner()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsNativeMode {
        get => this.get_IsNativeMode()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_UserName() {
        retval := BSTR()
        result := ComCall(7, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ComputerName() {
        retval := BSTR()
        result := ComCall(8, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_SiteName() {
        retval := BSTR()
        result := ComCall(9, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_DomainShortName() {
        retval := BSTR()
        result := ComCall(10, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_DomainDNSName() {
        retval := BSTR()
        result := ComCall(11, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ForestDNSName() {
        retval := BSTR()
        result := ComCall(12, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_PDCRoleOwner() {
        retval := BSTR()
        result := ComCall(13, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_SchemaRoleOwner() {
        retval := BSTR()
        result := ComCall(14, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_IsNativeMode() {
        result := ComCall(15, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsadsysteminfo-getanydcname
     */
    GetAnyDCName() {
        pszDCName := BSTR()
        result := ComCall(16, this, "ptr", pszDCName, "HRESULT")
        return pszDCName
    }

    /**
     * 
     * @param {BSTR} szServer 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsadsysteminfo-getdcsitename
     */
    GetDCSiteName(szServer) {
        szServer := szServer is String ? BSTR.Alloc(szServer).Value : szServer

        pszSiteName := BSTR()
        result := ComCall(17, this, "ptr", szServer, "ptr", pszSiteName, "HRESULT")
        return pszSiteName
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
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsadsysteminfo-gettrees
     */
    GetTrees() {
        pvTrees := VARIANT()
        result := ComCall(19, this, "ptr", pvTrees, "HRESULT")
        return pvTrees
    }
}
