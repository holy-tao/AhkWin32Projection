#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IX509SCEPEnrollment.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509SCEPEnrollment2 extends IX509SCEPEnrollment{
    /**
     * The interface identifier for IX509SCEPEnrollment2
     * @type {Guid}
     */
    static IID => Guid("{728ab364-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 29

    /**
     * 
     * @param {Integer} Encoding 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     */
    CreateChallengeAnswerMessage(Encoding, pValue) {
        result := ComCall(29, this, "int", Encoding, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {BSTR} strResponse 
     * @param {Integer} Encoding 
     * @param {Pointer<Int32>} pDisposition 
     * @returns {HRESULT} 
     */
    ProcessResponseMessage2(Flags, strResponse, Encoding, pDisposition) {
        strResponse := strResponse is String ? BSTR.Alloc(strResponse).Value : strResponse

        result := ComCall(30, this, "int", Flags, "ptr", strResponse, "int", Encoding, "int*", pDisposition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     */
    get_ResultMessageText(pValue) {
        result := ComCall(31, this, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pValue 
     * @returns {HRESULT} 
     */
    get_DelayRetry(pValue) {
        result := ComCall(32, this, "int*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     */
    get_ActivityId(pValue) {
        result := ComCall(33, this, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     */
    put_ActivityId(Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(34, this, "ptr", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
