#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import ".\IImageInformation.ahk" { IImageInformation }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUpdateCollection.ahk" { IUpdateCollection }
#Import ".\ICategoryCollection.ahk" { ICategoryCollection }

/**
 * Represents the category to which an update belongs.
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/nn-wuapi-icategory
 * @namespace Windows.Win32.System.UpdateAgent
 */
export default struct ICategory extends IDispatch {
    /**
     * The interface identifier for ICategory
     * @type {Guid}
     */
    static IID := Guid("{81ddc1b8-9d35-47a6-b471-5b80f519223b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICategory interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Name        : IntPtr
        get_CategoryID  : IntPtr
        get_Children    : IntPtr
        get_Description : IntPtr
        get_Image       : IntPtr
        get_Order       : IntPtr
        get_Parent      : IntPtr
        get_Type        : IntPtr
        get_Updates     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICategory.Vtbl()
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
    CategoryID {
        get => this.get_CategoryID()
    }

    /**
     * @type {ICategoryCollection} 
     */
    Children {
        get => this.get_Children()
    }

    /**
     * @type {BSTR} 
     */
    Description {
        get => this.get_Description()
    }

    /**
     * @type {IImageInformation} 
     */
    Image {
        get => this.get_Image()
    }

    /**
     * @type {Integer} 
     */
    Order {
        get => this.get_Order()
    }

    /**
     * @type {ICategory} 
     */
    Parent {
        get => this.get_Parent()
    }

    /**
     * @type {BSTR} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * @type {IUpdateCollection} 
     */
    Updates {
        get => this.get_Updates()
    }

    /**
     * Gets the localized name of the category.
     * @remarks
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdate-get_categories">Categories</a> property exists for the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdate">IUpdate</a> interface. And, a <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatehistoryentry2-get_categories">Categories</a> property exists for the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatehistoryentry2">IUpdateHistoryEntry2</a> interface. Therefore, the information that is used by the localized properties of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-icategory">ICategory</a> interface depends on the Windows Update Agent (WUA) object that owns the <b>ICategory</b> interface.
     * 
     *  If the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-icategory">ICategory</a> interface is returned from the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdate-get_categories">Categories</a> property of <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdate">IUpdate</a>, the <b>ICategory</b> interface follows the localization rules of the <b>IUpdate</b> interface. In this case, if the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesearcher">IUpdateSearcher</a> interface  is created by using the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession-createupdatesearcher">IUpdateSession::CreateUpdateSearcher</a> method, the information  that   this property returns is for the language that is specified by the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession2-get_userlocale">UserLocale</a> property of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesession2">IUpdateSession2</a> interface of the session that is used to create <b>IUpdateSearcher</b>.
     * 
     * If a language preference is not specified by the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession2-get_userlocale">UserLocale</a> property of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesession2">IUpdateSession2</a> interface, or if the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesearcher">IUpdateSearcher</a> interface is not  created by using the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession-createupdatesearcher">IUpdateSession::CreateUpdateSearcher</a> method, the information  that   this property returns is for the default user interface (UI) language of the user. If the default UI language of the user is unavailable, WUA uses the default UI language of the computer.   If the default language of the computer is unavailable, WUA uses the language  that the provider of the  update recommends.
     * 
     * If the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-icategory">ICategory</a> interface is returned from the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatehistoryentry2-get_categories">Categories</a> property of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatehistoryentry2">IUpdateHistoryEntry2</a> interface, the <b>ICategory</b> interface follows the localization rules of the <b>IUpdateHistoryEntry2</b> interface. The information  that   this property returns is for the default UI language of the user. If the default UI language of the user is unavailable, WUA uses the default UI language of the computer.   If the default language of the computer is unavailable, WUA uses the language  that the provider of the  update recommends.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-icategory-get_name
     */
    get_Name() {
        retval := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * Gets the identifier of the category.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-icategory-get_categoryid
     */
    get_CategoryID() {
        retval := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * Gets an interface collection that contains the child categories of this category.
     * @returns {ICategoryCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-icategory-get_children
     */
    get_Children() {
        result := ComCall(9, this, "ptr*", &retval := 0, "HRESULT")
        return ICategoryCollection(retval)
    }

    /**
     * Gets the description of the category.
     * @remarks
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdate-get_categories">Categories</a> property exists for the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdate">IUpdate</a> interface. And, a <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatehistoryentry2-get_categories">Categories</a> property exists for the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatehistoryentry2">IUpdateHistoryEntry2</a> interface. Therefore, the information that is used by the localized properties of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-icategory">ICategory</a> interface depends on the Windows Update Agent (WUA) object that owns the <b>ICategory</b> interface.
     * 
     *  If the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-icategory">ICategory</a> interface is returned from the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdate-get_categories">Categories</a> property of <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdate">IUpdate</a>, the <b>ICategory</b> interface follows the localization rules of the <b>IUpdate</b> interface. In this case, if the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesearcher">IUpdateSearcher</a> interface  is created by using the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession-createupdatesearcher">IUpdateSession::CreateUpdateSearcher</a> method, the information  that   this property returns is for the language that is specified by the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession2-get_userlocale">UserLocale</a> property of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesession2">IUpdateSession2</a> interface of the session that is used to create <b>IUpdateSearcher</b>.
     * 
     * If a language preference is not specified by the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession2-get_userlocale">UserLocale</a> property of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesession2">IUpdateSession2</a> interface, or if the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesearcher">IUpdateSearcher</a> interface is not  created by using the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession-createupdatesearcher">IUpdateSession::CreateUpdateSearcher</a> method, the information  that   this property returns is for the default user interface (UI) language of the user. If the default UI language of the user is unavailable, WUA uses the default UI language of the computer.   If the default language of the computer is unavailable, WUA uses the language  that the provider of the  update recommends.
     * 
     * If the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-icategory">ICategory</a> interface is returned from the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatehistoryentry2-get_categories">Categories</a> property of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatehistoryentry2">IUpdateHistoryEntry2</a> interface, the <b>ICategory</b> interface follows the localization rules of the <b>IUpdateHistoryEntry2</b> interface. The information  that   this property returns is for the default UI language of the user. If the default UI language of the user is unavailable, WUA uses the default UI language of the computer.   If the default language of the computer is unavailable, WUA uses the language  that the provider of the  update recommends.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-icategory-get_description
     */
    get_Description() {
        retval := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * Gets an interface that contains information about the image that is associated with the category.
     * @remarks
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdate-get_categories">Categories</a> property exists for the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdate">IUpdate</a> interface. And, a <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatehistoryentry2-get_categories">Categories</a> property exists for the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatehistoryentry2">IUpdateHistoryEntry2</a> interface. Therefore, the information that is used by the localized properties of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-icategory">ICategory</a> interface depends on the Windows Update Agent (WUA) object that owns the <b>ICategory</b> interface.
     * 
     *  If the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-icategory">ICategory</a> interface is returned from the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdate-get_categories">Categories</a> property of <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdate">IUpdate</a>, the <b>ICategory</b> interface follows the localization rules of the <b>IUpdate</b> interface. In this case, if the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesearcher">IUpdateSearcher</a> interface  is created by using the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession-createupdatesearcher">IUpdateSession::CreateUpdateSearcher</a> method, the information  that   this property returns is for the language that is specified by the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession2-get_userlocale">UserLocale</a> property of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesession2">IUpdateSession2</a> interface of the session that is used to create <b>IUpdateSearcher</b>.
     * 
     * If a language preference is not specified by the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession2-get_userlocale">UserLocale</a> property of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesession2">IUpdateSession2</a> interface, or if the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesearcher">IUpdateSearcher</a> interface is not  created by using the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession-createupdatesearcher">IUpdateSession::CreateUpdateSearcher</a> method, the information  that   this property returns is for the default user interface (UI) language of the user. If the default UI language of the user is unavailable, WUA uses the default UI language of the computer.   If the default language of the computer is unavailable, WUA uses the language  that the provider of the  update recommends.
     * 
     * If the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-icategory">ICategory</a> interface is returned from the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatehistoryentry2-get_categories">Categories</a> property of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatehistoryentry2">IUpdateHistoryEntry2</a> interface, the <b>ICategory</b> interface follows the localization rules of the <b>IUpdateHistoryEntry2</b> interface. The information  that   this property returns is for the default UI language of the user. If the default UI language of the user is unavailable, WUA uses the default UI language of the computer.   If the default language of the computer is unavailable, WUA uses the language  that the provider of the  update recommends.
     * @returns {IImageInformation} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-icategory-get_image
     */
    get_Image() {
        result := ComCall(11, this, "ptr*", &retval := 0, "HRESULT")
        return IImageInformation(retval)
    }

    /**
     * Gets the recommended display order of this category among its sibling categories.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-icategory-get_order
     */
    get_Order() {
        result := ComCall(12, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets an interface that describes the parent category of this category.
     * @returns {ICategory} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-icategory-get_parent
     */
    get_Parent() {
        result := ComCall(13, this, "ptr*", &retval := 0, "HRESULT")
        return ICategory(retval)
    }

    /**
     * Gets the type of the category.
     * @remarks
     * The following list identifies the possible category types:
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-icategory-get_type
     */
    get_Type() {
        retval := BSTR.Owned()
        result := ComCall(14, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * Gets an interface that contains a collection of updates that immediately belong to the category.
     * @remarks
     * The returned updates are applicable to the computer. They may or may not be installed on that computer.
     * @returns {IUpdateCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-icategory-get_updates
     */
    get_Updates() {
        result := ComCall(15, this, "ptr*", &retval := 0, "HRESULT")
        return IUpdateCollection(retval)
    }

    Query(iid) {
        if (ICategory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.get_CategoryID := CallbackCreate(GetMethod(implObj, "get_CategoryID"), flags, 2)
        this.vtbl.get_Children := CallbackCreate(GetMethod(implObj, "get_Children"), flags, 2)
        this.vtbl.get_Description := CallbackCreate(GetMethod(implObj, "get_Description"), flags, 2)
        this.vtbl.get_Image := CallbackCreate(GetMethod(implObj, "get_Image"), flags, 2)
        this.vtbl.get_Order := CallbackCreate(GetMethod(implObj, "get_Order"), flags, 2)
        this.vtbl.get_Parent := CallbackCreate(GetMethod(implObj, "get_Parent"), flags, 2)
        this.vtbl.get_Type := CallbackCreate(GetMethod(implObj, "get_Type"), flags, 2)
        this.vtbl.get_Updates := CallbackCreate(GetMethod(implObj, "get_Updates"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.get_CategoryID)
        CallbackFree(this.vtbl.get_Children)
        CallbackFree(this.vtbl.get_Description)
        CallbackFree(this.vtbl.get_Image)
        CallbackFree(this.vtbl.get_Order)
        CallbackFree(this.vtbl.get_Parent)
        CallbackFree(this.vtbl.get_Type)
        CallbackFree(this.vtbl.get_Updates)
    }
}
