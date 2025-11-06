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
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-icategory-get_name
     */
    get_Name() {
        retval := BSTR()
        result := ComCall(7, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-icategory-get_categoryid
     */
    get_CategoryID() {
        retval := BSTR()
        result := ComCall(8, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {ICategoryCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-icategory-get_children
     */
    get_Children() {
        result := ComCall(9, this, "ptr*", &retval := 0, "HRESULT")
        return ICategoryCollection(retval)
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-icategory-get_description
     */
    get_Description() {
        retval := BSTR()
        result := ComCall(10, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {IImageInformation} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-icategory-get_image
     */
    get_Image() {
        result := ComCall(11, this, "ptr*", &retval := 0, "HRESULT")
        return IImageInformation(retval)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-icategory-get_order
     */
    get_Order() {
        result := ComCall(12, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {ICategory} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-icategory-get_parent
     */
    get_Parent() {
        result := ComCall(13, this, "ptr*", &retval := 0, "HRESULT")
        return ICategory(retval)
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-icategory-get_type
     */
    get_Type() {
        retval := BSTR()
        result := ComCall(14, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {IUpdateCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-icategory-get_updates
     */
    get_Updates() {
        result := ComCall(15, this, "ptr*", &retval := 0, "HRESULT")
        return IUpdateCollection(retval)
    }
}
