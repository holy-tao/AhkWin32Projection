#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IGPMConstants.ahk

/**
 * The IGPMConstants2 interface supports methods that retrieve the value of multiple Group Policy Management Console (GPMC) constants.
 * @remarks
 * 
  * For more information about policy-related permissions, see 
  * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nf-gpmgmt-igpm-createpermission">IGPM::CreatePermission</a> (<b>GPM.CreatePermission</b>).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nn-gpmgmt-igpmconstants2
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class IGPMConstants2 extends IGPMConstants{

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
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_BackupTypeGPO(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(67, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_BackupTypeStarterGPO(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(68, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_StarterGPOTypeSystem(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(69, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_StarterGPOTypeCustom(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(70, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_SearchPropertyStarterGPOPermissions(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(71, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_SearchPropertyStarterGPOEffectivePermissions(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(72, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_SearchPropertyStarterGPODisplayName(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(73, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_SearchPropertyStarterGPOID(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(74, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_SearchPropertyStarterGPODomain(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(75, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_PermStarterGPORead(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(76, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_PermStarterGPOEdit(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(77, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_PermStarterGPOFullControl(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(78, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_PermStarterGPOCustom(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(79, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_ReportLegacy(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(80, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_ReportComments(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(81, this, pValMarshal, pVal, "HRESULT")
        return result
    }
}
