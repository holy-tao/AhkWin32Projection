#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISpeechDataKey.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk
#Include .\ISpeechObjectTokens.ahk
#Include ..\..\Foundation\VARIANT_BOOL.ahk
#Include .\SpeechDataKeyLocation.ahk
#Include ..\..\Foundation\HRESULT.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class ISpeechObjectTokenCategory extends IDispatch {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpeechObjectTokenCategory
     * @type {Guid}
     */
    static IID => Guid("{ca7eac50-2d01-4145-86d4-5ae7d70f4469}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Id", "put_Default", "get_Default", "SetId", "GetDataKey", "EnumerateTokens"]

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
        Id := BSTR({Value: 0}, True)
        result := ComCall(7, this, "ptr", Id, "HRESULT")
        return Id
    }

    /**
     * 
     * @param {BSTR} TokenId 
     * @returns {HRESULT} 
     */
    put_Default(TokenId) {
        TokenId := TokenId is String ? BSTR.Alloc(TokenId).Value : TokenId

        result := ComCall(8, this, "ptr", TokenId, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Default() {
        TokenId := BSTR({Value: 0}, True)
        result := ComCall(9, this, "ptr", TokenId, "HRESULT")
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

        result := ComCall(10, this, "ptr", Id, "short", CreateIfNotExist, "HRESULT")
        return result
    }

    /**
     * 
     * @param {SpeechDataKeyLocation} _Location 
     * @returns {ISpeechDataKey} 
     */
    GetDataKey(_Location) {
        result := ComCall(11, this, "int", _Location, "ptr*", &DataKey := 0, "HRESULT")
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

        result := ComCall(12, this, "ptr", RequiredAttributes, "ptr", OptionalAttributes, "ptr*", &Tokens := 0, "HRESULT")
        return ISpeechObjectTokens(Tokens)
    }
}
