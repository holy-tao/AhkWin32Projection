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
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Pointer<Guid>} guidApp 
     * @returns {HRESULT} 
     */
    OnCRMRecoveryStart(pInfo, guidApp) {
        result := ComCall(3, this, "ptr", pInfo, "ptr", guidApp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Pointer<Guid>} guidApp 
     * @returns {HRESULT} 
     */
    OnCRMRecoveryDone(pInfo, guidApp) {
        result := ComCall(4, this, "ptr", pInfo, "ptr", guidApp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Pointer<Guid>} guidApp 
     * @returns {HRESULT} 
     */
    OnCRMCheckpoint(pInfo, guidApp) {
        result := ComCall(5, this, "ptr", pInfo, "ptr", guidApp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Pointer<Guid>} guidClerkCLSID 
     * @param {Pointer<Guid>} guidActivity 
     * @param {Pointer<Guid>} guidTx 
     * @param {PWSTR} szProgIdCompensator 
     * @param {PWSTR} szDescription 
     * @returns {HRESULT} 
     */
    OnCRMBegin(pInfo, guidClerkCLSID, guidActivity, guidTx, szProgIdCompensator, szDescription) {
        szProgIdCompensator := szProgIdCompensator is String ? StrPtr(szProgIdCompensator) : szProgIdCompensator
        szDescription := szDescription is String ? StrPtr(szDescription) : szDescription

        result := ComCall(6, this, "ptr", pInfo, "ptr", guidClerkCLSID, "ptr", guidActivity, "ptr", guidTx, "ptr", szProgIdCompensator, "ptr", szDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Pointer<Guid>} guidClerkCLSID 
     * @returns {HRESULT} 
     */
    OnCRMPrepare(pInfo, guidClerkCLSID) {
        result := ComCall(7, this, "ptr", pInfo, "ptr", guidClerkCLSID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Pointer<Guid>} guidClerkCLSID 
     * @returns {HRESULT} 
     */
    OnCRMCommit(pInfo, guidClerkCLSID) {
        result := ComCall(8, this, "ptr", pInfo, "ptr", guidClerkCLSID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Pointer<Guid>} guidClerkCLSID 
     * @returns {HRESULT} 
     */
    OnCRMAbort(pInfo, guidClerkCLSID) {
        result := ComCall(9, this, "ptr", pInfo, "ptr", guidClerkCLSID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Pointer<Guid>} guidClerkCLSID 
     * @returns {HRESULT} 
     */
    OnCRMIndoubt(pInfo, guidClerkCLSID) {
        result := ComCall(10, this, "ptr", pInfo, "ptr", guidClerkCLSID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Pointer<Guid>} guidClerkCLSID 
     * @returns {HRESULT} 
     */
    OnCRMDone(pInfo, guidClerkCLSID) {
        result := ComCall(11, this, "ptr", pInfo, "ptr", guidClerkCLSID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Pointer<Guid>} guidClerkCLSID 
     * @returns {HRESULT} 
     */
    OnCRMRelease(pInfo, guidClerkCLSID) {
        result := ComCall(12, this, "ptr", pInfo, "ptr", guidClerkCLSID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Pointer<Guid>} guidClerkCLSID 
     * @param {Integer} dwCrmRecordType 
     * @param {Integer} dwRecordSize 
     * @returns {HRESULT} 
     */
    OnCRMAnalyze(pInfo, guidClerkCLSID, dwCrmRecordType, dwRecordSize) {
        result := ComCall(13, this, "ptr", pInfo, "ptr", guidClerkCLSID, "uint", dwCrmRecordType, "uint", dwRecordSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Pointer<Guid>} guidClerkCLSID 
     * @param {BOOL} fVariants 
     * @param {Integer} dwRecordSize 
     * @returns {HRESULT} 
     */
    OnCRMWrite(pInfo, guidClerkCLSID, fVariants, dwRecordSize) {
        result := ComCall(14, this, "ptr", pInfo, "ptr", guidClerkCLSID, "int", fVariants, "uint", dwRecordSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Pointer<Guid>} guidClerkCLSID 
     * @returns {HRESULT} 
     */
    OnCRMForget(pInfo, guidClerkCLSID) {
        result := ComCall(15, this, "ptr", pInfo, "ptr", guidClerkCLSID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Pointer<Guid>} guidClerkCLSID 
     * @returns {HRESULT} 
     */
    OnCRMForce(pInfo, guidClerkCLSID) {
        result := ComCall(16, this, "ptr", pInfo, "ptr", guidClerkCLSID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Pointer<Guid>} guidClerkCLSID 
     * @param {BOOL} fVariants 
     * @param {Integer} dwRecordSize 
     * @returns {HRESULT} 
     */
    OnCRMDeliver(pInfo, guidClerkCLSID, fVariants, dwRecordSize) {
        result := ComCall(17, this, "ptr", pInfo, "ptr", guidClerkCLSID, "int", fVariants, "uint", dwRecordSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
