#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\SpeechTokenContext.ahk" { SpeechTokenContext }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\SpeechTokenShellFolder.ahk" { SpeechTokenShellFolder }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISpeechObjectTokenCategory.ahk" { ISpeechObjectTokenCategory }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\ISpeechDataKey.ahk" { ISpeechDataKey }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpeechObjectToken extends IDispatch {
    /**
     * The interface identifier for ISpeechObjectToken
     * @type {Guid}
     */
    static IID := Guid("{c74a3adc-b727-4500-a84a-b526721c8b8c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpeechObjectToken interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Id                : IntPtr
        get_DataKey           : IntPtr
        get_Category          : IntPtr
        GetDescription        : IntPtr
        SetId                 : IntPtr
        GetAttribute          : IntPtr
        CreateInstance        : IntPtr
        Remove                : IntPtr
        GetStorageFileName    : IntPtr
        RemoveStorageFileName : IntPtr
        IsUISupported         : IntPtr
        DisplayUI             : IntPtr
        MatchesAttributes     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpeechObjectToken.Vtbl()
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
        _ObjectId := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, _ObjectId, "HRESULT")
        return _ObjectId
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
        Description := BSTR.Owned()
        result := ComCall(10, this, "int", Locale, BSTR.Ptr, Description, "HRESULT")
        return Description
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

        result := ComCall(11, this, BSTR, Id, BSTR, CategoryID, VARIANT_BOOL, CreateIfNotExist, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} AttributeName 
     * @returns {BSTR} 
     */
    GetAttribute(AttributeName) {
        AttributeName := AttributeName is String ? BSTR.Alloc(AttributeName).Value : AttributeName

        AttributeValue := BSTR.Owned()
        result := ComCall(12, this, BSTR, AttributeName, BSTR.Ptr, AttributeValue, "HRESULT")
        return AttributeValue
    }

    /**
     * The CWbemGlueFactory class is part of the WMI Provider Framework. The Provider Framework implements methods of this interface internally to create new instances of classes for the provider.
     * @remarks
     * The destructor for the class is <b>CWbemGlueFactory::~CWbemGlueFactory.</b>
     * @param {IUnknown} pUnkOuter 
     * @param {SpeechTokenContext} ClsContext 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemglue/nl-wbemglue-cwbemgluefactory
     */
    CreateInstance(pUnkOuter, ClsContext) {
        result := ComCall(13, this, "ptr", pUnkOuter, SpeechTokenContext, ClsContext, "ptr*", &_Object := 0, "HRESULT")
        return IUnknown(_Object)
    }

    /**
     * 
     * @param {BSTR} ObjectStorageCLSID 
     * @returns {HRESULT} 
     */
    Remove(ObjectStorageCLSID) {
        ObjectStorageCLSID := ObjectStorageCLSID is String ? BSTR.Alloc(ObjectStorageCLSID).Value : ObjectStorageCLSID

        result := ComCall(14, this, BSTR, ObjectStorageCLSID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} ObjectStorageCLSID 
     * @param {BSTR} KeyName 
     * @param {BSTR} FileName 
     * @param {SpeechTokenShellFolder} _Folder 
     * @returns {BSTR} 
     */
    GetStorageFileName(ObjectStorageCLSID, KeyName, FileName, _Folder) {
        ObjectStorageCLSID := ObjectStorageCLSID is String ? BSTR.Alloc(ObjectStorageCLSID).Value : ObjectStorageCLSID
        KeyName := KeyName is String ? BSTR.Alloc(KeyName).Value : KeyName
        FileName := FileName is String ? BSTR.Alloc(FileName).Value : FileName

        FilePath := BSTR.Owned()
        result := ComCall(15, this, BSTR, ObjectStorageCLSID, BSTR, KeyName, BSTR, FileName, SpeechTokenShellFolder, _Folder, BSTR.Ptr, FilePath, "HRESULT")
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

        result := ComCall(16, this, BSTR, ObjectStorageCLSID, BSTR, KeyName, VARIANT_BOOL, DeleteFile, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} TypeOfUI 
     * @param {Pointer<VARIANT>} ExtraData 
     * @param {IUnknown} _Object 
     * @returns {VARIANT_BOOL} 
     */
    IsUISupported(TypeOfUI, ExtraData, _Object) {
        TypeOfUI := TypeOfUI is String ? BSTR.Alloc(TypeOfUI).Value : TypeOfUI

        result := ComCall(17, this, BSTR, TypeOfUI, VARIANT.Ptr, ExtraData, "ptr", _Object, VARIANT_BOOL.Ptr, &Supported := 0, "HRESULT")
        return Supported
    }

    /**
     * 
     * @param {Integer} _hWnd 
     * @param {BSTR} Title 
     * @param {BSTR} TypeOfUI 
     * @param {Pointer<VARIANT>} ExtraData 
     * @param {IUnknown} _Object 
     * @returns {HRESULT} 
     */
    DisplayUI(_hWnd, Title, TypeOfUI, ExtraData, _Object) {
        Title := Title is String ? BSTR.Alloc(Title).Value : Title
        TypeOfUI := TypeOfUI is String ? BSTR.Alloc(TypeOfUI).Value : TypeOfUI

        result := ComCall(18, this, "int", _hWnd, BSTR, Title, BSTR, TypeOfUI, VARIANT.Ptr, ExtraData, "ptr", _Object, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} Attributes 
     * @returns {VARIANT_BOOL} 
     */
    MatchesAttributes(Attributes) {
        Attributes := Attributes is String ? BSTR.Alloc(Attributes).Value : Attributes

        result := ComCall(19, this, BSTR, Attributes, VARIANT_BOOL.Ptr, &Matches := 0, "HRESULT")
        return Matches
    }

    Query(iid) {
        if (ISpeechObjectToken.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Id := CallbackCreate(GetMethod(implObj, "get_Id"), flags, 2)
        this.vtbl.get_DataKey := CallbackCreate(GetMethod(implObj, "get_DataKey"), flags, 2)
        this.vtbl.get_Category := CallbackCreate(GetMethod(implObj, "get_Category"), flags, 2)
        this.vtbl.GetDescription := CallbackCreate(GetMethod(implObj, "GetDescription"), flags, 3)
        this.vtbl.SetId := CallbackCreate(GetMethod(implObj, "SetId"), flags, 4)
        this.vtbl.GetAttribute := CallbackCreate(GetMethod(implObj, "GetAttribute"), flags, 3)
        this.vtbl.CreateInstance := CallbackCreate(GetMethod(implObj, "CreateInstance"), flags, 4)
        this.vtbl.Remove := CallbackCreate(GetMethod(implObj, "Remove"), flags, 2)
        this.vtbl.GetStorageFileName := CallbackCreate(GetMethod(implObj, "GetStorageFileName"), flags, 6)
        this.vtbl.RemoveStorageFileName := CallbackCreate(GetMethod(implObj, "RemoveStorageFileName"), flags, 4)
        this.vtbl.IsUISupported := CallbackCreate(GetMethod(implObj, "IsUISupported"), flags, 5)
        this.vtbl.DisplayUI := CallbackCreate(GetMethod(implObj, "DisplayUI"), flags, 6)
        this.vtbl.MatchesAttributes := CallbackCreate(GetMethod(implObj, "MatchesAttributes"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Id)
        CallbackFree(this.vtbl.get_DataKey)
        CallbackFree(this.vtbl.get_Category)
        CallbackFree(this.vtbl.GetDescription)
        CallbackFree(this.vtbl.SetId)
        CallbackFree(this.vtbl.GetAttribute)
        CallbackFree(this.vtbl.CreateInstance)
        CallbackFree(this.vtbl.Remove)
        CallbackFree(this.vtbl.GetStorageFileName)
        CallbackFree(this.vtbl.RemoveStorageFileName)
        CallbackFree(this.vtbl.IsUISupported)
        CallbackFree(this.vtbl.DisplayUI)
        CallbackFree(this.vtbl.MatchesAttributes)
    }
}
