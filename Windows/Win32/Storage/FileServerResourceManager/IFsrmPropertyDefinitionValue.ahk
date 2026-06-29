#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Contains properties that describe a classification property definition value.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nn-fsrmpipeline-ifsrmpropertydefinitionvalue
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
export default struct IFsrmPropertyDefinitionValue extends IDispatch {
    /**
     * The interface identifier for IFsrmPropertyDefinitionValue
     * @type {Guid}
     */
    static IID := Guid("{e946d148-bd67-4178-8e22-1c44925ed710}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFsrmPropertyDefinitionValue interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Name        : IntPtr
        get_DisplayName : IntPtr
        get_Description : IntPtr
        get_UniqueID    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFsrmPropertyDefinitionValue.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {BSTR} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * @type {BSTR} 
     */
    Description {
        get => this.get_Description()
    }

    /**
     * @type {BSTR} 
     */
    UniqueID {
        get => this.get_UniqueID()
    }

    /**
     * Name of the classification property definition value.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertydefinitionvalue-get_name
     */
    get_Name() {
        name := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, name, "HRESULT")
        return name
    }

    /**
     * Display name of the classification property definition value.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertydefinitionvalue-get_displayname
     */
    get_DisplayName() {
        displayName := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, displayName, "HRESULT")
        return displayName
    }

    /**
     * Description of the classification property definition value.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertydefinitionvalue-get_description
     */
    get_Description() {
        description := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, description, "HRESULT")
        return description
    }

    /**
     * Unique ID of the classification property definition value.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertydefinitionvalue-get_uniqueid
     */
    get_UniqueID() {
        uniqueID := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, uniqueID, "HRESULT")
        return uniqueID
    }

    Query(iid) {
        if (IFsrmPropertyDefinitionValue.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.get_DisplayName := CallbackCreate(GetMethod(implObj, "get_DisplayName"), flags, 2)
        this.vtbl.get_Description := CallbackCreate(GetMethod(implObj, "get_Description"), flags, 2)
        this.vtbl.get_UniqueID := CallbackCreate(GetMethod(implObj, "get_UniqueID"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.get_DisplayName)
        CallbackFree(this.vtbl.get_Description)
        CallbackFree(this.vtbl.get_UniqueID)
    }
}
