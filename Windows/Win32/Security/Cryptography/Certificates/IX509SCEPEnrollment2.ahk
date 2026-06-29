#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\X509SCEPDisposition.ahk" { X509SCEPDisposition }
#Import ".\EncodingType.ahk" { EncodingType }
#Import ".\DelayRetryAction.ahk" { DelayRetryAction }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\X509SCEPProcessMessageFlags.ahk" { X509SCEPProcessMessageFlags }
#Import ".\IX509SCEPEnrollment.ahk" { IX509SCEPEnrollment }

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct IX509SCEPEnrollment2 extends IX509SCEPEnrollment {
    /**
     * The interface identifier for IX509SCEPEnrollment2
     * @type {Guid}
     */
    static IID := Guid("{728ab364-217d-11da-b2a4-000e7bbb2b09}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IX509SCEPEnrollment2 interfaces
    */
    struct Vtbl extends IX509SCEPEnrollment.Vtbl {
        CreateChallengeAnswerMessage : IntPtr
        ProcessResponseMessage2      : IntPtr
        get_ResultMessageText        : IntPtr
        get_DelayRetry               : IntPtr
        get_ActivityId               : IntPtr
        put_ActivityId               : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IX509SCEPEnrollment2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    ResultMessageText {
        get => this.get_ResultMessageText()
    }

    /**
     * @type {DelayRetryAction} 
     */
    DelayRetry {
        get => this.get_DelayRetry()
    }

    /**
     * @type {BSTR} 
     */
    ActivityId {
        get => this.get_ActivityId()
        set => this.put_ActivityId(value)
    }

    /**
     * 
     * @param {EncodingType} Encoding 
     * @returns {BSTR} 
     */
    CreateChallengeAnswerMessage(Encoding) {
        pValue := BSTR.Owned()
        result := ComCall(29, this, EncodingType, Encoding, BSTR.Ptr, pValue, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {X509SCEPProcessMessageFlags} Flags 
     * @param {BSTR} strResponse 
     * @param {EncodingType} Encoding 
     * @returns {X509SCEPDisposition} 
     */
    ProcessResponseMessage2(Flags, strResponse, Encoding) {
        strResponse := strResponse is String ? BSTR.Alloc(strResponse).Value : strResponse

        result := ComCall(30, this, X509SCEPProcessMessageFlags, Flags, BSTR, strResponse, EncodingType, Encoding, "int*", &pDisposition := 0, "HRESULT")
        return pDisposition
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ResultMessageText() {
        pValue := BSTR.Owned()
        result := ComCall(31, this, BSTR.Ptr, pValue, "HRESULT")
        return pValue
    }

    /**
     * 
     * @returns {DelayRetryAction} 
     */
    get_DelayRetry() {
        result := ComCall(32, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ActivityId() {
        pValue := BSTR.Owned()
        result := ComCall(33, this, BSTR.Ptr, pValue, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     */
    put_ActivityId(Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(34, this, BSTR, Value, "HRESULT")
        return result
    }

    Query(iid) {
        if (IX509SCEPEnrollment2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateChallengeAnswerMessage := CallbackCreate(GetMethod(implObj, "CreateChallengeAnswerMessage"), flags, 3)
        this.vtbl.ProcessResponseMessage2 := CallbackCreate(GetMethod(implObj, "ProcessResponseMessage2"), flags, 5)
        this.vtbl.get_ResultMessageText := CallbackCreate(GetMethod(implObj, "get_ResultMessageText"), flags, 2)
        this.vtbl.get_DelayRetry := CallbackCreate(GetMethod(implObj, "get_DelayRetry"), flags, 2)
        this.vtbl.get_ActivityId := CallbackCreate(GetMethod(implObj, "get_ActivityId"), flags, 2)
        this.vtbl.put_ActivityId := CallbackCreate(GetMethod(implObj, "put_ActivityId"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateChallengeAnswerMessage)
        CallbackFree(this.vtbl.ProcessResponseMessage2)
        CallbackFree(this.vtbl.get_ResultMessageText)
        CallbackFree(this.vtbl.get_DelayRetry)
        CallbackFree(this.vtbl.get_ActivityId)
        CallbackFree(this.vtbl.put_ActivityId)
    }
}
