#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import ".\ISpErrorLog.ahk" { ISpErrorLog }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpGrammarCompiler extends IUnknown {
    /**
     * The interface identifier for ISpGrammarCompiler
     * @type {Guid}
     */
    static IID := Guid("{b1e29d58-a675-11d2-8302-00c04f8ee6c0}")

    /**
     * The class identifier for SpGrammarCompiler
     * @type {Guid}
     */
    static CLSID := Guid("{b1e29d59-a675-11d2-8302-00c04f8ee6c0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpGrammarCompiler interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CompileStream : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpGrammarCompiler.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IStream} pSource 
     * @param {IStream} pDest 
     * @param {IStream} pHeader 
     * @param {IUnknown} pReserved 
     * @param {ISpErrorLog} pErrorLog 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    CompileStream(pSource, pDest, pHeader, pReserved, pErrorLog, dwFlags) {
        result := ComCall(3, this, "ptr", pSource, "ptr", pDest, "ptr", pHeader, "ptr", pReserved, "ptr", pErrorLog, "uint", dwFlags, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISpGrammarCompiler.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CompileStream := CallbackCreate(GetMethod(implObj, "CompileStream"), flags, 7)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CompileStream)
    }
}
