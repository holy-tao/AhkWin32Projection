#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechObjectToken extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpeechObjectToken
     * @type {Guid}
     */
    static IID => Guid("{c74a3adc-b727-4500-a84a-b526721c8b8c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Id", "get_DataKey", "get_Category", "GetDescription", "SetId", "GetAttribute", "CreateInstance", "Remove", "GetStorageFileName", "RemoveStorageFileName", "IsUISupported", "DisplayUI", "MatchesAttributes"]

    /**
     * 
     * @param {Pointer<BSTR>} ObjectId 
     * @returns {HRESULT} 
     */
    get_Id(ObjectId) {
        result := ComCall(7, this, "ptr", ObjectId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISpeechDataKey>} DataKey 
     * @returns {HRESULT} 
     */
    get_DataKey(DataKey) {
        result := ComCall(8, this, "ptr*", DataKey, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISpeechObjectTokenCategory>} Category 
     * @returns {HRESULT} 
     */
    get_Category(Category) {
        result := ComCall(9, this, "ptr*", Category, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Locale 
     * @param {Pointer<BSTR>} Description 
     * @returns {HRESULT} 
     */
    GetDescription(Locale, Description) {
        result := ComCall(10, this, "int", Locale, "ptr", Description, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} Id 
     * @param {BSTR} CategoryID 
     * @param {VARIANT_BOOL} CreateIfNotExist 
     * @returns {HRESULT} 
     */
    SetId(Id, CategoryID, CreateIfNotExist) {
        Id := Id is String ? BSTR.Alloc(Id).Value : Id
        CategoryID := CategoryID is String ? BSTR.Alloc(CategoryID).Value : CategoryID

        result := ComCall(11, this, "ptr", Id, "ptr", CategoryID, "short", CreateIfNotExist, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} AttributeName 
     * @param {Pointer<BSTR>} AttributeValue 
     * @returns {HRESULT} 
     */
    GetAttribute(AttributeName, AttributeValue) {
        AttributeName := AttributeName is String ? BSTR.Alloc(AttributeName).Value : AttributeName

        result := ComCall(12, this, "ptr", AttributeName, "ptr", AttributeValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pUnkOuter 
     * @param {Integer} ClsContext 
     * @param {Pointer<IUnknown>} Object 
     * @returns {HRESULT} 
     */
    CreateInstance(pUnkOuter, ClsContext, Object) {
        result := ComCall(13, this, "ptr", pUnkOuter, "uint", ClsContext, "ptr*", Object, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} ObjectStorageCLSID 
     * @returns {HRESULT} 
     */
    Remove(ObjectStorageCLSID) {
        ObjectStorageCLSID := ObjectStorageCLSID is String ? BSTR.Alloc(ObjectStorageCLSID).Value : ObjectStorageCLSID

        result := ComCall(14, this, "ptr", ObjectStorageCLSID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} ObjectStorageCLSID 
     * @param {BSTR} KeyName 
     * @param {BSTR} FileName 
     * @param {Integer} Folder 
     * @param {Pointer<BSTR>} FilePath 
     * @returns {HRESULT} 
     */
    GetStorageFileName(ObjectStorageCLSID, KeyName, FileName, Folder, FilePath) {
        ObjectStorageCLSID := ObjectStorageCLSID is String ? BSTR.Alloc(ObjectStorageCLSID).Value : ObjectStorageCLSID
        KeyName := KeyName is String ? BSTR.Alloc(KeyName).Value : KeyName
        FileName := FileName is String ? BSTR.Alloc(FileName).Value : FileName

        result := ComCall(15, this, "ptr", ObjectStorageCLSID, "ptr", KeyName, "ptr", FileName, "int", Folder, "ptr", FilePath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} ObjectStorageCLSID 
     * @param {BSTR} KeyName 
     * @param {VARIANT_BOOL} DeleteFile 
     * @returns {HRESULT} 
     */
    RemoveStorageFileName(ObjectStorageCLSID, KeyName, DeleteFile) {
        ObjectStorageCLSID := ObjectStorageCLSID is String ? BSTR.Alloc(ObjectStorageCLSID).Value : ObjectStorageCLSID
        KeyName := KeyName is String ? BSTR.Alloc(KeyName).Value : KeyName

        result := ComCall(16, this, "ptr", ObjectStorageCLSID, "ptr", KeyName, "short", DeleteFile, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} TypeOfUI 
     * @param {Pointer<VARIANT>} ExtraData 
     * @param {IUnknown} Object 
     * @param {Pointer<VARIANT_BOOL>} Supported 
     * @returns {HRESULT} 
     */
    IsUISupported(TypeOfUI, ExtraData, Object, Supported) {
        TypeOfUI := TypeOfUI is String ? BSTR.Alloc(TypeOfUI).Value : TypeOfUI

        result := ComCall(17, this, "ptr", TypeOfUI, "ptr", ExtraData, "ptr", Object, "ptr", Supported, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} hWnd 
     * @param {BSTR} Title 
     * @param {BSTR} TypeOfUI 
     * @param {Pointer<VARIANT>} ExtraData 
     * @param {IUnknown} Object 
     * @returns {HRESULT} 
     */
    DisplayUI(hWnd, Title, TypeOfUI, ExtraData, Object) {
        Title := Title is String ? BSTR.Alloc(Title).Value : Title
        TypeOfUI := TypeOfUI is String ? BSTR.Alloc(TypeOfUI).Value : TypeOfUI

        result := ComCall(18, this, "int", hWnd, "ptr", Title, "ptr", TypeOfUI, "ptr", ExtraData, "ptr", Object, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} Attributes 
     * @param {Pointer<VARIANT_BOOL>} Matches 
     * @returns {HRESULT} 
     */
    MatchesAttributes(Attributes, Matches) {
        Attributes := Attributes is String ? BSTR.Alloc(Attributes).Value : Attributes

        result := ComCall(19, this, "ptr", Attributes, "ptr", Matches, "HRESULT")
        return result
    }
}
