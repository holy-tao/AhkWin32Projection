#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumCATEGORYINFO.ahk
#Include .\IEnumGUID.ahk
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
     * Retrieves an enumerator for the component categories registered on the system.
     * @param {Integer} lcid The requested locale for any return szDescription of the enumerated categories. Typically, the caller specifies the value returned from the <a href="https://docs.microsoft.com/windows/desktop/api/winnls/nf-winnls-getuserdefaultlcid">GetUserDefaultLCID</a> function.
     * @returns {IEnumCATEGORYINFO} A pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/comcat/nn-comcat-ienumcategoryinfo">IEnumCATEGORYINFO</a> interface. This can be used to enumerate the CATIDs and localized description strings of the component categories registered with the system.
     * @see https://docs.microsoft.com/windows/win32/api//comcat/nf-comcat-icatinformation-enumcategories
     */
    EnumCategories(lcid) {
        result := ComCall(3, this, "uint", lcid, "ptr*", &ppenumCategoryInfo := 0, "HRESULT")
        return IEnumCATEGORYINFO(ppenumCategoryInfo)
    }

    /**
     * Retrieves the localized description string for a specific category ID.
     * @param {Pointer<Guid>} rcatid The category identifier.
     * @param {Integer} lcid The locale.
     * @returns {PWSTR} A pointer to the string pointer for the description. This string must be released by the caller using the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//comcat/nf-comcat-icatinformation-getcategorydesc
     */
    GetCategoryDesc(rcatid, lcid) {
        result := ComCall(4, this, "ptr", rcatid, "uint", lcid, "ptr*", &pszDesc := 0, "HRESULT")
        return pszDesc
    }

    /**
     * Retrieves an enumerator for the classes that implement one or more specified category identifiers.
     * @param {Integer} cImplemented The number of category IDs in the <i>rgcatidImpl</i> array. This value cannot be zero. If this value is -1, classes are included in the enumeration, regardless of the categories they implement.
     * @param {Pointer<Guid>} rgcatidImpl An array of category identifiers.
     * 
     * If a class requires a category identifier that is not specified, it is not included in the enumeration.
     * @param {Integer} cRequired The number of category IDs in the <i>rgcatidReq</i> array. This value can be zero. If this value is -1, classes are included in the enumeration, regardless of the categories they require.
     * @param {Pointer<Guid>} rgcatidReq An array of category identifiers.
     * @returns {IEnumGUID} A pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd542667(v=vs.85)">IEnumCLSID</a> interface pointer that can be used to enumerate the CLSIDs of the classes that implement the specified category.
     * @see https://docs.microsoft.com/windows/win32/api//comcat/nf-comcat-icatinformation-enumclassesofcategories
     */
    EnumClassesOfCategories(cImplemented, rgcatidImpl, cRequired, rgcatidReq) {
        result := ComCall(5, this, "uint", cImplemented, "ptr", rgcatidImpl, "uint", cRequired, "ptr", rgcatidReq, "ptr*", &ppenumClsid := 0, "HRESULT")
        return IEnumGUID(ppenumClsid)
    }

    /**
     * Determines whether a class implements one or more categories.
     * @param {Pointer<Guid>} rclsid The class identifier.
     * @param {Integer} cImplemented The number of category IDs in the <i>rgcatidImpl</i> array. This value cannot be zero. If this value is -1, the implemented categories are not tested.
     * @param {Pointer<Guid>} rgcatidImpl An array of category identifiers.
     * 
     * If the class requires a category not listed in <i>rgcatidReq</i>, it is not included in the enumeration.
     * @param {Integer} cRequired The number of category IDs in the <i>rgcatidReq</i> array. This value can be zero. If this value is -1, the required categories are not tested.
     * @param {Pointer<Guid>} rgcatidReq An array of category identifiers.
     * @returns {HRESULT} If the class ID is of one of the specified categories, the return value is S_OK. Otherwise, is it S_FALSE.
     * @see https://docs.microsoft.com/windows/win32/api//comcat/nf-comcat-icatinformation-isclassofcategories
     */
    IsClassOfCategories(rclsid, cImplemented, rgcatidImpl, cRequired, rgcatidReq) {
        result := ComCall(6, this, "ptr", rclsid, "uint", cImplemented, "ptr", rgcatidImpl, "uint", cRequired, "ptr", rgcatidReq, "HRESULT")
        return result
    }

    /**
     * Retrieves an enumerator for the CATIDs implemented by the specified class.
     * @param {Pointer<Guid>} rclsid The class ID.
     * @returns {IEnumGUID} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/comcat/nn-comcat-ienumguid">IEnumCATID</a> interface pointer. This can be used to enumerate the CATIDs that are implemented by <i>rclsid</i>.
     * @see https://docs.microsoft.com/windows/win32/api//comcat/nf-comcat-icatinformation-enumimplcategoriesofclass
     */
    EnumImplCategoriesOfClass(rclsid) {
        result := ComCall(7, this, "ptr", rclsid, "ptr*", &ppenumCatid := 0, "HRESULT")
        return IEnumGUID(ppenumCatid)
    }

    /**
     * Retrieves an enumerator for the CATIDs required by the specified class.
     * @param {Pointer<Guid>} rclsid The class identifier.
     * @returns {IEnumGUID} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/comcat/nn-comcat-ienumguid">IEnumCATID</a> interface pointer. This can be used to enumerate the CATIDs that are required by <i>rclsid</i>.
     * @see https://docs.microsoft.com/windows/win32/api//comcat/nf-comcat-icatinformation-enumreqcategoriesofclass
     */
    EnumReqCategoriesOfClass(rclsid) {
        result := ComCall(8, this, "ptr", rclsid, "ptr*", &ppenumCatid := 0, "HRESULT")
        return IEnumGUID(ppenumCatid)
    }
}
