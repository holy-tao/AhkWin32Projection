#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\GPMSOMType.ahk" { GPMSOMType }
#Import ".\GPMDestinationOption.ahk" { GPMDestinationOption }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import ".\GPMReportType.ahk" { GPMReportType }
#Import ".\GPMSearchOperation.ahk" { GPMSearchOperation }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\GPMPermissionType.ahk" { GPMPermissionType }
#Import ".\GPMRSOPMode.ahk" { GPMRSOPMode }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\GPMEntryType.ahk" { GPMEntryType }
#Import ".\GPMSearchProperty.ahk" { GPMSearchProperty }

/**
 * The IGPMConstants interface supports methods that retrieve the value of multiple Group Policy Management Console (GPMC) constants. To create a GPMConstants object, call the IGPM::GetConstants method.
 * @remarks
 * Properties that begin with <b>PermGPO</b> apply only to GPOs. Properties that begin with <b>PermWMIFilter</b> apply only to Windows Management Instrumentation (WMI) filters.
 * 
 * For more information about policy-related permissions, see 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nf-gpmgmt-igpm-createpermission">IGPM::CreatePermission</a> (<b>GPM.CreatePermission</b>).
 * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nn-gpmgmt-igpmconstants
 * @namespace Windows.Win32.System.GroupPolicy
 */
export default struct IGPMConstants extends IDispatch {
    /**
     * The interface identifier for IGPMConstants
     * @type {Guid}
     */
    static IID := Guid("{50ef73e6-d35c-4c8d-be63-7ea5d2aac5c4}")

