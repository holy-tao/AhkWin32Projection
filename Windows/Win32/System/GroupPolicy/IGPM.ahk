#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IGPMDomain.ahk
#Include .\IGPMBackupDir.ahk
#Include .\IGPMSitesContainer.ahk
#Include .\IGPMRSOP.ahk
#Include .\IGPMPermission.ahk
#Include .\IGPMSearchCriteria.ahk
#Include .\IGPMTrustee.ahk
#Include .\IGPMCSECollection.ahk
#Include .\IGPMConstants.ahk
#Include .\IGPMMigrationTable.ahk
#Include ..\Com\IDispatch.ahk

/**
 * The IGPM interface provides methods that access other interfaces of the Group Policy Management Console (GPMC) and methods that create other objects on which various search operations can be performed.
 * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nn-gpmgmt-igpm
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class IGPM extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGPM
     * @type {Guid}
     */
    static IID => Guid("{f5fae809-3bd6-4da9-a65e-17665b41d763}")

    /**
     * The class identifier for GPM
     * @type {Guid}
     */
    static CLSID => Guid("{f5694708-88fe-4b35-babf-e56162d5fbc8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDomain", "GetBackupDir", "GetSitesContainer", "GetRSOP", "CreatePermission", "CreateSearchCriteria", "CreateTrustee", "GetClientSideExtensions", "GetConstants", "GetMigrationTable", "CreateMigrationTable", "InitializeReporting"]

    /**
     * Creates and returns a GPMDomain object that corresponds to the specified domain.
     * @param {BSTR} bstrDomain Name of the domain specified as a string. This must be a full Domain Name System (DNS) name, such as contoso.com.
     * @param {BSTR} bstrDomainController If specified, the name of the domain controller to use with the domain. The name can be a DNS name or a NetBIOS name. Otherwise, the method uses the primary domain controller (PDC). For more information, see the <i>lDCFlags</i> parameter.
     * 
     * <b>Scripting:  </b>This parameter must pass an empty string ("") when a domain controller is not specified.
     * @param {Integer} lDCFlags Flags to use to locate the domain controller for the domain. You can specify <b>GPM_USE_ANYDC</b>, <b>GPM_USE_PDC</b>, or <b>GPM_DONOTUSE_W2KDC</b>.
     * 
     * If this parameter is set to zero, and a <i>bstrDomainController</i> is specified, the method uses the specified <i>bstrDomainController</i>. Otherwise, the method uses the PDC.
     * @returns {IGPMDomain} Address of a pointer to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmdomain">IGPMDomain</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nf-gpmgmt-igpm-getdomain
     */
    GetDomain(bstrDomain, bstrDomainController, lDCFlags) {
        bstrDomain := bstrDomain is String ? BSTR.Alloc(bstrDomain).Value : bstrDomain
        bstrDomainController := bstrDomainController is String ? BSTR.Alloc(bstrDomainController).Value : bstrDomainController

        result := ComCall(7, this, "ptr", bstrDomain, "ptr", bstrDomainController, "int", lDCFlags, "ptr*", &pIGPMDomain := 0, "HRESULT")
        return IGPMDomain(pIGPMDomain)
    }

    /**
     * Creates and returns a GPMBackupDir object, which you can use to access the GPMBackup and GPMBackupCollection objects.
     * @param {BSTR} bstrBackupDir Required.  The name of the file system directory that contains the Group Policy object (GPO) backups. The directory must already exist.
     * @returns {IGPMBackupDir} Address of a pointer to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmbackupdir">IGPMBackupDir</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nf-gpmgmt-igpm-getbackupdir
     */
    GetBackupDir(bstrBackupDir) {
        bstrBackupDir := bstrBackupDir is String ? BSTR.Alloc(bstrBackupDir).Value : bstrBackupDir

        result := ComCall(8, this, "ptr", bstrBackupDir, "ptr*", &pIGPMBackupDir := 0, "HRESULT")
        return IGPMBackupDir(pIGPMBackupDir)
    }

    /**
     * Creates and returns a GPMSitesContainer object from which sites can be opened and queried.
     * @param {BSTR} bstrForest Required. Full DNS name of the forest in which to access sites; this is the name of the forest root domain. Use null-terminated string.
     * @param {BSTR} bstrDomain Name of the domain in which to access sites. If specified, this must be a full Domain Name Server (DNS) name, such as example.microsoft.com. If a domain is specified in the <i>bstrDomain</i> parameter, the Group Policy Management Console (GPMC) accesses sites through that domain. If no domain is  specified, the GPMC accesses the sites through the forest that is specified in the <i>bstrForest</i> parameter. Use a null-terminated string.
     * @param {BSTR} bstrDomainController If specified, the name of the domain controller to use with the domain specified in the <i>bstrDomain</i> parameter. The name can be a DNS name or a NetBIOS name. Otherwise, the method uses the primary domain controller (PDC). Use a null-terminated string.
     * @param {Integer} lDCFlags Flags to use to locate the domain controller for the domain. Currently, the only supported value is GPM_USE_ANYDC. If this parameter is set to zero, and <i>bstrDomainController</i> is specified, the method uses the specified domain controller. Otherwise, the method uses the PDC.
     * @returns {IGPMSitesContainer} Address of a pointer to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmsitescontainer">IGPMSitesContainer</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nf-gpmgmt-igpm-getsitescontainer
     */
    GetSitesContainer(bstrForest, bstrDomain, bstrDomainController, lDCFlags) {
        bstrForest := bstrForest is String ? BSTR.Alloc(bstrForest).Value : bstrForest
        bstrDomain := bstrDomain is String ? BSTR.Alloc(bstrDomain).Value : bstrDomain
        bstrDomainController := bstrDomainController is String ? BSTR.Alloc(bstrDomainController).Value : bstrDomainController

        result := ComCall(9, this, "ptr", bstrForest, "ptr", bstrDomain, "ptr", bstrDomainController, "int", lDCFlags, "ptr*", &ppIGPMSitesContainer := 0, "HRESULT")
        return IGPMSitesContainer(ppIGPMSitesContainer)
    }

    /**
     * Creates and returns an GPMRSOP. You can specify the Resultant Set of Policy (RSoP) mode and a Windows Management Instrumentation (WMI) namespace.
     * @param {Integer} gpmRSoPMode Required. Mode in which to open the object. The following modes are supported.
     * @param {BSTR} bstrNamespace WMI namespace for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmrsop">IGPMRSOP</a><b>GPMRSOP</b><b>GPMRSOP</b>.  Use a null-terminated string. This parameter can be <b>NULL</b>. For more information about how to retrieve the namespace, see the "Remarks" section.
     * @param {Integer} lFlags This parameter must be zero.
     * @returns {IGPMRSOP} Address of a pointer to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmrsop">IGPMRSOP</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nf-gpmgmt-igpm-getrsop
     */
    GetRSOP(gpmRSoPMode, bstrNamespace, lFlags) {
        bstrNamespace := bstrNamespace is String ? BSTR.Alloc(bstrNamespace).Value : bstrNamespace

        result := ComCall(10, this, "int", gpmRSoPMode, "ptr", bstrNamespace, "int", lFlags, "ptr*", &ppIGPMRSOP := 0, "HRESULT")
        return IGPMRSOP(ppIGPMRSOP)
    }

    /**
     * Creates and returns an interface or object that represents the trustee (such as a user, computer or security group) and permission that applies to a single object; for example, to a GPO, SOM or a WMI filter.
     * @param {BSTR} bstrTrustee Required. Trustee name. This parameter can be a string that specifies the security identifier (SID) of the account. This parameter can also be a Security Accounts Manager (SAM) account name, such as "Engineering\JSmith".
     * @param {Integer} perm Required. Permission to use for the trustee. The following policy-related permissions are supported. Note that each permission value represents one or more 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-rights-and-access-masks">access rights</a> that apply to the GPO.
     * 
     * The following GPO permissions are supported.
     * @param {VARIANT_BOOL} bInheritable <table>
     * <tr>
     * <td><strong>C++</strong></td>
     * <td>
     * <b>VARIANT_BOOL</b>. If <b>VARIANT_TRUE</b>, children inherit the permission. Note that this parameter is significant only when you add permissions to security information using the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nf-gpmgmt-igpmsecurityinfo-add">IGPMSecurityInfo::Add</a> method. This parameter is ignored for searches.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><strong>JScript</strong></td>
     * <td>
     * If true, children inherit the permission. Note that this parameter is significant only when you add permissions to security information using the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nf-gpmgmt-igpmsecurityinfo-add">GPMSecurityInfo.Add</a> method. This parameter is ignored for searches.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {IGPMPermission} Address of a pointer to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmpermission">IGPMPermission</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nf-gpmgmt-igpm-createpermission
     */
    CreatePermission(bstrTrustee, perm, bInheritable) {
        bstrTrustee := bstrTrustee is String ? BSTR.Alloc(bstrTrustee).Value : bstrTrustee

        result := ComCall(11, this, "ptr", bstrTrustee, "int", perm, "short", bInheritable, "ptr*", &ppPerm := 0, "HRESULT")
        return IGPMPermission(ppPerm)
    }

    /**
     * Creates and returns a GPMSearchCriteria that represents the criteria to use for performing search operations when you use the Group Policy Management Console (GPMC) interfaces.
     * @returns {IGPMSearchCriteria} Address of a pointer to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmsearchcriteria">IGPMSearchCriteria</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nf-gpmgmt-igpm-createsearchcriteria
     */
    CreateSearchCriteria() {
        result := ComCall(12, this, "ptr*", &ppIGPMSearchCriteria := 0, "HRESULT")
        return IGPMSearchCriteria(ppIGPMSearchCriteria)
    }

    /**
     * Creates and returns a GPMTrustee from which you can retrieve information about a trustee.
     * @param {BSTR} bstrTrustee Required. Trustee name or the security identifier (SID). Names are in a format that is compatible with Security Accounts Manager (SAM), such as <i>Exampledomain</i>&#92;<i>Someone</i>.
     * @returns {IGPMTrustee} Address of a pointer to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmtrustee">IGPMTrustee</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nf-gpmgmt-igpm-createtrustee
     */
    CreateTrustee(bstrTrustee) {
        bstrTrustee := bstrTrustee is String ? BSTR.Alloc(bstrTrustee).Value : bstrTrustee

        result := ComCall(13, this, "ptr", bstrTrustee, "ptr*", &ppIGPMTrustee := 0, "HRESULT")
        return IGPMTrustee(ppIGPMTrustee)
    }

    /**
     * Creates and returns a GPMCSECollection object that allows you to enumerate Group Policy client-side extensions (CSEs) that are registered on the local computer.
     * @returns {IGPMCSECollection} Address of a pointer to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmcsecollection">IGPMCSECollection</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nf-gpmgmt-igpm-getclientsideextensions
     */
    GetClientSideExtensions() {
        result := ComCall(14, this, "ptr*", &ppIGPMCSECollection := 0, "HRESULT")
        return IGPMCSECollection(ppIGPMCSECollection)
    }

    /**
     * Creates and returns a GPMConstants object that allows you to retrieve the value of multiple Group Policy Management Console (GPMC) constants.
     * @returns {IGPMConstants} Address of a pointer to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmconstants">IGPMConstants</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nf-gpmgmt-igpm-getconstants
     */
    GetConstants() {
        result := ComCall(15, this, "ptr*", &ppIGPMConstants := 0, "HRESULT")
        return IGPMConstants(ppIGPMConstants)
    }

    /**
     * Loads the migration table at a specified path.
     * @param {BSTR} bstrMigrationTablePath The path of the migration table to be loaded. Use a null-terminated string.
     * @returns {IGPMMigrationTable} The migration table interface that contains the entries from the migration table.
     * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nf-gpmgmt-igpm-getmigrationtable
     */
    GetMigrationTable(bstrMigrationTablePath) {
        bstrMigrationTablePath := bstrMigrationTablePath is String ? BSTR.Alloc(bstrMigrationTablePath).Value : bstrMigrationTablePath

        result := ComCall(16, this, "ptr", bstrMigrationTablePath, "ptr*", &ppMigrationTable := 0, "HRESULT")
        return IGPMMigrationTable(ppMigrationTable)
    }

    /**
     * Creates an empty migration table.
     * @returns {IGPMMigrationTable} Receives the created migration table that contains no entries. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmmigrationtable">IGPMMigrationTable</a>.
     * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nf-gpmgmt-igpm-createmigrationtable
     */
    CreateMigrationTable() {
        result := ComCall(17, this, "ptr*", &ppMigrationTable := 0, "HRESULT")
        return IGPMMigrationTable(ppMigrationTable)
    }

    /**
     * The InitializeReporting method sets the location to search for .adm files. This method initializes reporting in an asynchronous manner.
     * @param {BSTR} bstrAdmPath Location to search for .adm files. Use a null-terminated string.
     * @returns {HRESULT} <h3>C++</h3>
     * Returns <b>S_OK</b> if successful. Returns a failure code if an error occurs.
     * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nf-gpmgmt-igpm-initializereporting
     */
    InitializeReporting(bstrAdmPath) {
        bstrAdmPath := bstrAdmPath is String ? BSTR.Alloc(bstrAdmPath).Value : bstrAdmPath

        result := ComCall(18, this, "ptr", bstrAdmPath, "HRESULT")
        return result
    }
}
