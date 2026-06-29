#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\SPSERIALIZEDPHRASE.ahk" { SPSERIALIZEDPHRASE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\SPPHRASE.ahk" { SPPHRASE }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpPhrase extends IUnknown {
    /**
     * The interface identifier for ISpPhrase
     * @type {Guid}
     */
    static IID := Guid("{1a5c0354-b621-4b5a-8791-d306ed379e53}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpPhrase interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetPhrase           : IntPtr
        GetSerializedPhrase : IntPtr
        GetText             : IntPtr
        Discard             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpPhrase.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Pointer<SPPHRASE>} 
     */
    GetPhrase() {
        result := ComCall(3, this, "ptr*", &ppCoMemPhrase := 0, "HRESULT")
        return ppCoMemPhrase
    }

    /**
     * 
     * @returns {Pointer<SPSERIALIZEDPHRASE>} 
     */
    GetSerializedPhrase() {
        result := ComCall(4, this, "ptr*", &ppCoMemPhrase := 0, "HRESULT")
        return ppCoMemPhrase
    }

    /**
     * 
     * @param {Integer} ulStart 
     * @param {Integer} ulCount 
     * @param {BOOL} fUseTextReplacements 
     * @param {Pointer<PWSTR>} ppszCoMemText 
     * @param {Pointer<Integer>} pbDisplayAttributes 
     * @returns {HRESULT} 
     */
    GetText(ulStart, ulCount, fUseTextReplacements, ppszCoMemText, pbDisplayAttributes) {
        ppszCoMemTextMarshal := ppszCoMemText is VarRef ? "ptr*" : "ptr"
        pbDisplayAttributesMarshal := pbDisplayAttributes is VarRef ? "char*" : "ptr"

        result := ComCall(5, this, "uint", ulStart, "uint", ulCount, BOOL, fUseTextReplacements, ppszCoMemTextMarshal, ppszCoMemText, pbDisplayAttributesMarshal, pbDisplayAttributes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwValueTypes 
     * @returns {HRESULT} 
     */
    Discard(dwValueTypes) {
        result := ComCall(6, this, "uint", dwValueTypes, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISpPhrase.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPhrase := CallbackCreate(GetMethod(implObj, "GetPhrase"), flags, 2)
        this.vtbl.GetSerializedPhrase := CallbackCreate(GetMethod(implObj, "GetSerializedPhrase"), flags, 2)
        this.vtbl.GetText := CallbackCreate(GetMethod(implObj, "GetText"), flags, 6)
        this.vtbl.Discard := CallbackCreate(GetMethod(implObj, "Discard"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPhrase)
        CallbackFree(this.vtbl.GetSerializedPhrase)
        CallbackFree(this.vtbl.GetText)
        CallbackFree(this.vtbl.Discard)
    }
}
