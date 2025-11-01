#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Obtains information about the categories implemented or required by a certain class, as well as information about the categories registered on the specified computer.
 * @see https://docs.microsoft.com/windows/win32/api//comcat/nn-comcat-icatinformation
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class ICatInformation extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICatInformation
     * @type {Guid}
     */
    static IID => Guid("{0002e013-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnumCategories", "GetCategoryDesc", "EnumClassesOfCategories", "IsClassOfCategories", "EnumImplCategoriesOfClass", "EnumReqCategoriesOfClass"]

    /**
     * 
     * @param {Integer} lcid 
     * @param {Pointer<IEnumCATEGORYINFO>} ppenumCategoryInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comcat/nf-comcat-icatinformation-enumcategories
     */
    EnumCategories(lcid, ppenumCategoryInfo) {
        result := ComCall(3, this, "uint", lcid, "ptr*", ppenumCategoryInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rcatid 
     * @param {Integer} lcid 
     * @param {Pointer<PWSTR>} pszDesc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comcat/nf-comcat-icatinformation-getcategorydesc
     */
    GetCategoryDesc(rcatid, lcid, pszDesc) {
        result := ComCall(4, this, "ptr", rcatid, "uint", lcid, "ptr", pszDesc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cImplemented 
     * @param {Pointer<Guid>} rgcatidImpl 
     * @param {Integer} cRequired 
     * @param {Pointer<Guid>} rgcatidReq 
     * @param {Pointer<IEnumGUID>} ppenumClsid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comcat/nf-comcat-icatinformation-enumclassesofcategories
     */
    EnumClassesOfCategories(cImplemented, rgcatidImpl, cRequired, rgcatidReq, ppenumClsid) {
        result := ComCall(5, this, "uint", cImplemented, "ptr", rgcatidImpl, "uint", cRequired, "ptr", rgcatidReq, "ptr*", ppenumClsid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {Integer} cImplemented 
     * @param {Pointer<Guid>} rgcatidImpl 
     * @param {Integer} cRequired 
     * @param {Pointer<Guid>} rgcatidReq 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comcat/nf-comcat-icatinformation-isclassofcategories
     */
    IsClassOfCategories(rclsid, cImplemented, rgcatidImpl, cRequired, rgcatidReq) {
        result := ComCall(6, this, "ptr", rclsid, "uint", cImplemented, "ptr", rgcatidImpl, "uint", cRequired, "ptr", rgcatidReq, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {Pointer<IEnumGUID>} ppenumCatid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comcat/nf-comcat-icatinformation-enumimplcategoriesofclass
     */
    EnumImplCategoriesOfClass(rclsid, ppenumCatid) {
        result := ComCall(7, this, "ptr", rclsid, "ptr*", ppenumCatid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {Pointer<IEnumGUID>} ppenumCatid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comcat/nf-comcat-icatinformation-enumreqcategoriesofclass
     */
    EnumReqCategoriesOfClass(rclsid, ppenumCatid) {
        result := ComCall(8, this, "ptr", rclsid, "ptr*", ppenumCatid, "HRESULT")
        return result
    }
}
