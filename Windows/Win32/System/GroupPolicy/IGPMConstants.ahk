#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * The IGPMConstants interface supports methods that retrieve the value of multiple Group Policy Management Console (GPMC) constants. To create a GPMConstants object, call the IGPM::GetConstants method.
 * @remarks
 * 
 * Properties that begin with <b>PermGPO</b> apply only to GPOs. Properties that begin with <b>PermWMIFilter</b> apply only to Windows Management Instrumentation (WMI) filters.
 * 
 * For more information about policy-related permissions, see 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nf-gpmgmt-igpm-createpermission">IGPM::CreatePermission</a> (<b>GPM.CreatePermission</b>).
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nn-gpmgmt-igpmconstants
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class IGPMConstants extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGPMConstants
     * @type {Guid}
     */
    static IID => Guid("{50ef73e6-d35c-4c8d-be63-7ea5d2aac5c4}")

    /**
     * The class identifier for GPMConstants
     * @type {Guid}
     */
    static CLSID => Guid("{3855e880-cd9e-4d0c-9eaf-1579283a1888}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PermGPOApply", "get_PermGPORead", "get_PermGPOEdit", "get_PermGPOEditSecurityAndDelete", "get_PermGPOCustom", "get_PermWMIFilterEdit", "get_PermWMIFilterFullControl", "get_PermWMIFilterCustom", "get_PermSOMLink", "get_PermSOMLogging", "get_PermSOMPlanning", "get_PermSOMGPOCreate", "get_PermSOMWMICreate", "get_PermSOMWMIFullControl", "get_SearchPropertyGPOPermissions", "get_SearchPropertyGPOEffectivePermissions", "get_SearchPropertyGPODisplayName", "get_SearchPropertyGPOWMIFilter", "get_SearchPropertyGPOID", "get_SearchPropertyGPOComputerExtensions", "get_SearchPropertyGPOUserExtensions", "get_SearchPropertySOMLinks", "get_SearchPropertyGPODomain", "get_SearchPropertyBackupMostRecent", "get_SearchOpEquals", "get_SearchOpContains", "get_SearchOpNotContains", "get_SearchOpNotEquals", "get_UsePDC", "get_UseAnyDC", "get_DoNotUseW2KDC", "get_SOMSite", "get_SOMDomain", "get_SOMOU", "get_SecurityFlags", "get_DoNotValidateDC", "get_ReportHTML", "get_ReportXML", "get_RSOPModeUnknown", "get_RSOPModePlanning", "get_RSOPModeLogging", "get_EntryTypeUser", "get_EntryTypeComputer", "get_EntryTypeLocalGroup", "get_EntryTypeGlobalGroup", "get_EntryTypeUniversalGroup", "get_EntryTypeUNCPath", "get_EntryTypeUnknown", "get_DestinationOptionSameAsSource", "get_DestinationOptionNone", "get_DestinationOptionByRelativeName", "get_DestinationOptionSet", "get_MigrationTableOnly", "get_ProcessSecurity", "get_RsopLoggingNoComputer", "get_RsopLoggingNoUser", "get_RsopPlanningAssumeSlowLink", "get_RsopPlanningLoopbackOption", "get_RsopPlanningAssumeUserWQLFilterTrue", "get_RsopPlanningAssumeCompWQLFilterTrue"]

    /**
     * @type {Integer} 
     */
    PermGPOApply {
        get => this.get_PermGPOApply()
    }

    /**
     * @type {Integer} 
     */
    PermGPORead {
        get => this.get_PermGPORead()
    }

    /**
     * @type {Integer} 
     */
    PermGPOEdit {
        get => this.get_PermGPOEdit()
    }

    /**
     * @type {Integer} 
     */
    PermGPOEditSecurityAndDelete {
        get => this.get_PermGPOEditSecurityAndDelete()
    }

    /**
     * @type {Integer} 
     */
    PermGPOCustom {
        get => this.get_PermGPOCustom()
    }

    /**
     * @type {Integer} 
     */
    PermWMIFilterEdit {
        get => this.get_PermWMIFilterEdit()
    }

    /**
     * @type {Integer} 
     */
    PermWMIFilterFullControl {
        get => this.get_PermWMIFilterFullControl()
    }

    /**
     * @type {Integer} 
     */
    PermWMIFilterCustom {
        get => this.get_PermWMIFilterCustom()
    }

    /**
     * @type {Integer} 
     */
    PermSOMLink {
        get => this.get_PermSOMLink()
    }

    /**
     * @type {Integer} 
     */
    PermSOMLogging {
        get => this.get_PermSOMLogging()
    }

    /**
     * @type {Integer} 
     */
    PermSOMPlanning {
        get => this.get_PermSOMPlanning()
    }

    /**
     * @type {Integer} 
     */
    PermSOMGPOCreate {
        get => this.get_PermSOMGPOCreate()
    }

    /**
     * @type {Integer} 
     */
    PermSOMWMICreate {
        get => this.get_PermSOMWMICreate()
    }

    /**
     * @type {Integer} 
     */
    PermSOMWMIFullControl {
        get => this.get_PermSOMWMIFullControl()
    }

    /**
     * @type {Integer} 
     */
    SearchPropertyGPOPermissions {
        get => this.get_SearchPropertyGPOPermissions()
    }

    /**
     * @type {Integer} 
     */
    SearchPropertyGPOEffectivePermissions {
        get => this.get_SearchPropertyGPOEffectivePermissions()
    }

    /**
     * @type {Integer} 
     */
    SearchPropertyGPODisplayName {
        get => this.get_SearchPropertyGPODisplayName()
    }

    /**
     * @type {Integer} 
     */
    SearchPropertyGPOWMIFilter {
        get => this.get_SearchPropertyGPOWMIFilter()
    }

    /**
     * @type {Integer} 
     */
    SearchPropertyGPOID {
        get => this.get_SearchPropertyGPOID()
    }

    /**
     * @type {Integer} 
     */
    SearchPropertyGPOComputerExtensions {
        get => this.get_SearchPropertyGPOComputerExtensions()
    }

    /**
     * @type {Integer} 
     */
    SearchPropertyGPOUserExtensions {
        get => this.get_SearchPropertyGPOUserExtensions()
    }

    /**
     * @type {Integer} 
     */
    SearchPropertySOMLinks {
        get => this.get_SearchPropertySOMLinks()
    }

    /**
     * @type {Integer} 
     */
    SearchPropertyGPODomain {
        get => this.get_SearchPropertyGPODomain()
    }

    /**
     * @type {Integer} 
     */
    SearchPropertyBackupMostRecent {
        get => this.get_SearchPropertyBackupMostRecent()
    }

    /**
     * @type {Integer} 
     */
    SearchOpEquals {
        get => this.get_SearchOpEquals()
    }

    /**
     * @type {Integer} 
     */
    SearchOpContains {
        get => this.get_SearchOpContains()
    }

    /**
     * @type {Integer} 
     */
    SearchOpNotContains {
        get => this.get_SearchOpNotContains()
    }

    /**
     * @type {Integer} 
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
     * @type {Integer} 
     */
    SOMSite {
        get => this.get_SOMSite()
    }

    /**
     * @type {Integer} 
     */
    SOMDomain {
        get => this.get_SOMDomain()
    }

    /**
     * @type {Integer} 
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
     * @type {Integer} 
     */
    ReportHTML {
        get => this.get_ReportHTML()
    }

    /**
     * @type {Integer} 
     */
    ReportXML {
        get => this.get_ReportXML()
    }

    /**
     * @type {Integer} 
     */
    RSOPModeUnknown {
        get => this.get_RSOPModeUnknown()
    }

    /**
     * @type {Integer} 
     */
    RSOPModePlanning {
        get => this.get_RSOPModePlanning()
    }

    /**
     * @type {Integer} 
     */
    RSOPModeLogging {
        get => this.get_RSOPModeLogging()
    }

    /**
     * @type {Integer} 
     */
    EntryTypeUser {
        get => this.get_EntryTypeUser()
    }

    /**
     * @type {Integer} 
     */
    EntryTypeComputer {
        get => this.get_EntryTypeComputer()
    }

    /**
     * @type {Integer} 
     */
    EntryTypeLocalGroup {
        get => this.get_EntryTypeLocalGroup()
    }

    /**
     * @type {Integer} 
     */
    EntryTypeGlobalGroup {
        get => this.get_EntryTypeGlobalGroup()
    }

    /**
     * @type {Integer} 
     */
    EntryTypeUniversalGroup {
        get => this.get_EntryTypeUniversalGroup()
    }

    /**
     * @type {Integer} 
     */
    EntryTypeUNCPath {
        get => this.get_EntryTypeUNCPath()
    }

    /**
     * @type {Integer} 
     */
    EntryTypeUnknown {
        get => this.get_EntryTypeUnknown()
    }

    /**
     * @type {Integer} 
     */
    DestinationOptionSameAsSource {
        get => this.get_DestinationOptionSameAsSource()
    }

    /**
     * @type {Integer} 
     */
    DestinationOptionNone {
        get => this.get_DestinationOptionNone()
    }

    /**
     * @type {Integer} 
     */
    DestinationOptionByRelativeName {
        get => this.get_DestinationOptionByRelativeName()
    }

    /**
     * @type {Integer} 
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
     * @returns {Integer} 
     */
    get_PermGPOApply() {
        result := ComCall(7, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PermGPORead() {
        result := ComCall(8, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PermGPOEdit() {
        result := ComCall(9, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PermGPOEditSecurityAndDelete() {
        result := ComCall(10, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PermGPOCustom() {
        result := ComCall(11, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PermWMIFilterEdit() {
        result := ComCall(12, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PermWMIFilterFullControl() {
        result := ComCall(13, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PermWMIFilterCustom() {
        result := ComCall(14, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PermSOMLink() {
        result := ComCall(15, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PermSOMLogging() {
        result := ComCall(16, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PermSOMPlanning() {
        result := ComCall(17, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PermSOMGPOCreate() {
        result := ComCall(18, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PermSOMWMICreate() {
        result := ComCall(19, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PermSOMWMIFullControl() {
        result := ComCall(20, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SearchPropertyGPOPermissions() {
        result := ComCall(21, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SearchPropertyGPOEffectivePermissions() {
        result := ComCall(22, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SearchPropertyGPODisplayName() {
        result := ComCall(23, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SearchPropertyGPOWMIFilter() {
        result := ComCall(24, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SearchPropertyGPOID() {
        result := ComCall(25, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SearchPropertyGPOComputerExtensions() {
        result := ComCall(26, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SearchPropertyGPOUserExtensions() {
        result := ComCall(27, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SearchPropertySOMLinks() {
        result := ComCall(28, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SearchPropertyGPODomain() {
        result := ComCall(29, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SearchPropertyBackupMostRecent() {
        result := ComCall(30, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SearchOpEquals() {
        result := ComCall(31, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SearchOpContains() {
        result := ComCall(32, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SearchOpNotContains() {
        result := ComCall(33, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
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
     * @returns {Integer} 
     */
    get_SOMSite() {
        result := ComCall(38, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SOMDomain() {
        result := ComCall(39, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SOMOU() {
        result := ComCall(40, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {VARIANT_BOOL} vbOwner 
     * @param {VARIANT_BOOL} vbGroup 
     * @param {VARIANT_BOOL} vbDACL 
     * @param {VARIANT_BOOL} vbSACL 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmconstants-get_securityflags
     */
    get_SecurityFlags(vbOwner, vbGroup, vbDACL, vbSACL) {
        result := ComCall(41, this, "short", vbOwner, "short", vbGroup, "short", vbDACL, "short", vbSACL, "int*", &pVal := 0, "HRESULT")
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
     * @returns {Integer} 
     */
    get_ReportHTML() {
        result := ComCall(43, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReportXML() {
        result := ComCall(44, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RSOPModeUnknown() {
        result := ComCall(45, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RSOPModePlanning() {
        result := ComCall(46, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RSOPModeLogging() {
        result := ComCall(47, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EntryTypeUser() {
        result := ComCall(48, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EntryTypeComputer() {
        result := ComCall(49, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EntryTypeLocalGroup() {
        result := ComCall(50, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EntryTypeGlobalGroup() {
        result := ComCall(51, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EntryTypeUniversalGroup() {
        result := ComCall(52, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EntryTypeUNCPath() {
        result := ComCall(53, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EntryTypeUnknown() {
        result := ComCall(54, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DestinationOptionSameAsSource() {
        result := ComCall(55, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DestinationOptionNone() {
        result := ComCall(56, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DestinationOptionByRelativeName() {
        result := ComCall(57, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
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
        result := ComCall(64, this, "short", vbMerge, "int*", &pVal := 0, "HRESULT")
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
}
