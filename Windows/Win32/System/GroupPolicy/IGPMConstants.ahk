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
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_PermGPOApply(pVal) {
        result := ComCall(7, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_PermGPORead(pVal) {
        result := ComCall(8, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_PermGPOEdit(pVal) {
        result := ComCall(9, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_PermGPOEditSecurityAndDelete(pVal) {
        result := ComCall(10, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_PermGPOCustom(pVal) {
        result := ComCall(11, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_PermWMIFilterEdit(pVal) {
        result := ComCall(12, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_PermWMIFilterFullControl(pVal) {
        result := ComCall(13, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_PermWMIFilterCustom(pVal) {
        result := ComCall(14, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_PermSOMLink(pVal) {
        result := ComCall(15, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_PermSOMLogging(pVal) {
        result := ComCall(16, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_PermSOMPlanning(pVal) {
        result := ComCall(17, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_PermSOMGPOCreate(pVal) {
        result := ComCall(18, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_PermSOMWMICreate(pVal) {
        result := ComCall(19, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_PermSOMWMIFullControl(pVal) {
        result := ComCall(20, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_SearchPropertyGPOPermissions(pVal) {
        result := ComCall(21, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_SearchPropertyGPOEffectivePermissions(pVal) {
        result := ComCall(22, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_SearchPropertyGPODisplayName(pVal) {
        result := ComCall(23, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_SearchPropertyGPOWMIFilter(pVal) {
        result := ComCall(24, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_SearchPropertyGPOID(pVal) {
        result := ComCall(25, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_SearchPropertyGPOComputerExtensions(pVal) {
        result := ComCall(26, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_SearchPropertyGPOUserExtensions(pVal) {
        result := ComCall(27, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_SearchPropertySOMLinks(pVal) {
        result := ComCall(28, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_SearchPropertyGPODomain(pVal) {
        result := ComCall(29, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_SearchPropertyBackupMostRecent(pVal) {
        result := ComCall(30, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_SearchOpEquals(pVal) {
        result := ComCall(31, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_SearchOpContains(pVal) {
        result := ComCall(32, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_SearchOpNotContains(pVal) {
        result := ComCall(33, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_SearchOpNotEquals(pVal) {
        result := ComCall(34, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_UsePDC(pVal) {
        result := ComCall(35, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_UseAnyDC(pVal) {
        result := ComCall(36, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_DoNotUseW2KDC(pVal) {
        result := ComCall(37, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_SOMSite(pVal) {
        result := ComCall(38, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_SOMDomain(pVal) {
        result := ComCall(39, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_SOMOU(pVal) {
        result := ComCall(40, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} vbOwner 
     * @param {VARIANT_BOOL} vbGroup 
     * @param {VARIANT_BOOL} vbDACL 
     * @param {VARIANT_BOOL} vbSACL 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmconstants-get_securityflags
     */
    get_SecurityFlags(vbOwner, vbGroup, vbDACL, vbSACL, pVal) {
        result := ComCall(41, this, "short", vbOwner, "short", vbGroup, "short", vbDACL, "short", vbSACL, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_DoNotValidateDC(pVal) {
        result := ComCall(42, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_ReportHTML(pVal) {
        result := ComCall(43, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_ReportXML(pVal) {
        result := ComCall(44, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_RSOPModeUnknown(pVal) {
        result := ComCall(45, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_RSOPModePlanning(pVal) {
        result := ComCall(46, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_RSOPModeLogging(pVal) {
        result := ComCall(47, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_EntryTypeUser(pVal) {
        result := ComCall(48, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_EntryTypeComputer(pVal) {
        result := ComCall(49, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_EntryTypeLocalGroup(pVal) {
        result := ComCall(50, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_EntryTypeGlobalGroup(pVal) {
        result := ComCall(51, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_EntryTypeUniversalGroup(pVal) {
        result := ComCall(52, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_EntryTypeUNCPath(pVal) {
        result := ComCall(53, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_EntryTypeUnknown(pVal) {
        result := ComCall(54, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_DestinationOptionSameAsSource(pVal) {
        result := ComCall(55, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_DestinationOptionNone(pVal) {
        result := ComCall(56, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_DestinationOptionByRelativeName(pVal) {
        result := ComCall(57, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_DestinationOptionSet(pVal) {
        result := ComCall(58, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_MigrationTableOnly(pVal) {
        result := ComCall(59, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_ProcessSecurity(pVal) {
        result := ComCall(60, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_RsopLoggingNoComputer(pVal) {
        result := ComCall(61, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_RsopLoggingNoUser(pVal) {
        result := ComCall(62, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_RsopPlanningAssumeSlowLink(pVal) {
        result := ComCall(63, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} vbMerge 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_RsopPlanningLoopbackOption(vbMerge, pVal) {
        result := ComCall(64, this, "short", vbMerge, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_RsopPlanningAssumeUserWQLFilterTrue(pVal) {
        result := ComCall(65, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_RsopPlanningAssumeCompWQLFilterTrue(pVal) {
        result := ComCall(66, this, "int*", pVal, "HRESULT")
        return result
    }
}
