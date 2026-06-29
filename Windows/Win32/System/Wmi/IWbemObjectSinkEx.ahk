#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IWbemClassObject.ahk" { IWbemClassObject }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWbemObjectSink.ahk" { IWbemObjectSink }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.System.Wmi
 */
export default struct IWbemObjectSinkEx extends IWbemObjectSink {
    /**
     * The interface identifier for IWbemObjectSinkEx
     * @type {Guid}
     */
    static IID := Guid("{e7d35cfa-348b-485e-b524-252725d697ca}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWbemObjectSinkEx interfaces
    */
    struct Vtbl extends IWbemObjectSink.Vtbl {
        WriteMessage         : IntPtr
        WriteError           : IntPtr
        PromptUser           : IntPtr
        WriteProgress        : IntPtr
        WriteStreamParameter : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWbemObjectSinkEx.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * TBD (IWbemObjectSinkEx.WriteMessage)
     * @param {Integer} uChannel 
     * @param {BSTR} strMessage 
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemobjectsinkex-writemessage
     */
    WriteMessage(uChannel, strMessage) {
        strMessage := strMessage is String ? BSTR.Alloc(strMessage).Value : strMessage

        result := ComCall(5, this, "uint", uChannel, BSTR, strMessage, "HRESULT")
        return result
    }

    /**
     * TBD (IWbemObjectSinkEx.WriteError)
     * @param {IWbemClassObject} pObjError 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemobjectsinkex-writeerror
     */
    WriteError(pObjError) {
        result := ComCall(6, this, "ptr", pObjError, "char*", &puReturned := 0, "HRESULT")
        return puReturned
    }

    /**
     * TBD (IWbemObjectSinkEx.PromptUser)
     * @param {BSTR} strMessage 
     * @param {Integer} uPromptType 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemobjectsinkex-promptuser
     */
    PromptUser(strMessage, uPromptType) {
        strMessage := strMessage is String ? BSTR.Alloc(strMessage).Value : strMessage

        result := ComCall(7, this, BSTR, strMessage, "char", uPromptType, "char*", &puReturned := 0, "HRESULT")
        return puReturned
    }

    /**
     * TBD (IWbemObjectSinkEx.WriteProgress)
     * @param {BSTR} strActivity 
     * @param {BSTR} strCurrentOperation 
     * @param {BSTR} strStatusDescription 
     * @param {Integer} uPercentComplete 
     * @param {Integer} uSecondsRemaining 
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemobjectsinkex-writeprogress
     */
    WriteProgress(strActivity, strCurrentOperation, strStatusDescription, uPercentComplete, uSecondsRemaining) {
        strActivity := strActivity is String ? BSTR.Alloc(strActivity).Value : strActivity
        strCurrentOperation := strCurrentOperation is String ? BSTR.Alloc(strCurrentOperation).Value : strCurrentOperation
        strStatusDescription := strStatusDescription is String ? BSTR.Alloc(strStatusDescription).Value : strStatusDescription

        result := ComCall(8, this, BSTR, strActivity, BSTR, strCurrentOperation, BSTR, strStatusDescription, "uint", uPercentComplete, "uint", uSecondsRemaining, "HRESULT")
        return result
    }

    /**
     * TBD (IWbemObjectSinkEx.WriteStreamParameter)
     * @param {BSTR} strName 
     * @param {Pointer<VARIANT>} vtValue 
     * @param {Integer} ulType 
     * @param {Integer} ulFlags 
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemobjectsinkex-writestreamparameter
     */
    WriteStreamParameter(strName, vtValue, ulType, ulFlags) {
        strName := strName is String ? BSTR.Alloc(strName).Value : strName

        result := ComCall(9, this, BSTR, strName, VARIANT.Ptr, vtValue, "uint", ulType, "uint", ulFlags, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWbemObjectSinkEx.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.WriteMessage := CallbackCreate(GetMethod(implObj, "WriteMessage"), flags, 3)
        this.vtbl.WriteError := CallbackCreate(GetMethod(implObj, "WriteError"), flags, 3)
        this.vtbl.PromptUser := CallbackCreate(GetMethod(implObj, "PromptUser"), flags, 4)
        this.vtbl.WriteProgress := CallbackCreate(GetMethod(implObj, "WriteProgress"), flags, 6)
        this.vtbl.WriteStreamParameter := CallbackCreate(GetMethod(implObj, "WriteStreamParameter"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.WriteMessage)
        CallbackFree(this.vtbl.WriteError)
        CallbackFree(this.vtbl.PromptUser)
        CallbackFree(this.vtbl.WriteProgress)
        CallbackFree(this.vtbl.WriteStreamParameter)
    }
}
