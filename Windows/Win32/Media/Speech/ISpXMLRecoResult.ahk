#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\SPXMLRESULTOPTIONS.ahk" { SPXMLRESULTOPTIONS }
#Import ".\SPSEMANTICERRORINFO.ahk" { SPSEMANTICERRORINFO }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISpRecoResult.ahk" { ISpRecoResult }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpXMLRecoResult extends ISpRecoResult {
    /**
     * The interface identifier for ISpXMLRecoResult
     * @type {Guid}
     */
    static IID := Guid("{ae39362b-45a8-4074-9b9e-ccf49aa2d0b6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpXMLRecoResult interfaces
    */
    struct Vtbl extends ISpRecoResult.Vtbl {
        GetXMLResult    : IntPtr
        GetXMLErrorInfo : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpXMLRecoResult.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {SPXMLRESULTOPTIONS} Options 
     * @returns {PWSTR} 
     */
    GetXMLResult(Options) {
        result := ComCall(14, this, PWSTR.Ptr, &ppszCoMemXMLResult := 0, SPXMLRESULTOPTIONS, Options, "HRESULT")
        return ppszCoMemXMLResult
    }

    /**
     * 
     * @param {Pointer<SPSEMANTICERRORINFO>} pSemanticErrorInfo 
     * @returns {HRESULT} 
     */
    GetXMLErrorInfo(pSemanticErrorInfo) {
        result := ComCall(15, this, SPSEMANTICERRORINFO.Ptr, pSemanticErrorInfo, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISpXMLRecoResult.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetXMLResult := CallbackCreate(GetMethod(implObj, "GetXMLResult"), flags, 3)
        this.vtbl.GetXMLErrorInfo := CallbackCreate(GetMethod(implObj, "GetXMLErrorInfo"), flags, 2)
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
