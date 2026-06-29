#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IEnumCATEGORYINFO.ahk" { IEnumCATEGORYINFO }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IEnumGUID.ahk" { IEnumGUID }
#Import ".\IUnknown.ahk" { IUnknown }

/**
 * Obtains information about the categories implemented or required by a certain class, as well as information about the categories registered on the specified computer.
 * @see https://learn.microsoft.com/windows/win32/api/comcat/nn-comcat-icatinformation
 * @namespace Windows.Win32.System.Com
 */
export default struct ICatInformation extends IUnknown {
    /**
     * The interface identifier for ICatInformation
     * @type {Guid}
     */
    static IID := Guid("{0002e013-0000-0000-c000-000000000046}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICatInformation interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        EnumCategories            : IntPtr
        GetCategoryDesc           : IntPtr
        EnumClassesOfCategories   : IntPtr
        IsClassOfCategories       : IntPtr
        EnumImplCategoriesOfClass : IntPtr
        EnumReqCategoriesOfClass  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICatInformation.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves an enumerator for the component categories registered on the system.
     * @param {Integer} lcid The requested locale for any return szDescription of the enumerated categories. Typically, the caller specifies the value returned from the <a href="https://docs.microsoft.com/windows/desktop/api/winnls/nf-winnls-getuserdefaultlcid">GetUserDefaultLCID</a> function.
     * @returns {IEnumCATEGORYINFO} A pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/comcat/nn-comcat-ienumcategoryinfo">IEnumCATEGORYINFO</a> interface. This can be used to enumerate the CATIDs and localized description strings of the component categories registered with the system.
     * @see https://learn.microsoft.com/windows/win32/api/comcat/nf-comcat-icatinformation-enumcategories
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
     * @see https://learn.microsoft.com/windows/win32/api/comcat/nf-comcat-icatinformation-getcategorydesc
     */
    GetCategoryDesc(rcatid, lcid) {
        result := ComCall(4, this, Guid.Ptr, rcatid, "uint", lcid, PWSTR.Ptr, &pszDesc := 0, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/comcat/nf-comcat-icatinformation-enumclassesofcategories
     */
    EnumClassesOfCategories(cImplemented, rgcatidImpl, cRequired, rgcatidReq) {
        result := ComCall(5, this, "uint", cImplemented, Guid.Ptr, rgcatidImpl, "uint", cRequired, Guid.Ptr, rgcatidReq, "ptr*", &ppenumClsid := 0, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/comcat/nf-comcat-icatinformation-isclassofcategories
     */
    IsClassOfCategories(rclsid, cImplemented, rgcatidImpl, cRequired, rgcatidReq) {
        result := ComCall(6, this, Guid.Ptr, rclsid, "uint", cImplemented, Guid.Ptr, rgcatidImpl, "uint", cRequired, Guid.Ptr, rgcatidReq, "HRESULT")
        return result
    }

    /**
     * Retrieves an enumerator for the CATIDs implemented by the specified class.
     * @param {Pointer<Guid>} rclsid The class ID.
     * @returns {IEnumGUID} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/comcat/nn-comcat-ienumguid">IEnumCATID</a> interface pointer. This can be used to enumerate the CATIDs that are implemented by <i>rclsid</i>.
     * @see https://learn.microsoft.com/windows/win32/api/comcat/nf-comcat-icatinformation-enumimplcategoriesofclass
     */
    EnumImplCategoriesOfClass(rclsid) {
        result := ComCall(7, this, Guid.Ptr, rclsid, "ptr*", &ppenumCatid := 0, "HRESULT")
        return IEnumGUID(ppenumCatid)
    }

    /**
     * Retrieves an enumerator for the CATIDs required by the specified class.
     * @param {Pointer<Guid>} rclsid The class identifier.
     * @returns {IEnumGUID} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/comcat/nn-comcat-ienumguid">IEnumCATID</a> interface pointer. This can be used to enumerate the CATIDs that are required by <i>rclsid</i>.
     * @see https://learn.microsoft.com/windows/win32/api/comcat/nf-comcat-icatinformation-enumreqcategoriesofclass
     */
    EnumReqCategoriesOfClass(rclsid) {
        result := ComCall(8, this, Guid.Ptr, rclsid, "ptr*", &ppenumCatid := 0, "HRESULT")
        return IEnumGUID(ppenumCatid)
    }

    Query(iid) {
        if (ICatInformation.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EnumCategories := CallbackCreate(GetMethod(implObj, "EnumCategories"), flags, 3)
        this.vtbl.GetCategoryDesc := CallbackCreate(GetMethod(implObj, "GetCategoryDesc"), flags, 4)
        this.vtbl.EnumClassesOfCategories := CallbackCreate(GetMethod(implObj, "EnumClassesOfCategories"), flags, 6)
        this.vtbl.IsClassOfCategories := CallbackCreate(GetMethod(implObj, "IsClassOfCategories"), flags, 6)
        this.vtbl.EnumImplCategoriesOfClass := CallbackCreate(GetMethod(implObj, "EnumImplCategoriesOfClass"), flags, 3)
        this.vtbl.EnumReqCategoriesOfClass := CallbackCreate(GetMethod(implObj, "EnumReqCategoriesOfClass"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EnumCategories)
        CallbackFree(this.vtbl.GetCategoryDesc)
        CallbackFree(this.vtbl.EnumClassesOfCategories)
        CallbackFree(this.vtbl.IsClassOfCategories)
        CallbackFree(this.vtbl.EnumImplCategoriesOfClass)
        CallbackFree(this.vtbl.EnumReqCategoriesOfClass)
    }
}
