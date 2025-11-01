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
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_PermGPORead(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_PermGPOEdit(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_PermGPOEditSecurityAndDelete(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_PermGPOCustom(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_PermWMIFilterEdit(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_PermWMIFilterFullControl(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(13, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_PermWMIFilterCustom(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(14, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_PermSOMLink(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(15, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_PermSOMLogging(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(16, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_PermSOMPlanning(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(17, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_PermSOMGPOCreate(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(18, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_PermSOMWMICreate(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(19, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_PermSOMWMIFullControl(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(20, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_SearchPropertyGPOPermissions(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(21, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_SearchPropertyGPOEffectivePermissions(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(22, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_SearchPropertyGPODisplayName(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(23, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_SearchPropertyGPOWMIFilter(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(24, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_SearchPropertyGPOID(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(25, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_SearchPropertyGPOComputerExtensions(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(26, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_SearchPropertyGPOUserExtensions(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(27, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_SearchPropertySOMLinks(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(28, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_SearchPropertyGPODomain(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(29, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_SearchPropertyBackupMostRecent(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(30, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_SearchOpEquals(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(31, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_SearchOpContains(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(32, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_SearchOpNotContains(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(33, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_SearchOpNotEquals(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(34, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_UsePDC(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(35, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_UseAnyDC(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(36, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_DoNotUseW2KDC(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(37, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_SOMSite(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(38, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_SOMDomain(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(39, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_SOMOU(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(40, this, pValMarshal, pVal, "HRESULT")
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
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(41, this, "short", vbOwner, "short", vbGroup, "short", vbDACL, "short", vbSACL, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_DoNotValidateDC(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(42, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_ReportHTML(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(43, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_ReportXML(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(44, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_RSOPModeUnknown(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(45, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_RSOPModePlanning(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(46, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_RSOPModeLogging(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(47, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_EntryTypeUser(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(48, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_EntryTypeComputer(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(49, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_EntryTypeLocalGroup(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(50, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_EntryTypeGlobalGroup(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(51, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_EntryTypeUniversalGroup(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(52, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_EntryTypeUNCPath(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(53, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_EntryTypeUnknown(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(54, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_DestinationOptionSameAsSource(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(55, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_DestinationOptionNone(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(56, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_DestinationOptionByRelativeName(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(57, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_DestinationOptionSet(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(58, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_MigrationTableOnly(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(59, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_ProcessSecurity(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(60, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_RsopLoggingNoComputer(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(61, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_RsopLoggingNoUser(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(62, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_RsopPlanningAssumeSlowLink(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(63, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} vbMerge 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_RsopPlanningLoopbackOption(vbMerge, pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(64, this, "short", vbMerge, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_RsopPlanningAssumeUserWQLFilterTrue(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(65, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_RsopPlanningAssumeCompWQLFilterTrue(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(66, this, pValMarshal, pVal, "HRESULT")
        return result
    }
}
