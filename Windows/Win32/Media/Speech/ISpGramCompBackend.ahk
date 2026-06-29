#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import ".\SPBINARYGRAMMAR.ahk" { SPBINARYGRAMMAR }
#Import ".\ISpErrorLog.ahk" { ISpErrorLog }
#Import ".\ISpGrammarBuilder.ahk" { ISpGrammarBuilder }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpGramCompBackend extends ISpGrammarBuilder {
    /**
     * The interface identifier for ISpGramCompBackend
     * @type {Guid}
     */
    static IID := Guid("{3ddca27c-665c-4786-9f97-8c90c3488b61}")

    /**
     * The class identifier for SpGramCompBackend
     * @type {Guid}
     */
    static CLSID := Guid("{da93e903-c843-11d2-a084-00c04f8ef9b5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpGramCompBackend interfaces
    */
    struct Vtbl extends ISpGrammarBuilder.Vtbl {
        SetSaveObjects        : IntPtr
        InitFromBinaryGrammar : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpGramCompBackend.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IStream} pStream 
     * @param {ISpErrorLog} pErrorLog 
     * @returns {HRESULT} 
     */
    SetSaveObjects(pStream, pErrorLog) {
        result := ComCall(11, this, "ptr", pStream, "ptr", pErrorLog, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SPBINARYGRAMMAR>} pBinaryData 
     * @returns {HRESULT} 
     */
    InitFromBinaryGrammar(pBinaryData) {
        result := ComCall(12, this, SPBINARYGRAMMAR.Ptr, pBinaryData, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISpGramCompBackend.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetSaveObjects := CallbackCreate(GetMethod(implObj, "SetSaveObjects"), flags, 3)
        this.vtbl.InitFromBinaryGrammar := CallbackCreate(GetMethod(implObj, "InitFromBinaryGrammar"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetSaveObjects)
        CallbackFree(this.vtbl.InitFromBinaryGrammar)
    }
}
