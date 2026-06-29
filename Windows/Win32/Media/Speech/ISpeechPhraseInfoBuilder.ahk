#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISpeechPhraseInfo.ahk" { ISpeechPhraseInfo }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpeechPhraseInfoBuilder extends IDispatch {
    /**
     * The interface identifier for ISpeechPhraseInfoBuilder
     * @type {Guid}
     */
    static IID := Guid("{3b151836-df3a-4e0a-846c-d2adc9334333}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpeechPhraseInfoBuilder interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        RestorePhraseFromMemory : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpeechPhraseInfoBuilder.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<VARIANT>} PhraseInMemory 
     * @returns {ISpeechPhraseInfo} 
     */
    RestorePhraseFromMemory(PhraseInMemory) {
        result := ComCall(7, this, VARIANT.Ptr, PhraseInMemory, "ptr*", &PhraseInfo := 0, "HRESULT")
        return ISpeechPhraseInfo(PhraseInfo)
    }

    Query(iid) {
        if (ISpeechPhraseInfoBuilder.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RestorePhraseFromMemory := CallbackCreate(GetMethod(implObj, "RestorePhraseFromMemory"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RestorePhraseFromMemory)
    }
}
