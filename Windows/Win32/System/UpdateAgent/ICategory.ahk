#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ICategoryCollection.ahk
#Include .\IImageInformation.ahk
#Include .\ICategory.ahk
#Include .\IUpdateCollection.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Represents the category to which an update belongs.
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-icategory
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class ICategory extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICategory
     * @type {Guid}
     */
    static IID => Guid("{81ddc1b8-9d35-47a6-b471-5b80f519223b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "get_CategoryID", "get_Children", "get_Description", "get_Image", "get_Order", "get_Parent", "get_Type", "get_Updates"]

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
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdate-get_categories">Categories</a> property exists for the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdate">IUpdate</a> interface. And, a <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatehistoryentry2-get_categories">Categories</a> property exists for the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatehistoryentry2">IUpdateHistoryEntry2</a> interface. Therefore, the information that is used by the localized properties of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-icategory">ICategory</a> interface depends on the Windows Update Agent (WUA) object that owns the <b>ICategory</b> interface.
     * 
     *  If the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-icategory">ICategory</a> interface is returned from the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdate-get_categories">Categories</a> property of <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdate">IUpdate</a>, the <b>ICategory</b> interface follows the localization rules of the <b>IUpdate</b> interface. In this case, if the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesearcher">IUpdateSearcher</a> interface  is created by using the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession-createupdatesearcher">IUpdateSession::CreateUpdateSearcher</a> method, the information  that   this property returns is for the language that is specified by the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession2-get_userlocale">UserLocale</a> property of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesession2">IUpdateSession2</a> interface of the session that is used to create <b>IUpdateSearcher</b>.
     * 
     * If a language preference is not specified by the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession2-get_userlocale">UserLocale</a> property of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesession2">IUpdateSession2</a> interface, or if the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesearcher">IUpdateSearcher</a> interface is not  created by using the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession-createupdatesearcher">IUpdateSession::CreateUpdateSearcher</a> method, the information  that   this property returns is for the default user interface (UI) language of the user. If the default UI language of the user is unavailable, WUA uses the default UI language of the computer.   If the default language of the computer is unavailable, WUA uses the language  that the provider of the  update recommends.
     * 
     * If the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-icategory">ICategory</a> interface is returned from the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatehistoryentry2-get_categories">Categories</a> property of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatehistoryentry2">IUpdateHistoryEntry2</a> interface, the <b>ICategory</b> interface follows the localization rules of the <b>IUpdateHistoryEntry2</b> interface. The information  that   this property returns is for the default UI language of the user. If the default UI language of the user is unavailable, WUA uses the default UI language of the computer.   If the default language of the computer is unavailable, WUA uses the language  that the provider of the  update recommends.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-icategory-get_name
     */
    get_Name() {
        retval := BSTR()
        result := ComCall(7, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * Gets the identifier of the category.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-icategory-get_categoryid
     */
    get_CategoryID() {
        retval := BSTR()
        result := ComCall(8, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * Gets an interface collection that contains the child categories of this category.
     * @returns {ICategoryCollection} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-icategory-get_children
     */
    get_Children() {
        result := ComCall(9, this, "ptr*", &retval := 0, "HRESULT")
        return ICategoryCollection(retval)
    }

    /**
     * Gets the description of the category.
     * @remarks
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdate-get_categories">Categories</a> property exists for the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdate">IUpdate</a> interface. And, a <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatehistoryentry2-get_categories">Categories</a> property exists for the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatehistoryentry2">IUpdateHistoryEntry2</a> interface. Therefore, the information that is used by the localized properties of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-icategory">ICategory</a> interface depends on the Windows Update Agent (WUA) object that owns the <b>ICategory</b> interface.
     * 
     *  If the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-icategory">ICategory</a> interface is returned from the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdate-get_categories">Categories</a> property of <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdate">IUpdate</a>, the <b>ICategory</b> interface follows the localization rules of the <b>IUpdate</b> interface. In this case, if the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesearcher">IUpdateSearcher</a> interface  is created by using the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession-createupdatesearcher">IUpdateSession::CreateUpdateSearcher</a> method, the information  that   this property returns is for the language that is specified by the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession2-get_userlocale">UserLocale</a> property of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesession2">IUpdateSession2</a> interface of the session that is used to create <b>IUpdateSearcher</b>.
     * 
     * If a language preference is not specified by the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession2-get_userlocale">UserLocale</a> property of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesession2">IUpdateSession2</a> interface, or if the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesearcher">IUpdateSearcher</a> interface is not  created by using the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession-createupdatesearcher">IUpdateSession::CreateUpdateSearcher</a> method, the information  that   this property returns is for the default user interface (UI) language of the user. If the default UI language of the user is unavailable, WUA uses the default UI language of the computer.   If the default language of the computer is unavailable, WUA uses the language  that the provider of the  update recommends.
     * 
     * If the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-icategory">ICategory</a> interface is returned from the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatehistoryentry2-get_categories">Categories</a> property of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatehistoryentry2">IUpdateHistoryEntry2</a> interface, the <b>ICategory</b> interface follows the localization rules of the <b>IUpdateHistoryEntry2</b> interface. The information  that   this property returns is for the default UI language of the user. If the default UI language of the user is unavailable, WUA uses the default UI language of the computer.   If the default language of the computer is unavailable, WUA uses the language  that the provider of the  update recommends.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-icategory-get_description
     */
    get_Description() {
        retval := BSTR()
        result := ComCall(10, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * Gets an interface that contains information about the image that is associated with the category.
     * @remarks
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdate-get_categories">Categories</a> property exists for the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdate">IUpdate</a> interface. And, a <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatehistoryentry2-get_categories">Categories</a> property exists for the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatehistoryentry2">IUpdateHistoryEntry2</a> interface. Therefore, the information that is used by the localized properties of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-icategory">ICategory</a> interface depends on the Windows Update Agent (WUA) object that owns the <b>ICategory</b> interface.
     * 
     *  If the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-icategory">ICategory</a> interface is returned from the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdate-get_categories">Categories</a> property of <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdate">IUpdate</a>, the <b>ICategory</b> interface follows the localization rules of the <b>IUpdate</b> interface. In this case, if the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesearcher">IUpdateSearcher</a> interface  is created by using the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession-createupdatesearcher">IUpdateSession::CreateUpdateSearcher</a> method, the information  that   this property returns is for the language that is specified by the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession2-get_userlocale">UserLocale</a> property of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesession2">IUpdateSession2</a> interface of the session that is used to create <b>IUpdateSearcher</b>.
     * 
     * If a language preference is not specified by the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession2-get_userlocale">UserLocale</a> property of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesession2">IUpdateSession2</a> interface, or if the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesearcher">IUpdateSearcher</a> interface is not  created by using the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession-createupdatesearcher">IUpdateSession::CreateUpdateSearcher</a> method, the information  that   this property returns is for the default user interface (UI) language of the user. If the default UI language of the user is unavailable, WUA uses the default UI language of the computer.   If the default language of the computer is unavailable, WUA uses the language  that the provider of the  update recommends.
     * 
     * If the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-icategory">ICategory</a> interface is returned from the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatehistoryentry2-get_categories">Categories</a> property of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatehistoryentry2">IUpdateHistoryEntry2</a> interface, the <b>ICategory</b> interface follows the localization rules of the <b>IUpdateHistoryEntry2</b> interface. The information  that   this property returns is for the default UI language of the user. If the default UI language of the user is unavailable, WUA uses the default UI language of the computer.   If the default language of the computer is unavailable, WUA uses the language  that the provider of the  update recommends.
     * 
     * 
     * @returns {IImageInformation} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-icategory-get_image
     */
    get_Image() {
        result := ComCall(11, this, "ptr*", &retval := 0, "HRESULT")
        return IImageInformation(retval)
    }

    /**
     * Gets the recommended display order of this category among its sibling categories.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-icategory-get_order
     */
    get_Order() {
        result := ComCall(12, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets an interface that describes the parent category of this category.
     * @returns {ICategory} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-icategory-get_parent
     */
    get_Parent() {
        result := ComCall(13, this, "ptr*", &retval := 0, "HRESULT")
        return ICategory(retval)
    }

    /**
     * Gets the type of the category.
     * @remarks
     * 
     * The following list identifies the possible category types:
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-icategory-get_type
     */
    get_Type() {
        retval := BSTR()
        result := ComCall(14, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * Gets an interface that contains a collection of updates that immediately belong to the category.
     * @remarks
     * 
     * The returned updates are applicable to the computer. They may or may not be installed on that computer.
     * 
     * 
     * @returns {IUpdateCollection} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-icategory-get_updates
     */
    get_Updates() {
        result := ComCall(15, this, "ptr*", &retval := 0, "HRESULT")
        return IUpdateCollection(retval)
    }
}