    /**
     * The class identifier for GPMConstants
     * @type {Guid}
     */
    static CLSID := Guid("{3855e880-cd9e-4d0c-9eaf-1579283a1888}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IGPMConstants interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_PermGPOApply                          : IntPtr
        get_PermGPORead                           : IntPtr
        get_PermGPOEdit                           : IntPtr
        get_PermGPOEditSecurityAndDelete          : IntPtr
        get_PermGPOCustom                         : IntPtr
        get_PermWMIFilterEdit                     : IntPtr
        get_PermWMIFilterFullControl              : IntPtr
        get_PermWMIFilterCustom                   : IntPtr
        get_PermSOMLink                           : IntPtr
        get_PermSOMLogging                        : IntPtr
        get_PermSOMPlanning                       : IntPtr
        get_PermSOMGPOCreate                      : IntPtr
        get_PermSOMWMICreate                      : IntPtr
        get_PermSOMWMIFullControl                 : IntPtr
        get_SearchPropertyGPOPermissions          : IntPtr
        get_SearchPropertyGPOEffectivePermissions : IntPtr
        get_SearchPropertyGPODisplayName          : IntPtr
        get_SearchPropertyGPOWMIFilter            : IntPtr
        get_SearchPropertyGPOID                   : IntPtr
        get_SearchPropertyGPOComputerExtensions   : IntPtr
        get_SearchPropertyGPOUserExtensions       : IntPtr
        get_SearchPropertySOMLinks                : IntPtr
        get_SearchPropertyGPODomain               : IntPtr
        get_SearchPropertyBackupMostRecent        : IntPtr
        get_SearchOpEquals                        : IntPtr
        get_SearchOpContains                      : IntPtr
        get_SearchOpNotContains                   : IntPtr
        get_SearchOpNotEquals                     : IntPtr
        get_UsePDC                                : IntPtr
        get_UseAnyDC                              : IntPtr
        get_DoNotUseW2KDC                         : IntPtr
        get_SOMSite                               : IntPtr
        get_SOMDomain                             : IntPtr
        get_SOMOU                                 : IntPtr
        get_SecurityFlags                         : IntPtr
        get_DoNotValidateDC                       : IntPtr
        get_ReportHTML                            : IntPtr
        get_ReportXML                             : IntPtr
        get_RSOPModeUnknown                       : IntPtr
        get_RSOPModePlanning                      : IntPtr
        get_RSOPModeLogging                       : IntPtr
        get_EntryTypeUser                         : IntPtr
        get_EntryTypeComputer                     : IntPtr
        get_EntryTypeLocalGroup                   : IntPtr
        get_EntryTypeGlobalGroup                  : IntPtr
        get_EntryTypeUniversalGroup               : IntPtr
        get_EntryTypeUNCPath                      : IntPtr
        get_EntryTypeUnknown                      : IntPtr
        get_DestinationOptionSameAsSource         : IntPtr
        get_DestinationOptionNone                 : IntPtr
        get_DestinationOptionByRelativeName       : IntPtr
        get_DestinationOptionSet                  : IntPtr
        get_MigrationTableOnly                    : IntPtr
        get_ProcessSecurity                       : IntPtr
        get_RsopLoggingNoComputer                 : IntPtr
        get_RsopLoggingNoUser                     : IntPtr
        get_RsopPlanningAssumeSlowLink            : IntPtr
        get_RsopPlanningLoopbackOption            : IntPtr
        get_RsopPlanningAssumeUserWQLFilterTrue   : IntPtr
        get_RsopPlanningAssumeCompWQLFilterTrue   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IGPMConstants.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {GPMPermissionType} 
     */
    PermGPOApply {
        get => this.get_PermGPOApply()
    }

    /**
     * @type {GPMPermissionType} 
     */
    PermGPORead {
        get => this.get_PermGPORead()
    }

    /**
     * @type {GPMPermissionType} 
     */
    PermGPOEdit {
        get => this.get_PermGPOEdit()
    }

    /**
     * @type {GPMPermissionType} 
     */
    PermGPOEditSecurityAndDelete {
        get => this.get_PermGPOEditSecurityAndDelete()
    }

    /**
     * @type {GPMPermissionType} 
     */
    PermGPOCustom {
        get => this.get_PermGPOCustom()
    }

    /**
     * @type {GPMPermissionType} 
     */
    PermWMIFilterEdit {
        get => this.get_PermWMIFilterEdit()
    }

    /**
     * @type {GPMPermissionType} 
     */
    PermWMIFilterFullControl {
        get => this.get_PermWMIFilterFullControl()
    }

    /**
     * @type {GPMPermissionType} 
     */
    PermWMIFilterCustom {
        get => this.get_PermWMIFilterCustom()
    }

    /**
     * @type {GPMPermissionType} 
     */
    PermSOMLink {
        get => this.get_PermSOMLink()
    }

    /**
     * @type {GPMPermissionType} 
     */
    PermSOMLogging {
        get => this.get_PermSOMLogging()
    }

    /**
     * @type {GPMPermissionType} 
     */
    PermSOMPlanning {
        get => this.get_PermSOMPlanning()
    }

    /**
     * @type {GPMPermissionType} 
     */
    PermSOMGPOCreate {
        get => this.get_PermSOMGPOCreate()
    }

    /**
     * @type {GPMPermissionType} 
     */
    PermSOMWMICreate {
        get => this.get_PermSOMWMICreate()
    }

    /**
     * @type {GPMPermissionType} 
     */
    PermSOMWMIFullControl {
        get => this.get_PermSOMWMIFullControl()
    }

    /**
     * @type {GPMSearchProperty} 
     */
    SearchPropertyGPOPermissions {
        get => this.get_SearchPropertyGPOPermissions()
    }

    /**
     * @type {GPMSearchProperty} 
     */
    SearchPropertyGPOEffectivePermissions {
        get => this.get_SearchPropertyGPOEffectivePermissions()
    }

    /**
     * @type {GPMSearchProperty} 
     */
    SearchPropertyGPODisplayName {
        get => this.get_SearchPropertyGPODisplayName()
    }

    /**
     * @type {GPMSearchProperty} 
     */
    SearchPropertyGPOWMIFilter {
        get => this.get_SearchPropertyGPOWMIFilter()
    }

    /**
     * @type {GPMSearchProperty} 
     */
    SearchPropertyGPOID {
        get => this.get_SearchPropertyGPOID()
    }

    /**
     * @type {GPMSearchProperty} 
     */
    SearchPropertyGPOComputerExtensions {
        get => this.get_SearchPropertyGPOComputerExtensions()
    }

    /**
     * @type {GPMSearchProperty} 
     */
    SearchPropertyGPOUserExtensions {
        get => this.get_SearchPropertyGPOUserExtensions()
    }

    /**
     * @type {GPMSearchProperty} 
     */
    SearchPropertySOMLinks {
        get => this.get_SearchPropertySOMLinks()
    }

    /**
     * @type {GPMSearchProperty} 
     */
    SearchPropertyGPODomain {
        get => this.get_SearchPropertyGPODomain()
    }

    /**
     * @type {GPMSearchProperty} 
     */
    SearchPropertyBackupMostRecent {
        get => this.get_SearchPropertyBackupMostRecent()
    }

    /**
     * @type {GPMSearchOperation} 
     */
    SearchOpEquals {
        get => this.get_SearchOpEquals()
    }

    /**
     * @type {GPMSearchOperation} 
     */
    SearchOpContains {
        get => this.get_SearchOpContains()
    }

    /**
     * @type {GPMSearchOperation} 
     */
    SearchOpNotContains {
        get => this.get_SearchOpNotContains()
    }

    /**
     * @type {GPMSearchOperation} 
     */
    SearchOpNotEquals {
        get => this.get_SearchOpNotEquals()
    }

    /**
     * @type {Integer} 
     */
    UsePDC {
        get => this.get_UsePDC()
    }

    /**
     * @type {Integer} 
     */
    UseAnyDC {
        get => this.get_UseAnyDC()
    }

    /**
     * @type {Integer} 
     */
    DoNotUseW2KDC {
        get => this.get_DoNotUseW2KDC()
    }

    /**
     * @type {GPMSOMType} 
     */
    SOMSite {
        get => this.get_SOMSite()
    }

    /**
     * @type {GPMSOMType} 
     */
    SOMDomain {
        get => this.get_SOMDomain()
    }

    /**
     * @type {GPMSOMType} 
     */
    SOMOU {
        get => this.get_SOMOU()
    }

    /**
     * @type {Integer} 
     */
    DoNotValidateDC {
        get => this.get_DoNotValidateDC()
    }

    /**
     * @type {GPMReportType} 
     */
    ReportHTML {
        get => this.get_ReportHTML()
    }

    /**
     * @type {GPMReportType} 
     */
    ReportXML {
        get => this.get_ReportXML()
    }

    /**
     * @type {GPMRSOPMode} 
     */
    RSOPModeUnknown {
        get => this.get_RSOPModeUnknown()
    }

    /**
     * @type {GPMRSOPMode} 
     */
    RSOPModePlanning {
        get => this.get_RSOPModePlanning()
    }

    /**
     * @type {GPMRSOPMode} 
     */
    RSOPModeLogging {
        get => this.get_RSOPModeLogging()
    }

    /**
     * @type {GPMEntryType} 
     */
    EntryTypeUser {
        get => this.get_EntryTypeUser()
    }

    /**
     * @type {GPMEntryType} 
     */
    EntryTypeComputer {
        get => this.get_EntryTypeComputer()
    }

    /**
     * @type {GPMEntryType} 
     */
    EntryTypeLocalGroup {
        get => this.get_EntryTypeLocalGroup()
    }

    /**
     * @type {GPMEntryType} 
     */
    EntryTypeGlobalGroup {
        get => this.get_EntryTypeGlobalGroup()
    }

    /**
     * @type {GPMEntryType} 
     */
    EntryTypeUniversalGroup {
        get => this.get_EntryTypeUniversalGroup()
    }

    /**
     * @type {GPMEntryType} 
     */
    EntryTypeUNCPath {
        get => this.get_EntryTypeUNCPath()
    }

    /**
     * @type {GPMEntryType} 
     */
    EntryTypeUnknown {
        get => this.get_EntryTypeUnknown()
    }

    /**
     * @type {GPMDestinationOption} 
     */
    DestinationOptionSameAsSource {
        get => this.get_DestinationOptionSameAsSource()
    }

    /**
     * @type {GPMDestinationOption} 
     */
    DestinationOptionNone {
        get => this.get_DestinationOptionNone()
    }

    /**
     * @type {GPMDestinationOption} 
     */
    DestinationOptionByRelativeName {
        get => this.get_DestinationOptionByRelativeName()
    }

    /**
     * @type {GPMDestinationOption} 
     */
    DestinationOptionSet {
        get => this.get_DestinationOptionSet()
    }

    /**
     * @type {Integer} 
     */
    MigrationTableOnly {
        get => this.get_MigrationTableOnly()
    }

    /**
     * @type {Integer} 
     */
    ProcessSecurity {
        get => this.get_ProcessSecurity()
    }

    /**
     * @type {Integer} 
     */
    RsopLoggingNoComputer {
        get => this.get_RsopLoggingNoComputer()
    }

    /**
     * @type {Integer} 
     */
    RsopLoggingNoUser {
        get => this.get_RsopLoggingNoUser()
    }

    /**
     * @type {Integer} 
     */
    RsopPlanningAssumeSlowLink {
        get => this.get_RsopPlanningAssumeSlowLink()
    }

    /**
     * @type {Integer} 
     */
    RsopPlanningAssumeUserWQLFilterTrue {
        get => this.get_RsopPlanningAssumeUserWQLFilterTrue()
    }

    /**
     * @type {Integer} 
     */
    RsopPlanningAssumeCompWQLFilterTrue {
        get => this.get_RsopPlanningAssumeCompWQLFilterTrue()
    }

    /**
     * 
     * @returns {GPMPermissionType} 
     */
    get_PermGPOApply() {
        result := ComCall(7, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {GPMPermissionType} 
     */
    get_PermGPORead() {
        result := ComCall(8, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {GPMPermissionType} 
     */
    get_PermGPOEdit() {
        result := ComCall(9, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {GPMPermissionType} 
     */
    get_PermGPOEditSecurityAndDelete() {
        result := ComCall(10, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {GPMPermissionType} 
     */
    get_PermGPOCustom() {
        result := ComCall(11, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {GPMPermissionType} 
     */
    get_PermWMIFilterEdit() {
        result := ComCall(12, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {GPMPermissionType} 
     */
    get_PermWMIFilterFullControl() {
        result := ComCall(13, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {GPMPermissionType} 
     */
    get_PermWMIFilterCustom() {
        result := ComCall(14, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {GPMPermissionType} 
     */
    get_PermSOMLink() {
        result := ComCall(15, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {GPMPermissionType} 
     */
    get_PermSOMLogging() {
        result := ComCall(16, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {GPMPermissionType} 
     */
    get_PermSOMPlanning() {
        result := ComCall(17, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {GPMPermissionType} 
     */
    get_PermSOMGPOCreate() {
        result := ComCall(18, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {GPMPermissionType} 
     */
    get_PermSOMWMICreate() {
        result := ComCall(19, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {GPMPermissionType} 
     */
    get_PermSOMWMIFullControl() {
        result := ComCall(20, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {GPMSearchProperty} 
     */
    get_SearchPropertyGPOPermissions() {
        result := ComCall(21, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {GPMSearchProperty} 
     */
    get_SearchPropertyGPOEffectivePermissions() {
        result := ComCall(22, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {GPMSearchProperty} 
     */
    get_SearchPropertyGPODisplayName() {
        result := ComCall(23, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {GPMSearchProperty} 
     */
    get_SearchPropertyGPOWMIFilter() {
        result := ComCall(24, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {GPMSearchProperty} 
     */
    get_SearchPropertyGPOID() {
        result := ComCall(25, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {GPMSearchProperty} 
     */
    get_SearchPropertyGPOComputerExtensions() {
        result := ComCall(26, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {GPMSearchProperty} 
     */
    get_SearchPropertyGPOUserExtensions() {
        result := ComCall(27, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {GPMSearchProperty} 
     */
    get_SearchPropertySOMLinks() {
        result := ComCall(28, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {GPMSearchProperty} 
     */
    get_SearchPropertyGPODomain() {
        result := ComCall(29, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {GPMSearchProperty} 
     */
    get_SearchPropertyBackupMostRecent() {
        result := ComCall(30, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {GPMSearchOperation} 
     */
    get_SearchOpEquals() {
        result := ComCall(31, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {GPMSearchOperation} 
     */
    get_SearchOpContains() {
        result := ComCall(32, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {GPMSearchOperation} 
     */
    get_SearchOpNotContains() {
        result := ComCall(33, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {GPMSearchOperation} 
     */
    get_SearchOpNotEquals() {
        result := ComCall(34, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UsePDC() {
        result := ComCall(35, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UseAnyDC() {
        result := ComCall(36, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DoNotUseW2KDC() {
        result := ComCall(37, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {GPMSOMType} 
     */
    get_SOMSite() {
        result := ComCall(38, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {GPMSOMType} 
     */
    get_SOMDomain() {
        result := ComCall(39, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {GPMSOMType} 
     */
    get_SOMOU() {
        result := ComCall(40, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Retrieves the value of the SecurityFlags property, which represents the portion of the security descriptor to retrieve or set for a GPO.
     * @remarks
     * For more information about access control lists (ACLs) and the security model for controlling access to objects, see <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control">Access Control</a>.
     * @param {VARIANT_BOOL} vbOwner 
     * @param {VARIANT_BOOL} vbGroup 
     * @param {VARIANT_BOOL} vbDACL 
     * @param {VARIANT_BOOL} vbSACL 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmconstants-get_securityflags
     */
    get_SecurityFlags(vbOwner, vbGroup, vbDACL, vbSACL) {
        result := ComCall(41, this, VARIANT_BOOL, vbOwner, VARIANT_BOOL, vbGroup, VARIANT_BOOL, vbDACL, VARIANT_BOOL, vbSACL, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DoNotValidateDC() {
        result := ComCall(42, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {GPMReportType} 
     */
    get_ReportHTML() {
        result := ComCall(43, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {GPMReportType} 
     */
    get_ReportXML() {
        result := ComCall(44, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {GPMRSOPMode} 
     */
    get_RSOPModeUnknown() {
        result := ComCall(45, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {GPMRSOPMode} 
     */
    get_RSOPModePlanning() {
        result := ComCall(46, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {GPMRSOPMode} 
     */
    get_RSOPModeLogging() {
        result := ComCall(47, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {GPMEntryType} 
     */
    get_EntryTypeUser() {
        result := ComCall(48, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {GPMEntryType} 
     */
    get_EntryTypeComputer() {
        result := ComCall(49, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {GPMEntryType} 
     */
    get_EntryTypeLocalGroup() {
        result := ComCall(50, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {GPMEntryType} 
     */
    get_EntryTypeGlobalGroup() {
        result := ComCall(51, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {GPMEntryType} 
     */
    get_EntryTypeUniversalGroup() {
        result := ComCall(52, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {GPMEntryType} 
     */
    get_EntryTypeUNCPath() {
        result := ComCall(53, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {GPMEntryType} 
     */
    get_EntryTypeUnknown() {
        result := ComCall(54, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {GPMDestinationOption} 
     */
    get_DestinationOptionSameAsSource() {
        result := ComCall(55, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {GPMDestinationOption} 
     */
    get_DestinationOptionNone() {
        result := ComCall(56, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {GPMDestinationOption} 
     */
    get_DestinationOptionByRelativeName() {
        result := ComCall(57, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {GPMDestinationOption} 
     */
    get_DestinationOptionSet() {
        result := ComCall(58, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MigrationTableOnly() {
        result := ComCall(59, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ProcessSecurity() {
        result := ComCall(60, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RsopLoggingNoComputer() {
        result := ComCall(61, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RsopLoggingNoUser() {
        result := ComCall(62, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RsopPlanningAssumeSlowLink() {
        result := ComCall(63, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {VARIANT_BOOL} vbMerge 
     * @returns {Integer} 
     */
    get_RsopPlanningLoopbackOption(vbMerge) {
        result := ComCall(64, this, VARIANT_BOOL, vbMerge, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RsopPlanningAssumeUserWQLFilterTrue() {
        result := ComCall(65, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RsopPlanningAssumeCompWQLFilterTrue() {
        result := ComCall(66, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    Query(iid) {
        if (IGPMConstants.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_PermGPOApply := CallbackCreate(GetMethod(implObj, "get_PermGPOApply"), flags, 2)
        this.vtbl.get_PermGPORead := CallbackCreate(GetMethod(implObj, "get_PermGPORead"), flags, 2)
        this.vtbl.get_PermGPOEdit := CallbackCreate(GetMethod(implObj, "get_PermGPOEdit"), flags, 2)
        this.vtbl.get_PermGPOEditSecurityAndDelete := CallbackCreate(GetMethod(implObj, "get_PermGPOEditSecurityAndDelete"), flags, 2)
        this.vtbl.get_PermGPOCustom := CallbackCreate(GetMethod(implObj, "get_PermGPOCustom"), flags, 2)
        this.vtbl.get_PermWMIFilterEdit := CallbackCreate(GetMethod(implObj, "get_PermWMIFilterEdit"), flags, 2)
        this.vtbl.get_PermWMIFilterFullControl := CallbackCreate(GetMethod(implObj, "get_PermWMIFilterFullControl"), flags, 2)
        this.vtbl.get_PermWMIFilterCustom := CallbackCreate(GetMethod(implObj, "get_PermWMIFilterCustom"), flags, 2)
        this.vtbl.get_PermSOMLink := CallbackCreate(GetMethod(implObj, "get_PermSOMLink"), flags, 2)
        this.vtbl.get_PermSOMLogging := CallbackCreate(GetMethod(implObj, "get_PermSOMLogging"), flags, 2)
        this.vtbl.get_PermSOMPlanning := CallbackCreate(GetMethod(implObj, "get_PermSOMPlanning"), flags, 2)
        this.vtbl.get_PermSOMGPOCreate := CallbackCreate(GetMethod(implObj, "get_PermSOMGPOCreate"), flags, 2)
        this.vtbl.get_PermSOMWMICreate := CallbackCreate(GetMethod(implObj, "get_PermSOMWMICreate"), flags, 2)
        this.vtbl.get_PermSOMWMIFullControl := CallbackCreate(GetMethod(implObj, "get_PermSOMWMIFullControl"), flags, 2)
        this.vtbl.get_SearchPropertyGPOPermissions := CallbackCreate(GetMethod(implObj, "get_SearchPropertyGPOPermissions"), flags, 2)
        this.vtbl.get_SearchPropertyGPOEffectivePermissions := CallbackCreate(GetMethod(implObj, "get_SearchPropertyGPOEffectivePermissions"), flags, 2)
        this.vtbl.get_SearchPropertyGPODisplayName := CallbackCreate(GetMethod(implObj, "get_SearchPropertyGPODisplayName"), flags, 2)
        this.vtbl.get_SearchPropertyGPOWMIFilter := CallbackCreate(GetMethod(implObj, "get_SearchPropertyGPOWMIFilter"), flags, 2)
        this.vtbl.get_SearchPropertyGPOID := CallbackCreate(GetMethod(implObj, "get_SearchPropertyGPOID"), flags, 2)
        this.vtbl.get_SearchPropertyGPOComputerExtensions := CallbackCreate(GetMethod(implObj, "get_SearchPropertyGPOComputerExtensions"), flags, 2)
        this.vtbl.get_SearchPropertyGPOUserExtensions := CallbackCreate(GetMethod(implObj, "get_SearchPropertyGPOUserExtensions"), flags, 2)
        this.vtbl.get_SearchPropertySOMLinks := CallbackCreate(GetMethod(implObj, "get_SearchPropertySOMLinks"), flags, 2)
        this.vtbl.get_SearchPropertyGPODomain := CallbackCreate(GetMethod(implObj, "get_SearchPropertyGPODomain"), flags, 2)
        this.vtbl.get_SearchPropertyBackupMostRecent := CallbackCreate(GetMethod(implObj, "get_SearchPropertyBackupMostRecent"), flags, 2)
        this.vtbl.get_SearchOpEquals := CallbackCreate(GetMethod(implObj, "get_SearchOpEquals"), flags, 2)
        this.vtbl.get_SearchOpContains := CallbackCreate(GetMethod(implObj, "get_SearchOpContains"), flags, 2)
        this.vtbl.get_SearchOpNotContains := CallbackCreate(GetMethod(implObj, "get_SearchOpNotContains"), flags, 2)
        this.vtbl.get_SearchOpNotEquals := CallbackCreate(GetMethod(implObj, "get_SearchOpNotEquals"), flags, 2)
        this.vtbl.get_UsePDC := CallbackCreate(GetMethod(implObj, "get_UsePDC"), flags, 2)
        this.vtbl.get_UseAnyDC := CallbackCreate(GetMethod(implObj, "get_UseAnyDC"), flags, 2)
        this.vtbl.get_DoNotUseW2KDC := CallbackCreate(GetMethod(implObj, "get_DoNotUseW2KDC"), flags, 2)
        this.vtbl.get_SOMSite := CallbackCreate(GetMethod(implObj, "get_SOMSite"), flags, 2)
        this.vtbl.get_SOMDomain := CallbackCreate(GetMethod(implObj, "get_SOMDomain"), flags, 2)
        this.vtbl.get_SOMOU := CallbackCreate(GetMethod(implObj, "get_SOMOU"), flags, 2)
        this.vtbl.get_SecurityFlags := CallbackCreate(GetMethod(implObj, "get_SecurityFlags"), flags, 6)
        this.vtbl.get_DoNotValidateDC := CallbackCreate(GetMethod(implObj, "get_DoNotValidateDC"), flags, 2)
        this.vtbl.get_ReportHTML := CallbackCreate(GetMethod(implObj, "get_ReportHTML"), flags, 2)
        this.vtbl.get_ReportXML := CallbackCreate(GetMethod(implObj, "get_ReportXML"), flags, 2)
        this.vtbl.get_RSOPModeUnknown := CallbackCreate(GetMethod(implObj, "get_RSOPModeUnknown"), flags, 2)
        this.vtbl.get_RSOPModePlanning := CallbackCreate(GetMethod(implObj, "get_RSOPModePlanning"), flags, 2)
        this.vtbl.get_RSOPModeLogging := CallbackCreate(GetMethod(implObj, "get_RSOPModeLogging"), flags, 2)
        this.vtbl.get_EntryTypeUser := CallbackCreate(GetMethod(implObj, "get_EntryTypeUser"), flags, 2)
        this.vtbl.get_EntryTypeComputer := CallbackCreate(GetMethod(implObj, "get_EntryTypeComputer"), flags, 2)
        this.vtbl.get_EntryTypeLocalGroup := CallbackCreate(GetMethod(implObj, "get_EntryTypeLocalGroup"), flags, 2)
        this.vtbl.get_EntryTypeGlobalGroup := CallbackCreate(GetMethod(implObj, "get_EntryTypeGlobalGroup"), flags, 2)
        this.vtbl.get_EntryTypeUniversalGroup := CallbackCreate(GetMethod(implObj, "get_EntryTypeUniversalGroup"), flags, 2)
        this.vtbl.get_EntryTypeUNCPath := CallbackCreate(GetMethod(implObj, "get_EntryTypeUNCPath"), flags, 2)
        this.vtbl.get_EntryTypeUnknown := CallbackCreate(GetMethod(implObj, "get_EntryTypeUnknown"), flags, 2)
        this.vtbl.get_DestinationOptionSameAsSource := CallbackCreate(GetMethod(implObj, "get_DestinationOptionSameAsSource"), flags, 2)
        this.vtbl.get_DestinationOptionNone := CallbackCreate(GetMethod(implObj, "get_DestinationOptionNone"), flags, 2)
        this.vtbl.get_DestinationOptionByRelativeName := CallbackCreate(GetMethod(implObj, "get_DestinationOptionByRelativeName"), flags, 2)
        this.vtbl.get_DestinationOptionSet := CallbackCreate(GetMethod(implObj, "get_DestinationOptionSet"), flags, 2)
        this.vtbl.get_MigrationTableOnly := CallbackCreate(GetMethod(implObj, "get_MigrationTableOnly"), flags, 2)
        this.vtbl.get_ProcessSecurity := CallbackCreate(GetMethod(implObj, "get_ProcessSecurity"), flags, 2)
        this.vtbl.get_RsopLoggingNoComputer := CallbackCreate(GetMethod(implObj, "get_RsopLoggingNoComputer"), flags, 2)
        this.vtbl.get_RsopLoggingNoUser := CallbackCreate(GetMethod(implObj, "get_RsopLoggingNoUser"), flags, 2)
        this.vtbl.get_RsopPlanningAssumeSlowLink := CallbackCreate(GetMethod(implObj, "get_RsopPlanningAssumeSlowLink"), flags, 2)
        this.vtbl.get_RsopPlanningLoopbackOption := CallbackCreate(GetMethod(implObj, "get_RsopPlanningLoopbackOption"), flags, 3)
        this.vtbl.get_RsopPlanningAssumeUserWQLFilterTrue := CallbackCreate(GetMethod(implObj, "get_RsopPlanningAssumeUserWQLFilterTrue"), flags, 2)
        this.vtbl.get_RsopPlanningAssumeCompWQLFilterTrue := CallbackCreate(GetMethod(implObj, "get_RsopPlanningAssumeCompWQLFilterTrue"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_PermGPOApply)
        CallbackFree(this.vtbl.get_PermGPORead)
        CallbackFree(this.vtbl.get_PermGPOEdit)
        CallbackFree(this.vtbl.get_PermGPOEditSecurityAndDelete)
        CallbackFree(this.vtbl.get_PermGPOCustom)
        CallbackFree(this.vtbl.get_PermWMIFilterEdit)
        CallbackFree(this.vtbl.get_PermWMIFilterFullControl)
        CallbackFree(this.vtbl.get_PermWMIFilterCustom)
        CallbackFree(this.vtbl.get_PermSOMLink)
        CallbackFree(this.vtbl.get_PermSOMLogging)
        CallbackFree(this.vtbl.get_PermSOMPlanning)
        CallbackFree(this.vtbl.get_PermSOMGPOCreate)
        CallbackFree(this.vtbl.get_PermSOMWMICreate)
        CallbackFree(this.vtbl.get_PermSOMWMIFullControl)
        CallbackFree(this.vtbl.get_SearchPropertyGPOPermissions)
        CallbackFree(this.vtbl.get_SearchPropertyGPOEffectivePermissions)
        CallbackFree(this.vtbl.get_SearchPropertyGPODisplayName)
        CallbackFree(this.vtbl.get_SearchPropertyGPOWMIFilter)
        CallbackFree(this.vtbl.get_SearchPropertyGPOID)
        CallbackFree(this.vtbl.get_SearchPropertyGPOComputerExtensions)
        CallbackFree(this.vtbl.get_SearchPropertyGPOUserExtensions)
        CallbackFree(this.vtbl.get_SearchPropertySOMLinks)
        CallbackFree(this.vtbl.get_SearchPropertyGPODomain)
        CallbackFree(this.vtbl.get_SearchPropertyBackupMostRecent)
        CallbackFree(this.vtbl.get_SearchOpEquals)
        CallbackFree(this.vtbl.get_SearchOpContains)
        CallbackFree(this.vtbl.get_SearchOpNotContains)
        CallbackFree(this.vtbl.get_SearchOpNotEquals)
        CallbackFree(this.vtbl.get_UsePDC)
        CallbackFree(this.vtbl.get_UseAnyDC)
        CallbackFree(this.vtbl.get_DoNotUseW2KDC)
        CallbackFree(this.vtbl.get_SOMSite)
        CallbackFree(this.vtbl.get_SOMDomain)
        CallbackFree(this.vtbl.get_SOMOU)
        CallbackFree(this.vtbl.get_SecurityFlags)
        CallbackFree(this.vtbl.get_DoNotValidateDC)
        CallbackFree(this.vtbl.get_ReportHTML)
        CallbackFree(this.vtbl.get_ReportXML)
        CallbackFree(this.vtbl.get_RSOPModeUnknown)
        CallbackFree(this.vtbl.get_RSOPModePlanning)
        CallbackFree(this.vtbl.get_RSOPModeLogging)
        CallbackFree(this.vtbl.get_EntryTypeUser)
        CallbackFree(this.vtbl.get_EntryTypeComputer)
        CallbackFree(this.vtbl.get_EntryTypeLocalGroup)
        CallbackFree(this.vtbl.get_EntryTypeGlobalGroup)
        CallbackFree(this.vtbl.get_EntryTypeUniversalGroup)
        CallbackFree(this.vtbl.get_EntryTypeUNCPath)
        CallbackFree(this.vtbl.get_EntryTypeUnknown)
        CallbackFree(this.vtbl.get_DestinationOptionSameAsSource)
        CallbackFree(this.vtbl.get_DestinationOptionNone)
        CallbackFree(this.vtbl.get_DestinationOptionByRelativeName)
        CallbackFree(this.vtbl.get_DestinationOptionSet)
        CallbackFree(this.vtbl.get_MigrationTableOnly)
        CallbackFree(this.vtbl.get_ProcessSecurity)
        CallbackFree(this.vtbl.get_RsopLoggingNoComputer)
        CallbackFree(this.vtbl.get_RsopLoggingNoUser)
        CallbackFree(this.vtbl.get_RsopPlanningAssumeSlowLink)
        CallbackFree(this.vtbl.get_RsopPlanningLoopbackOption)
        CallbackFree(this.vtbl.get_RsopPlanningAssumeUserWQLFilterTrue)
        CallbackFree(this.vtbl.get_RsopPlanningAssumeCompWQLFilterTrue)
    }
}
