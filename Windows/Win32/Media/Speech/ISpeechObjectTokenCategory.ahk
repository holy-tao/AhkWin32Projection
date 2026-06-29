#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISpeechObjectTokens.ahk" { ISpeechObjectTokens }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\SpeechDataKeyLocation.ahk" { SpeechDataKeyLocation }
#Import ".\ISpeechDataKey.ahk" { ISpeechDataKey }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpeechObjectTokenCategory extends IDispatch {
    /**
     * The interface identifier for ISpeechObjectTokenCategory
     * @type {Guid}
     */
    static IID := Guid("{ca7eac50-2d01-4145-86d4-5ae7d70f4469}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpeechObjectTokenCategory interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Id          : IntPtr
        put_Default     : IntPtr
        get_Default     : IntPtr
        SetId           : IntPtr
        GetDataKey      : IntPtr
        EnumerateTokens : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpeechObjectTokenCategory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {BSTR} 
     */
    Default {
        get => this.get_Default()
        set => this.put_Default(value)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Id() {
        Id := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, Id, "HRESULT")
        return Id
    }

    /**
     * 
     * @param {BSTR} TokenId 
     * @returns {HRESULT} 
     */
    put_Default(TokenId) {
        TokenId := TokenId is String ? BSTR.Alloc(TokenId).Value : TokenId

        result := ComCall(8, this, BSTR, TokenId, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Default() {
        TokenId := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, TokenId, "HRESULT")
        return TokenId
    }

    /**
     * 
     * @param {BSTR} Id 
     * @param {VARIANT_BOOL} CreateIfNotExist 
     * @returns {HRESULT} 
     */
    SetId(Id, CreateIfNotExist) {
        Id := Id is String ? BSTR.Alloc(Id).Value : Id

        result := ComCall(10, this, BSTR, Id, VARIANT_BOOL, CreateIfNotExist, "HRESULT")
        return result
    }

    /**
     * 
     * @param {SpeechDataKeyLocation} _Location 
     * @returns {ISpeechDataKey} 
     */
    GetDataKey(_Location) {
        result := ComCall(11, this, SpeechDataKeyLocation, _Location, "ptr*", &DataKey := 0, "HRESULT")
        return ISpeechDataKey(DataKey)
    }

    /**
     * 
     * @param {BSTR} RequiredAttributes 
     * @param {BSTR} OptionalAttributes 
     * @returns {ISpeechObjectTokens} 
     */
    EnumerateTokens(RequiredAttributes, OptionalAttributes) {
        RequiredAttributes := RequiredAttributes is String ? BSTR.Alloc(RequiredAttributes).Value : RequiredAttributes
        OptionalAttributes := OptionalAttributes is String ? BSTR.Alloc(OptionalAttributes).Value : OptionalAttributes

        result := ComCall(12, this, BSTR, RequiredAttributes, BSTR, OptionalAttributes, "ptr*", &Tokens := 0, "HRESULT")
        return ISpeechObjectTokens(Tokens)
    }

    Query(iid) {
        if (ISpeechObjectTokenCategory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Id := CallbackCreate(GetMethod(implObj, "get_Id"), flags, 2)
        this.vtbl.put_Default := CallbackCreate(GetMethod(implObj, "put_Default"), flags, 2)
        this.vtbl.get_Default := CallbackCreate(GetMethod(implObj, "get_Default"), flags, 2)
        this.vtbl.SetId := CallbackCreate(GetMethod(implObj, "SetId"), flags, 3)
        this.vtbl.GetDataKey := CallbackCreate(GetMethod(implObj, "GetDataKey"), flags, 3)
        this.vtbl.EnumerateTokens := CallbackCreate(GetMethod(implObj, "EnumerateTokens"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Id)
        CallbackFree(this.vtbl.put_Default)
        CallbackFree(this.vtbl.get_Default)
        CallbackFree(this.vtbl.SetId)
        CallbackFree(this.vtbl.GetDataKey)
        CallbackFree(this.vtbl.EnumerateTokens)
    }
}
