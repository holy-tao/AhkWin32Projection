#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ISpeechDataKey.ahk
#Include .\ISpeechObjectTokenCategory.ahk
#Include ..\..\System\Com\IUnknown.ahk
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
     * @type {BSTR} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {ISpeechDataKey} 
     */
    DataKey {
        get => this.get_DataKey()
    }

    /**
     * @type {ISpeechObjectTokenCategory} 
     */
    Category {
        get => this.get_Category()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Id() {
        ObjectId := BSTR()
        result := ComCall(7, this, "ptr", ObjectId, "HRESULT")
        return ObjectId
    }

    /**
     * 
     * @returns {ISpeechDataKey} 
     */
    get_DataKey() {
        result := ComCall(8, this, "ptr*", &DataKey := 0, "HRESULT")
        return ISpeechDataKey(DataKey)
    }

    /**
     * 
     * @returns {ISpeechObjectTokenCategory} 
     */
    get_Category() {
        result := ComCall(9, this, "ptr*", &Category := 0, "HRESULT")
        return ISpeechObjectTokenCategory(Category)
    }

    /**
     * For current documentation on Windows Media codecs and digital signal processors, see Windows Media Audio and Video Codec and DSP APIs. | GetDescription
     * @param {Integer} Locale 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/wmformat/iwmcodecstrings-getdescription
     */
    GetDescription(Locale) {
        Description := BSTR()
        result := ComCall(10, this, "int", Locale, "ptr", Description, "HRESULT")
        return Description
    }

    /**
     * Sets the specified identifier string in the volume's metadata.
     * @param {BSTR} Id 
     * @param {BSTR} CategoryID 
     * @param {VARIANT_BOOL} CreateIfNotExist 
     * @returns {HRESULT} Type: **uint32**
     * 
     * This method returns one of the following codes or another error code if it fails.
     * 
     * 
     * 
     * | Return code/value                                                                                                                                                                  | Description                                                                                                     |
     * |------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------|
     * | <dl> <dt>**S\_OK**</dt> <dt>0 (0x0)</dt> </dl>                                  | The method was successful.<br/>                                                                           |
     * | <dl> <dt>**FVE\_E\_LOCKED\_VOLUME**</dt> <dt>2150694912 (0x80310000)</dt> </dl> | This drive is locked by BitLocker Drive Encryption. You must unlock this volume from Control Panel. <br/> |
     * | <dl> <dt>**FVE\_E\_NOT\_ACTIVATED**</dt> <dt>2150694920 (0x80310008)</dt> </dl> | BitLocker is not enabled on the volume. Add a key protector to enable BitLocker. <br/>                    |
     * @see https://learn.microsoft.com/windows/win32/SecProv/setidentificationfield-win32-encryptablevolume
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
     * @returns {BSTR} 
     */
    GetAttribute(AttributeName) {
        AttributeName := AttributeName is String ? BSTR.Alloc(AttributeName).Value : AttributeName

        AttributeValue := BSTR()
        result := ComCall(12, this, "ptr", AttributeName, "ptr", AttributeValue, "HRESULT")
        return AttributeValue
    }

    /**
     * The CWbemGlueFactory class is part of the WMI Provider Framework. The Provider Framework implements methods of this interface internally to create new instances of classes for the provider.
     * @remarks
     * The destructor for the class is <b>CWbemGlueFactory::~CWbemGlueFactory.</b>
     * @param {IUnknown} pUnkOuter 
     * @param {Integer} ClsContext 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemglue/nl-wbemglue-cwbemgluefactory
     */
    CreateInstance(pUnkOuter, ClsContext) {
        result := ComCall(13, this, "ptr", pUnkOuter, "uint", ClsContext, "ptr*", &Object_R := 0, "HRESULT")
        return IUnknown(Object_R)
    }

    /**
     * Removes a TPM command from the local list of commands blocked from running on the computer.
     * @remarks
     * Managed Object Format (MOF) files contain the definitions for Windows Management Instrumentation (WMI) classes. MOF files are not installed as part of the Windows SDK. They are installed on the server when you add the associated role by using the Server Manager. For more information about MOF files, see [Managed Object Format (MOF)](../wmisdk/managed-object-format--mof-.md).
     * @param {BSTR} ObjectStorageCLSID 
     * @returns {HRESULT} Type: **uint32**
     * 
     * All TPM errors as well as errors specific to TPM Base Services can be returned.
     * 
     * Common return codes are listed below.
     * 
     * 
     * 
     * | Return code/value                                                                                                                                 | Description                           |
     * |---------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------|
     * | <dl> <dt>**S\_OK**</dt> <dt>0 (0x0)</dt> </dl> | The method was successful.<br/> |
     * @see https://learn.microsoft.com/windows/win32/SecProv/removeblockedcommand-win32-tpm
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
     * @returns {BSTR} 
     */
    GetStorageFileName(ObjectStorageCLSID, KeyName, FileName, Folder) {
        ObjectStorageCLSID := ObjectStorageCLSID is String ? BSTR.Alloc(ObjectStorageCLSID).Value : ObjectStorageCLSID
        KeyName := KeyName is String ? BSTR.Alloc(KeyName).Value : KeyName
        FileName := FileName is String ? BSTR.Alloc(FileName).Value : FileName

        FilePath := BSTR()
        result := ComCall(15, this, "ptr", ObjectStorageCLSID, "ptr", KeyName, "ptr", FileName, "int", Folder, "ptr", FilePath, "HRESULT")
        return FilePath
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
     * @param {IUnknown} Object_R 
     * @returns {VARIANT_BOOL} 
     */
    IsUISupported(TypeOfUI, ExtraData, Object_R) {
        TypeOfUI := TypeOfUI is String ? BSTR.Alloc(TypeOfUI).Value : TypeOfUI

        result := ComCall(17, this, "ptr", TypeOfUI, "ptr", ExtraData, "ptr", Object_R, "short*", &Supported := 0, "HRESULT")
        return Supported
    }

    /**
     * 
     * @param {Integer} hWnd 
     * @param {BSTR} Title 
     * @param {BSTR} TypeOfUI 
     * @param {Pointer<VARIANT>} ExtraData 
     * @param {IUnknown} Object_R 
     * @returns {HRESULT} 
     */
    DisplayUI(hWnd, Title, TypeOfUI, ExtraData, Object_R) {
        Title := Title is String ? BSTR.Alloc(Title).Value : Title
        TypeOfUI := TypeOfUI is String ? BSTR.Alloc(TypeOfUI).Value : TypeOfUI

        result := ComCall(18, this, "int", hWnd, "ptr", Title, "ptr", TypeOfUI, "ptr", ExtraData, "ptr", Object_R, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} Attributes 
     * @returns {VARIANT_BOOL} 
     */
    MatchesAttributes(Attributes) {
        Attributes := Attributes is String ? BSTR.Alloc(Attributes).Value : Attributes

        result := ComCall(19, this, "ptr", Attributes, "short*", &Matches := 0, "HRESULT")
        return Matches
    }
}
