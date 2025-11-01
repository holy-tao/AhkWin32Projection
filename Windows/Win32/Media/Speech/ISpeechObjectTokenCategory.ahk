#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechObjectTokenCategory extends IDispatch{

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
     * 
     * @param {Pointer<BSTR>} Id 
     * @returns {HRESULT} 
     */
    get_Id(Id) {
        result := ComCall(7, this, "ptr", Id, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} TokenId 
     * @returns {HRESULT} 
     */
    get_Default(TokenId) {
        result := ComCall(9, this, "ptr", TokenId, "HRESULT")
        return result
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
     * @param {Integer} Location 
     * @param {Pointer<ISpeechDataKey>} DataKey 
     * @returns {HRESULT} 
     */
    GetDataKey(Location, DataKey) {
        result := ComCall(11, this, "int", Location, "ptr*", DataKey, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} RequiredAttributes 
     * @param {BSTR} OptionalAttributes 
     * @param {Pointer<ISpeechObjectTokens>} Tokens 
     * @returns {HRESULT} 
     */
    EnumerateTokens(RequiredAttributes, OptionalAttributes, Tokens) {
        RequiredAttributes := RequiredAttributes is String ? BSTR.Alloc(RequiredAttributes).Value : RequiredAttributes
        OptionalAttributes := OptionalAttributes is String ? BSTR.Alloc(OptionalAttributes).Value : OptionalAttributes

        result := ComCall(12, this, "ptr", RequiredAttributes, "ptr", OptionalAttributes, "ptr*", Tokens, "HRESULT")
        return result
    }
}
