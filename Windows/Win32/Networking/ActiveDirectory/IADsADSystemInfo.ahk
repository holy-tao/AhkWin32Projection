#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * The IADsADSystemInfo interface retrieves data about the local computer if it is running a Windows operating system in a Windows domain. For example, you can get the domain, site, and distinguished name of the local computer.
 * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-iadsadsysteminfo
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct IADsADSystemInfo extends IDispatch {
    /**
     * The interface identifier for IADsADSystemInfo
     * @type {Guid}
     */
    static IID := Guid("{5bb11929-afd1-11d2-9cb9-0000f87a369e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IADsADSystemInfo interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_UserName        : IntPtr
        get_ComputerName    : IntPtr
        get_SiteName        : IntPtr
        get_DomainShortName : IntPtr
        get_DomainDNSName   : IntPtr
        get_ForestDNSName   : IntPtr
        get_PDCRoleOwner    : IntPtr
        get_SchemaRoleOwner : IntPtr
        get_IsNativeMode    : IntPtr
        GetAnyDCName        : IntPtr
        GetDCSiteName       : IntPtr
        RefreshSchemaCache  : IntPtr
        GetTrees            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IADsADSystemInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
        retval := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ComputerName() {
        retval := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_SiteName() {
        retval := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_DomainShortName() {
        retval := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_DomainDNSName() {
        retval := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ForestDNSName() {
        retval := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_PDCRoleOwner() {
        retval := BSTR.Owned()
        result := ComCall(13, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_SchemaRoleOwner() {
        retval := BSTR.Owned()
        result := ComCall(14, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_IsNativeMode() {
        result := ComCall(15, this, VARIANT_BOOL.Ptr, &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Retrieves the DNS name of a domain controller in the local computer's domain.
     * @returns {BSTR} Name of a domain controller, such as "ADServer1.domain1.Fabrikam.com".
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsadsysteminfo-getanydcname
     */
    GetAnyDCName() {
        pszDCName := BSTR.Owned()
        result := ComCall(16, this, BSTR.Ptr, pszDCName, "HRESULT")
        return pszDCName
    }

    /**
     * Retrieves the name of the Active Directory site that contains the local computer.
     * @remarks
     * An Active Directory site is one or more well-connected TCP/IP subnets holding Active Directory domain controllers. For more information, see  <a href="https://docs.microsoft.com/windows/desktop/AD/core-concepts-of-active-directory-domain-services">Active Directory Core Concepts</a>.
     * @param {BSTR} szServer Name of the Active Directory site.
     * @returns {BSTR} DNS name of the service server.
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsadsysteminfo-getdcsitename
     */
    GetDCSiteName(szServer) {
        szServer := szServer is String ? BSTR.Alloc(szServer).Value : szServer

        pszSiteName := BSTR.Owned()
        result := ComCall(17, this, BSTR, szServer, BSTR.Ptr, pszSiteName, "HRESULT")
        return pszSiteName
    }

    /**
     * The IADsADSystemInfo::RefreshSchemaCache method refreshes the Active Directory schema cache.
     * @remarks
     * When you call this method, it does a Put() of the <b>schemaUpdateNow</b> function on the RootDSE. Normally, when you make changes to the schema, they are not updated to the RootDSE until the next automatic update. This method does an immediate update to the schema so that you can view the changes to the schema.
     * @returns {HRESULT} This method supports the standard <b>HRESULT</b> return values. For more information, see  <a href="https://docs.microsoft.com/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsadsysteminfo-refreshschemacache
     */
    RefreshSchemaCache() {
        result := ComCall(18, this, "HRESULT")
        return result
    }

    /**
     * Retrieves the DNS names of all the directory trees in the local computer's forest.
     * @returns {VARIANT} A Variant array of strings that contains the names of the directory trees within the forest.
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsadsysteminfo-gettrees
     */
    GetTrees() {
        pvTrees := VARIANT()
        result := ComCall(19, this, VARIANT.Ptr, pvTrees, "HRESULT")
        return pvTrees
    }

    Query(iid) {
        if (IADsADSystemInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_UserName := CallbackCreate(GetMethod(implObj, "get_UserName"), flags, 2)
        this.vtbl.get_ComputerName := CallbackCreate(GetMethod(implObj, "get_ComputerName"), flags, 2)
        this.vtbl.get_SiteName := CallbackCreate(GetMethod(implObj, "get_SiteName"), flags, 2)
        this.vtbl.get_DomainShortName := CallbackCreate(GetMethod(implObj, "get_DomainShortName"), flags, 2)
        this.vtbl.get_DomainDNSName := CallbackCreate(GetMethod(implObj, "get_DomainDNSName"), flags, 2)
        this.vtbl.get_ForestDNSName := CallbackCreate(GetMethod(implObj, "get_ForestDNSName"), flags, 2)
        this.vtbl.get_PDCRoleOwner := CallbackCreate(GetMethod(implObj, "get_PDCRoleOwner"), flags, 2)
        this.vtbl.get_SchemaRoleOwner := CallbackCreate(GetMethod(implObj, "get_SchemaRoleOwner"), flags, 2)
        this.vtbl.get_IsNativeMode := CallbackCreate(GetMethod(implObj, "get_IsNativeMode"), flags, 2)
        this.vtbl.GetAnyDCName := CallbackCreate(GetMethod(implObj, "GetAnyDCName"), flags, 2)
        this.vtbl.GetDCSiteName := CallbackCreate(GetMethod(implObj, "GetDCSiteName"), flags, 3)
        this.vtbl.RefreshSchemaCache := CallbackCreate(GetMethod(implObj, "RefreshSchemaCache"), flags, 1)
        this.vtbl.GetTrees := CallbackCreate(GetMethod(implObj, "GetTrees"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_UserName)
        CallbackFree(this.vtbl.get_ComputerName)
        CallbackFree(this.vtbl.get_SiteName)
        CallbackFree(this.vtbl.get_DomainShortName)
        CallbackFree(this.vtbl.get_DomainDNSName)
        CallbackFree(this.vtbl.get_ForestDNSName)
        CallbackFree(this.vtbl.get_PDCRoleOwner)
        CallbackFree(this.vtbl.get_SchemaRoleOwner)
        CallbackFree(this.vtbl.get_IsNativeMode)
        CallbackFree(this.vtbl.GetAnyDCName)
        CallbackFree(this.vtbl.GetDCSiteName)
        CallbackFree(this.vtbl.RefreshSchemaCache)
        CallbackFree(this.vtbl.GetTrees)
    }
}
