#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Is the means by which the CRM Worker and CRM Compensator write records to the log and make them durable.
 * @remarks
 * 
 * The CRM Compensator receives this interface after its instantiation using the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-icrmcompensator-setlogcontrol">ICrmCompensator::SetLogControl</a> or the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-icrmcompensatorvariants-setlogcontrolvariants">ICrmCompensatorVariants::SetLogControlVariants</a> method.
 * 
 * In addition to the return values listed for each method, the methods can also return error codes from the Distributed Transaction Coordinator (DTC) or other standard COM error codes.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-icrmlogcontrol
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class ICrmLogControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICrmLogControl
     * @type {Guid}
     */
    static IID => Guid("{a0e174b3-d26e-11d2-8f84-00805fc7bcd9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TransactionUOW", "RegisterCompensator", "WriteLogRecordVariants", "ForceLog", "ForgetLogRecord", "ForceTransactionToAbort", "WriteLogRecord"]

    /**
     * @type {BSTR} 
     */
    TransactionUOW {
        get => this.get_TransactionUOW()
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icrmlogcontrol-get_transactionuow
     */
    get_TransactionUOW() {
        pVal := BSTR()
        result := ComCall(3, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {PWSTR} lpcwstrProgIdCompensator 
     * @param {PWSTR} lpcwstrDescription 
     * @param {Integer} lCrmRegFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icrmlogcontrol-registercompensator
     */
    RegisterCompensator(lpcwstrProgIdCompensator, lpcwstrDescription, lCrmRegFlags) {
        lpcwstrProgIdCompensator := lpcwstrProgIdCompensator is String ? StrPtr(lpcwstrProgIdCompensator) : lpcwstrProgIdCompensator
        lpcwstrDescription := lpcwstrDescription is String ? StrPtr(lpcwstrDescription) : lpcwstrDescription

        result := ComCall(4, this, "ptr", lpcwstrProgIdCompensator, "ptr", lpcwstrDescription, "int", lCrmRegFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pLogRecord 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icrmlogcontrol-writelogrecordvariants
     */
    WriteLogRecordVariants(pLogRecord) {
        result := ComCall(5, this, "ptr", pLogRecord, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icrmlogcontrol-forcelog
     */
    ForceLog() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icrmlogcontrol-forgetlogrecord
     */
    ForgetLogRecord() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icrmlogcontrol-forcetransactiontoabort
     */
    ForceTransactionToAbort() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BLOB>} rgBlob 
     * @param {Integer} cBlob 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icrmlogcontrol-writelogrecord
     */
    WriteLogRecord(rgBlob, cBlob) {
        result := ComCall(9, this, "ptr", rgBlob, "uint", cBlob, "HRESULT")
        return result
    }
}
