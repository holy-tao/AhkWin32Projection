#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_TransactionUOW(pVal) {
        result := ComCall(3, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} lpcwstrProgIdCompensator 
     * @param {PWSTR} lpcwstrDescription 
     * @param {Integer} lCrmRegFlags 
     * @returns {HRESULT} 
     */
    RegisterCompensator(lpcwstrProgIdCompensator, lpcwstrDescription, lCrmRegFlags) {
        lpcwstrProgIdCompensator := lpcwstrProgIdCompensator is String ? StrPtr(lpcwstrProgIdCompensator) : lpcwstrProgIdCompensator
        lpcwstrDescription := lpcwstrDescription is String ? StrPtr(lpcwstrDescription) : lpcwstrDescription

        result := ComCall(4, this, "ptr", lpcwstrProgIdCompensator, "ptr", lpcwstrDescription, "int", lCrmRegFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pLogRecord 
     * @returns {HRESULT} 
     */
    WriteLogRecordVariants(pLogRecord) {
        result := ComCall(5, this, "ptr", pLogRecord, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ForceLog() {
        result := ComCall(6, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ForgetLogRecord() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ForceTransactionToAbort() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BLOB>} rgBlob 
     * @param {Integer} cBlob 
     * @returns {HRESULT} 
     */
    WriteLogRecord(rgBlob, cBlob) {
        result := ComCall(9, this, "ptr", rgBlob, "uint", cBlob, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
