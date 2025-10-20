#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Notifies the subscriber about activities of the Compensating Resource Manager (CRM) feature of Component Services.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-icomcrmevents
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IComCRMEvents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IComCRMEvents
     * @type {Guid}
     */
    static IID => Guid("{683130b5-2e50-11d2-98a5-00c04f8ee1c4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnCRMRecoveryStart", "OnCRMRecoveryDone", "OnCRMCheckpoint", "OnCRMBegin", "OnCRMPrepare", "OnCRMCommit", "OnCRMAbort", "OnCRMIndoubt", "OnCRMDone", "OnCRMRelease", "OnCRMAnalyze", "OnCRMWrite", "OnCRMForget", "OnCRMForce", "OnCRMDeliver"]

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Guid} guidApp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomcrmevents-oncrmrecoverystart
     */
    OnCRMRecoveryStart(pInfo, guidApp) {
        result := ComCall(3, this, "ptr", pInfo, "ptr", guidApp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Guid} guidApp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomcrmevents-oncrmrecoverydone
     */
    OnCRMRecoveryDone(pInfo, guidApp) {
        result := ComCall(4, this, "ptr", pInfo, "ptr", guidApp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Guid} guidApp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomcrmevents-oncrmcheckpoint
     */
    OnCRMCheckpoint(pInfo, guidApp) {
        result := ComCall(5, this, "ptr", pInfo, "ptr", guidApp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Guid} guidClerkCLSID 
     * @param {Guid} guidActivity 
     * @param {Guid} guidTx 
     * @param {PWSTR} szProgIdCompensator 
     * @param {PWSTR} szDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomcrmevents-oncrmbegin
     */
    OnCRMBegin(pInfo, guidClerkCLSID, guidActivity, guidTx, szProgIdCompensator, szDescription) {
        szProgIdCompensator := szProgIdCompensator is String ? StrPtr(szProgIdCompensator) : szProgIdCompensator
        szDescription := szDescription is String ? StrPtr(szDescription) : szDescription

        result := ComCall(6, this, "ptr", pInfo, "ptr", guidClerkCLSID, "ptr", guidActivity, "ptr", guidTx, "ptr", szProgIdCompensator, "ptr", szDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Guid} guidClerkCLSID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomcrmevents-oncrmprepare
     */
    OnCRMPrepare(pInfo, guidClerkCLSID) {
        result := ComCall(7, this, "ptr", pInfo, "ptr", guidClerkCLSID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Guid} guidClerkCLSID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomcrmevents-oncrmcommit
     */
    OnCRMCommit(pInfo, guidClerkCLSID) {
        result := ComCall(8, this, "ptr", pInfo, "ptr", guidClerkCLSID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Guid} guidClerkCLSID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomcrmevents-oncrmabort
     */
    OnCRMAbort(pInfo, guidClerkCLSID) {
        result := ComCall(9, this, "ptr", pInfo, "ptr", guidClerkCLSID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Guid} guidClerkCLSID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomcrmevents-oncrmindoubt
     */
    OnCRMIndoubt(pInfo, guidClerkCLSID) {
        result := ComCall(10, this, "ptr", pInfo, "ptr", guidClerkCLSID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Guid} guidClerkCLSID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomcrmevents-oncrmdone
     */
    OnCRMDone(pInfo, guidClerkCLSID) {
        result := ComCall(11, this, "ptr", pInfo, "ptr", guidClerkCLSID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Guid} guidClerkCLSID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomcrmevents-oncrmrelease
     */
    OnCRMRelease(pInfo, guidClerkCLSID) {
        result := ComCall(12, this, "ptr", pInfo, "ptr", guidClerkCLSID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Guid} guidClerkCLSID 
     * @param {Integer} dwCrmRecordType 
     * @param {Integer} dwRecordSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomcrmevents-oncrmanalyze
     */
    OnCRMAnalyze(pInfo, guidClerkCLSID, dwCrmRecordType, dwRecordSize) {
        result := ComCall(13, this, "ptr", pInfo, "ptr", guidClerkCLSID, "uint", dwCrmRecordType, "uint", dwRecordSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Guid} guidClerkCLSID 
     * @param {BOOL} fVariants 
     * @param {Integer} dwRecordSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomcrmevents-oncrmwrite
     */
    OnCRMWrite(pInfo, guidClerkCLSID, fVariants, dwRecordSize) {
        result := ComCall(14, this, "ptr", pInfo, "ptr", guidClerkCLSID, "int", fVariants, "uint", dwRecordSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Guid} guidClerkCLSID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomcrmevents-oncrmforget
     */
    OnCRMForget(pInfo, guidClerkCLSID) {
        result := ComCall(15, this, "ptr", pInfo, "ptr", guidClerkCLSID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Guid} guidClerkCLSID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomcrmevents-oncrmforce
     */
    OnCRMForce(pInfo, guidClerkCLSID) {
        result := ComCall(16, this, "ptr", pInfo, "ptr", guidClerkCLSID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Guid} guidClerkCLSID 
     * @param {BOOL} fVariants 
     * @param {Integer} dwRecordSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomcrmevents-oncrmdeliver
     */
    OnCRMDeliver(pInfo, guidClerkCLSID, fVariants, dwRecordSize) {
        result := ComCall(17, this, "ptr", pInfo, "ptr", guidClerkCLSID, "int", fVariants, "uint", dwRecordSize, "HRESULT")
        return result
    }
}
