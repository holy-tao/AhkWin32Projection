#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpeechPhoneConverter extends IDispatch {
    /**
     * The interface identifier for ISpeechPhoneConverter
     * @type {Guid}
     */
    static IID := Guid("{c3e4f353-433f-43d6-89a1-6a62a7054c3d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpeechPhoneConverter interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_LanguageId : IntPtr
        put_LanguageId : IntPtr
        PhoneToId      : IntPtr
        IdToPhone      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpeechPhoneConverter.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    LanguageId {
        get => this.get_LanguageId()
        set => this.put_LanguageId(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LanguageId() {
        result := ComCall(7, this, "int*", &LanguageId := 0, "HRESULT")
        return LanguageId
    }

    /**
     * 
     * @param {Integer} LanguageId 
     * @returns {HRESULT} 
     */
    put_LanguageId(LanguageId) {
        result := ComCall(8, this, "int", LanguageId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} Phonemes 
     * @returns {VARIANT} 
     */
    PhoneToId(Phonemes) {
        Phonemes := Phonemes is String ? BSTR.Alloc(Phonemes).Value : Phonemes

        IdArray := VARIANT()
        result := ComCall(9, this, BSTR, Phonemes, VARIANT.Ptr, IdArray, "HRESULT")
        return IdArray
    }

    /**
     * 
     * @param {VARIANT} IdArray 
     * @returns {BSTR} 
     */
    IdToPhone(IdArray) {
        Phonemes := BSTR.Owned()
        result := ComCall(10, this, VARIANT, IdArray, BSTR.Ptr, Phonemes, "HRESULT")
        return Phonemes
    }

    Query(iid) {
        if (ISpeechPhoneConverter.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_LanguageId := CallbackCreate(GetMethod(implObj, "get_LanguageId"), flags, 2)
        this.vtbl.put_LanguageId := CallbackCreate(GetMethod(implObj, "put_LanguageId"), flags, 2)
        this.vtbl.PhoneToId := CallbackCreate(GetMethod(implObj, "PhoneToId"), flags, 3)
        this.vtbl.IdToPhone := CallbackCreate(GetMethod(implObj, "IdToPhone"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_LanguageId)
        CallbackFree(this.vtbl.put_LanguageId)
        CallbackFree(this.vtbl.PhoneToId)
        CallbackFree(this.vtbl.IdToPhone)
    }
}
