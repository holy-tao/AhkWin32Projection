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
        ObjectId_ := BSTR()
        result := ComCall(7, this, "ptr", ObjectId_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ObjectId_
    }

    /**
     * 
     * @returns {ISpeechDataKey} 
     */
    get_DataKey() {
        result := ComCall(8, this, "ptr*", &DataKey := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISpeechDataKey(DataKey)
    }

    /**
     * 
     * @returns {ISpeechObjectTokenCategory} 
     */
    get_Category() {
        result := ComCall(9, this, "ptr*", &Category := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISpeechObjectTokenCategory(Category)
    }

    /**
     * For current documentation on Windows Media codecs and digital signal processors, see Windows Media Audio and Video Codec and DSP APIs. | GetDescription
     * @param {Integer} Locale 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/wmformat/iwmcodecstrings-getdescription
     */
    GetDescription(Locale) {
        Description := BSTR()
        result := ComCall(10, this, "int", Locale, "ptr", Description, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/ktop-src/SecProv/setidentificationfield-win32-encryptablevolume
     */
    SetId(Id, CategoryID, CreateIfNotExist) {
        if(Id is String) {
            pin := BSTR.Alloc(Id)
            Id := pin.Value
        }
        if(CategoryID is String) {
            pin := BSTR.Alloc(CategoryID)
            CategoryID := pin.Value
        }

        result := ComCall(11, this, "ptr", Id, "ptr", CategoryID, "short", CreateIfNotExist, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} AttributeName 
     * @returns {BSTR} 
     */
    GetAttribute(AttributeName) {
        if(AttributeName is String) {
            pin := BSTR.Alloc(AttributeName)
            AttributeName := pin.Value
        }

        AttributeValue := BSTR()
        result := ComCall(12, this, "ptr", AttributeName, "ptr", AttributeValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AttributeValue
    }

    /**
     * The CWbemGlueFactory class is part of the WMI Provider Framework. The Provider Framework implements methods of this interface internally to create new instances of classes for the provider.
     * @remarks
     * The destructor for the class is <b>CWbemGlueFactory::~CWbemGlueFactory.</b>
     * @param {IUnknown} pUnkOuter 
     * @param {Integer} ClsContext 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wbemglue/nl-wbemglue-cwbemgluefactory
     */
    CreateInstance(pUnkOuter, ClsContext) {
        result := ComCall(13, this, "ptr", pUnkOuter, "uint", ClsContext, "ptr*", &Object_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(Object_)
    }

    /**
     * Creating, Altering, and Removing Views
     * @param {BSTR} ObjectStorageCLSID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/server-management-objects-smo/tasks/creating-altering-and-removing-views
     */
    Remove(ObjectStorageCLSID) {
        if(ObjectStorageCLSID is String) {
            pin := BSTR.Alloc(ObjectStorageCLSID)
            ObjectStorageCLSID := pin.Value
        }

        result := ComCall(14, this, "ptr", ObjectStorageCLSID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} ObjectStorageCLSID 
     * @param {BSTR} KeyName 
     * @param {BSTR} FileName 
     * @param {Integer} Folder_ 
     * @returns {BSTR} 
     */
    GetStorageFileName(ObjectStorageCLSID, KeyName, FileName, Folder_) {
        if(ObjectStorageCLSID is String) {
            pin := BSTR.Alloc(ObjectStorageCLSID)
            ObjectStorageCLSID := pin.Value
        }
        if(KeyName is String) {
            pin := BSTR.Alloc(KeyName)
            KeyName := pin.Value
        }
        if(FileName is String) {
            pin := BSTR.Alloc(FileName)
            FileName := pin.Value
        }

        FilePath := BSTR()
        result := ComCall(15, this, "ptr", ObjectStorageCLSID, "ptr", KeyName, "ptr", FileName, "int", Folder_, "ptr", FilePath, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        if(ObjectStorageCLSID is String) {
            pin := BSTR.Alloc(ObjectStorageCLSID)
            ObjectStorageCLSID := pin.Value
        }
        if(KeyName is String) {
            pin := BSTR.Alloc(KeyName)
            KeyName := pin.Value
        }

        result := ComCall(16, this, "ptr", ObjectStorageCLSID, "ptr", KeyName, "short", DeleteFile, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} TypeOfUI 
     * @param {Pointer<VARIANT>} ExtraData 
     * @param {IUnknown} Object_ 
     * @returns {VARIANT_BOOL} 
     */
    IsUISupported(TypeOfUI, ExtraData, Object_) {
        if(TypeOfUI is String) {
            pin := BSTR.Alloc(TypeOfUI)
            TypeOfUI := pin.Value
        }

        result := ComCall(17, this, "ptr", TypeOfUI, "ptr", ExtraData, "ptr", Object_, "short*", &Supported := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Supported
    }

    /**
     * 
     * @param {Integer} hWnd_ 
     * @param {BSTR} Title 
     * @param {BSTR} TypeOfUI 
     * @param {Pointer<VARIANT>} ExtraData 
     * @param {IUnknown} Object_ 
     * @returns {HRESULT} 
     */
    DisplayUI(hWnd_, Title, TypeOfUI, ExtraData, Object_) {
        if(Title is String) {
            pin := BSTR.Alloc(Title)
            Title := pin.Value
        }
        if(TypeOfUI is String) {
            pin := BSTR.Alloc(TypeOfUI)
            TypeOfUI := pin.Value
        }

        result := ComCall(18, this, "int", hWnd_, "ptr", Title, "ptr", TypeOfUI, "ptr", ExtraData, "ptr", Object_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} Attributes 
     * @returns {VARIANT_BOOL} 
     */
    MatchesAttributes(Attributes) {
        if(Attributes is String) {
            pin := BSTR.Alloc(Attributes)
            Attributes := pin.Value
        }

        result := ComCall(19, this, "ptr", Attributes, "short*", &Matches := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Matches
    }
}
