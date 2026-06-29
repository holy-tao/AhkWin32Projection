#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\SPXMLRESULTOPTIONS.ahk" { SPXMLRESULTOPTIONS }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\ISpeechRecoResult.ahk" { ISpeechRecoResult }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpeechXMLRecoResult extends ISpeechRecoResult {
    /**
     * The interface identifier for ISpeechXMLRecoResult
     * @type {Guid}
     */
    static IID := Guid("{aaec54af-8f85-4924-944d-b79d39d72e19}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpeechXMLRecoResult interfaces
    */
    struct Vtbl extends ISpeechRecoResult.Vtbl {
        GetXMLResult    : IntPtr
        GetXMLErrorInfo : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpeechXMLRecoResult.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {SPXMLRESULTOPTIONS} Options 
     * @returns {BSTR} 
     */
    GetXMLResult(Options) {
        pResult := BSTR.Owned()
        result := ComCall(17, this, SPXMLRESULTOPTIONS, Options, BSTR.Ptr, pResult, "HRESULT")
        return pResult
    }

    /**
     * 
     * @param {Pointer<Integer>} LineNumber 
     * @param {Pointer<BSTR>} ScriptLine 
     * @param {Pointer<BSTR>} Source 
     * @param {Pointer<BSTR>} Description 
     * @param {Pointer<Integer>} ResultCode 
     * @param {Pointer<VARIANT_BOOL>} IsError 
     * @returns {HRESULT} 
     */
    GetXMLErrorInfo(LineNumber, ScriptLine, Source, Description, ResultCode, IsError) {
        LineNumberMarshal := LineNumber is VarRef ? "int*" : "ptr"
        ResultCodeMarshal := ResultCode is VarRef ? "int*" : "ptr"
        IsErrorMarshal := IsError is VarRef ? "short*" : "ptr"

        result := ComCall(18, this, LineNumberMarshal, LineNumber, BSTR.Ptr, ScriptLine, BSTR.Ptr, Source, BSTR.Ptr, Description, ResultCodeMarshal, ResultCode, IsErrorMarshal, IsError, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISpeechXMLRecoResult.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetXMLResult := CallbackCreate(GetMethod(implObj, "GetXMLResult"), flags, 3)
        this.vtbl.GetXMLErrorInfo := CallbackCreate(GetMethod(implObj, "GetXMLErrorInfo"), flags, 7)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetXMLResult)
        CallbackFree(this.vtbl.GetXMLErrorInfo)
    }
}
