#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\GPMReportingOptions.ahk
#Include .\GPMPermissionType.ahk
#Include .\GPMSearchProperty.ahk
#Include .\GPMBackupType.ahk
#Include .\IGPMConstants.ahk
#Include .\GPMStarterGPOType.ahk
#Include ..\..\Foundation\HRESULT.ahk

/**
 * The IGPMConstants2 interface supports methods that retrieve the value of multiple Group Policy Management Console (GPMC) constants.
 * @remarks
 * For more information about policy-related permissions, see 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nf-gpmgmt-igpm-createpermission">IGPM::CreatePermission</a> (<b>GPM.CreatePermission</b>).
 * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nn-gpmgmt-igpmconstants2
 * @namespace Windows.Win32.System.GroupPolicy
 */
class IGPMConstants2 extends IGPMConstants {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGPMConstants2
     * @type {Guid}
     */
    static IID => Guid("{05ae21b0-ac09-4032-a26f-9e7da786dc19}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 67

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BackupTypeGPO", "get_BackupTypeStarterGPO", "get_StarterGPOTypeSystem", "get_StarterGPOTypeCustom", "get_SearchPropertyStarterGPOPermissions", "get_SearchPropertyStarterGPOEffectivePermissions", "get_SearchPropertyStarterGPODisplayName", "get_SearchPropertyStarterGPOID", "get_SearchPropertyStarterGPODomain", "get_PermStarterGPORead", "get_PermStarterGPOEdit", "get_PermStarterGPOFullControl", "get_PermStarterGPOCustom", "get_ReportLegacy", "get_ReportComments"]

    /**
     * @type {GPMBackupType} 
     */
    BackupTypeGPO {
        get => this.get_BackupTypeGPO()
    }

    /**
     * @type {GPMBackupType} 
     */
    BackupTypeStarterGPO {
        get => this.get_BackupTypeStarterGPO()
    }

    /**
     * @type {GPMStarterGPOType} 
     */
    StarterGPOTypeSystem {
        get => this.get_StarterGPOTypeSystem()
    }

    /**
     * @type {GPMStarterGPOType} 
     */
    StarterGPOTypeCustom {
        get => this.get_StarterGPOTypeCustom()
    }

    /**
     * @type {GPMSearchProperty} 
     */
    SearchPropertyStarterGPOPermissions {
        get => this.get_SearchPropertyStarterGPOPermissions()
    }

    /**
     * @type {GPMSearchProperty} 
     */
    SearchPropertyStarterGPOEffectivePermissions {
        get => this.get_SearchPropertyStarterGPOEffectivePermissions()
    }

    /**
     * @type {GPMSearchProperty} 
     */
    SearchPropertyStarterGPODisplayName {
        get => this.get_SearchPropertyStarterGPODisplayName()
    }

    /**
     * @type {GPMSearchProperty} 
     */
    SearchPropertyStarterGPOID {
        get => this.get_SearchPropertyStarterGPOID()
    }

    /**
     * @type {GPMSearchProperty} 
     */
    SearchPropertyStarterGPODomain {
        get => this.get_SearchPropertyStarterGPODomain()
    }

    /**
     * @type {GPMPermissionType} 
     */
    PermStarterGPORead {
        get => this.get_PermStarterGPORead()
    }

    /**
     * @type {GPMPermissionType} 
     */
    PermStarterGPOEdit {
        get => this.get_PermStarterGPOEdit()
    }

    /**
     * @type {GPMPermissionType} 
     */
    PermStarterGPOFullControl {
        get => this.get_PermStarterGPOFullControl()
    }

    /**
     * @type {GPMPermissionType} 
     */
    PermStarterGPOCustom {
        get => this.get_PermStarterGPOCustom()
    }

    /**
     * @type {GPMReportingOptions} 
     */
    ReportLegacy {
        get => this.get_ReportLegacy()
    }

    /**
     * @type {GPMReportingOptions} 
     */
    ReportComments {
        get => this.get_ReportComments()
    }

    /**
     * 
     * @returns {GPMBackupType} 
     */
    get_BackupTypeGPO() {
        result := ComCall(67, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {GPMBackupType} 
     */
    get_BackupTypeStarterGPO() {
        result := ComCall(68, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {GPMStarterGPOType} 
     */
    get_StarterGPOTypeSystem() {
        result := ComCall(69, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {GPMStarterGPOType} 
     */
    get_StarterGPOTypeCustom() {
        result := ComCall(70, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {GPMSearchProperty} 
     */
    get_SearchPropertyStarterGPOPermissions() {
        result := ComCall(71, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {GPMSearchProperty} 
     */
    get_SearchPropertyStarterGPOEffectivePermissions() {
        result := ComCall(72, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {GPMSearchProperty} 
     */
    get_SearchPropertyStarterGPODisplayName() {
        result := ComCall(73, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {GPMSearchProperty} 
     */
    get_SearchPropertyStarterGPOID() {
        result := ComCall(74, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {GPMSearchProperty} 
     */
    get_SearchPropertyStarterGPODomain() {
        result := ComCall(75, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {GPMPermissionType} 
     */
    get_PermStarterGPORead() {
        result := ComCall(76, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {GPMPermissionType} 
     */
    get_PermStarterGPOEdit() {
        result := ComCall(77, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {GPMPermissionType} 
     */
    get_PermStarterGPOFullControl() {
        result := ComCall(78, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {GPMPermissionType} 
     */
    get_PermStarterGPOCustom() {
        result := ComCall(79, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {GPMReportingOptions} 
     */
    get_ReportLegacy() {
        result := ComCall(80, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {GPMReportingOptions} 
     */
    get_ReportComments() {
        result := ComCall(81, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }
}
