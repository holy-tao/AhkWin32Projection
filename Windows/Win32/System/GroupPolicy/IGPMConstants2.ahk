#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\GPMStarterGPOType.ahk" { GPMStarterGPOType }
#Import ".\IGPMConstants.ahk" { IGPMConstants }
#Import ".\GPMPermissionType.ahk" { GPMPermissionType }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\GPMBackupType.ahk" { GPMBackupType }
#Import ".\GPMReportingOptions.ahk" { GPMReportingOptions }
#Import ".\GPMSearchProperty.ahk" { GPMSearchProperty }

/**
 * The IGPMConstants2 interface supports methods that retrieve the value of multiple Group Policy Management Console (GPMC) constants.
 * @remarks
 * For more information about policy-related permissions, see 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nf-gpmgmt-igpm-createpermission">IGPM::CreatePermission</a> (<b>GPM.CreatePermission</b>).
 * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nn-gpmgmt-igpmconstants2
 * @namespace Windows.Win32.System.GroupPolicy
 */
export default struct IGPMConstants2 extends IGPMConstants {
    /**
     * The interface identifier for IGPMConstants2
     * @type {Guid}
     */
    static IID := Guid("{05ae21b0-ac09-4032-a26f-9e7da786dc19}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IGPMConstants2 interfaces
    */
    struct Vtbl extends IGPMConstants.Vtbl {
        get_BackupTypeGPO                                : IntPtr
        get_BackupTypeStarterGPO                         : IntPtr
        get_StarterGPOTypeSystem                         : IntPtr
        get_StarterGPOTypeCustom                         : IntPtr
        get_SearchPropertyStarterGPOPermissions          : IntPtr
        get_SearchPropertyStarterGPOEffectivePermissions : IntPtr
        get_SearchPropertyStarterGPODisplayName          : IntPtr
        get_SearchPropertyStarterGPOID                   : IntPtr
        get_SearchPropertyStarterGPODomain               : IntPtr
        get_PermStarterGPORead                           : IntPtr
        get_PermStarterGPOEdit                           : IntPtr
        get_PermStarterGPOFullControl                    : IntPtr
        get_PermStarterGPOCustom                         : IntPtr
        get_ReportLegacy                                 : IntPtr
        get_ReportComments                               : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IGPMConstants2.Vtbl()
        }
        super.__New(implObj, flags)
    }

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

    Query(iid) {
        if (IGPMConstants2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_BackupTypeGPO := CallbackCreate(GetMethod(implObj, "get_BackupTypeGPO"), flags, 2)
        this.vtbl.get_BackupTypeStarterGPO := CallbackCreate(GetMethod(implObj, "get_BackupTypeStarterGPO"), flags, 2)
        this.vtbl.get_StarterGPOTypeSystem := CallbackCreate(GetMethod(implObj, "get_StarterGPOTypeSystem"), flags, 2)
        this.vtbl.get_StarterGPOTypeCustom := CallbackCreate(GetMethod(implObj, "get_StarterGPOTypeCustom"), flags, 2)
        this.vtbl.get_SearchPropertyStarterGPOPermissions := CallbackCreate(GetMethod(implObj, "get_SearchPropertyStarterGPOPermissions"), flags, 2)
        this.vtbl.get_SearchPropertyStarterGPOEffectivePermissions := CallbackCreate(GetMethod(implObj, "get_SearchPropertyStarterGPOEffectivePermissions"), flags, 2)
        this.vtbl.get_SearchPropertyStarterGPODisplayName := CallbackCreate(GetMethod(implObj, "get_SearchPropertyStarterGPODisplayName"), flags, 2)
        this.vtbl.get_SearchPropertyStarterGPOID := CallbackCreate(GetMethod(implObj, "get_SearchPropertyStarterGPOID"), flags, 2)
        this.vtbl.get_SearchPropertyStarterGPODomain := CallbackCreate(GetMethod(implObj, "get_SearchPropertyStarterGPODomain"), flags, 2)
        this.vtbl.get_PermStarterGPORead := CallbackCreate(GetMethod(implObj, "get_PermStarterGPORead"), flags, 2)
        this.vtbl.get_PermStarterGPOEdit := CallbackCreate(GetMethod(implObj, "get_PermStarterGPOEdit"), flags, 2)
        this.vtbl.get_PermStarterGPOFullControl := CallbackCreate(GetMethod(implObj, "get_PermStarterGPOFullControl"), flags, 2)
        this.vtbl.get_PermStarterGPOCustom := CallbackCreate(GetMethod(implObj, "get_PermStarterGPOCustom"), flags, 2)
        this.vtbl.get_ReportLegacy := CallbackCreate(GetMethod(implObj, "get_ReportLegacy"), flags, 2)
        this.vtbl.get_ReportComments := CallbackCreate(GetMethod(implObj, "get_ReportComments"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_BackupTypeGPO)
        CallbackFree(this.vtbl.get_BackupTypeStarterGPO)
        CallbackFree(this.vtbl.get_StarterGPOTypeSystem)
        CallbackFree(this.vtbl.get_StarterGPOTypeCustom)
        CallbackFree(this.vtbl.get_SearchPropertyStarterGPOPermissions)
        CallbackFree(this.vtbl.get_SearchPropertyStarterGPOEffectivePermissions)
        CallbackFree(this.vtbl.get_SearchPropertyStarterGPODisplayName)
        CallbackFree(this.vtbl.get_SearchPropertyStarterGPOID)
        CallbackFree(this.vtbl.get_SearchPropertyStarterGPODomain)
        CallbackFree(this.vtbl.get_PermStarterGPORead)
        CallbackFree(this.vtbl.get_PermStarterGPOEdit)
        CallbackFree(this.vtbl.get_PermStarterGPOFullControl)
        CallbackFree(this.vtbl.get_PermStarterGPOCustom)
        CallbackFree(this.vtbl.get_ReportLegacy)
        CallbackFree(this.vtbl.get_ReportComments)
    }
}
