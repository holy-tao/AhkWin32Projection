#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\Guid.ahk" { Guid }
#Import "..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Foundation\BOOL.ahk" { BOOL }
#Import "..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Gaming
 */
export default struct IGameStatistics extends IUnknown {
    /**
     * The interface identifier for IGameStatistics
     * @type {Guid}
     */
    static IID := Guid("{3887c9ca-04a0-42ae-bc4c-5fa6c7721145}")

    /**
     * The class identifier for GameStatistics
     * @type {Guid}
     */
    static CLSID := Guid("{dbc85a2c-c0dc-4961-b6e2-d28b62c11ad4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IGameStatistics interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetMaxCategoryLength   : IntPtr
        GetMaxNameLength       : IntPtr
        GetMaxValueLength      : IntPtr
        GetMaxCategories       : IntPtr
        GetMaxStatsPerCategory : IntPtr
        SetCategoryTitle       : IntPtr
        GetCategoryTitle       : IntPtr
        GetStatistic           : IntPtr
        SetStatistic           : IntPtr
        Save                   : IntPtr
        SetLastPlayedCategory  : IntPtr
        GetLastPlayedCategory  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IGameStatistics.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetMaxCategoryLength() {
        result := ComCall(3, this, "uint*", &cch := 0, "HRESULT")
        return cch
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetMaxNameLength() {
        result := ComCall(4, this, "uint*", &cch := 0, "HRESULT")
        return cch
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetMaxValueLength() {
        result := ComCall(5, this, "uint*", &cch := 0, "HRESULT")
        return cch
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetMaxCategories() {
        result := ComCall(6, this, "ushort*", &pMax := 0, "HRESULT")
        return pMax
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetMaxStatsPerCategory() {
        result := ComCall(7, this, "ushort*", &pMax := 0, "HRESULT")
        return pMax
    }

    /**
     * 
     * @param {Integer} categoryIndex 
     * @param {PWSTR} title 
     * @returns {HRESULT} 
     */
    SetCategoryTitle(categoryIndex, title) {
        title := title is String ? StrPtr(title) : title

        result := ComCall(8, this, "ushort", categoryIndex, "ptr", title, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} categoryIndex 
     * @returns {PWSTR} 
     */
    GetCategoryTitle(categoryIndex) {
        result := ComCall(9, this, "ushort", categoryIndex, PWSTR.Ptr, &pTitle := 0, "HRESULT")
        return pTitle
    }

    /**
     * 
     * @param {Integer} categoryIndex 
     * @param {Integer} statIndex 
     * @param {Pointer<PWSTR>} pName 
     * @param {Pointer<PWSTR>} pValue 
     * @returns {HRESULT} 
     */
    GetStatistic(categoryIndex, statIndex, pName, pValue) {
        pNameMarshal := pName is VarRef ? "ptr*" : "ptr"
        pValueMarshal := pValue is VarRef ? "ptr*" : "ptr"

        result := ComCall(10, this, "ushort", categoryIndex, "ushort", statIndex, pNameMarshal, pName, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} categoryIndex 
     * @param {Integer} statIndex 
     * @param {PWSTR} name 
     * @param {PWSTR} value 
     * @returns {HRESULT} 
     */
    SetStatistic(categoryIndex, statIndex, name, value) {
        name := name is String ? StrPtr(name) : name
        value := value is String ? StrPtr(value) : value

        result := ComCall(11, this, "ushort", categoryIndex, "ushort", statIndex, "ptr", name, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} trackChanges 
     * @returns {HRESULT} 
     */
    Save(trackChanges) {
        result := ComCall(12, this, BOOL, trackChanges, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} categoryIndex 
     * @returns {HRESULT} 
     */
    SetLastPlayedCategory(categoryIndex) {
        result := ComCall(13, this, "uint", categoryIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetLastPlayedCategory() {
        result := ComCall(14, this, "uint*", &pCategoryIndex := 0, "HRESULT")
        return pCategoryIndex
    }

    Query(iid) {
        if (IGameStatistics.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetMaxCategoryLength := CallbackCreate(GetMethod(implObj, "GetMaxCategoryLength"), flags, 2)
        this.vtbl.GetMaxNameLength := CallbackCreate(GetMethod(implObj, "GetMaxNameLength"), flags, 2)
        this.vtbl.GetMaxValueLength := CallbackCreate(GetMethod(implObj, "GetMaxValueLength"), flags, 2)
        this.vtbl.GetMaxCategories := CallbackCreate(GetMethod(implObj, "GetMaxCategories"), flags, 2)
        this.vtbl.GetMaxStatsPerCategory := CallbackCreate(GetMethod(implObj, "GetMaxStatsPerCategory"), flags, 2)
        this.vtbl.SetCategoryTitle := CallbackCreate(GetMethod(implObj, "SetCategoryTitle"), flags, 3)
        this.vtbl.GetCategoryTitle := CallbackCreate(GetMethod(implObj, "GetCategoryTitle"), flags, 3)
        this.vtbl.GetStatistic := CallbackCreate(GetMethod(implObj, "GetStatistic"), flags, 5)
        this.vtbl.SetStatistic := CallbackCreate(GetMethod(implObj, "SetStatistic"), flags, 5)
        this.vtbl.Save := CallbackCreate(GetMethod(implObj, "Save"), flags, 2)
        this.vtbl.SetLastPlayedCategory := CallbackCreate(GetMethod(implObj, "SetLastPlayedCategory"), flags, 2)
        this.vtbl.GetLastPlayedCategory := CallbackCreate(GetMethod(implObj, "GetLastPlayedCategory"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetMaxCategoryLength)
        CallbackFree(this.vtbl.GetMaxNameLength)
        CallbackFree(this.vtbl.GetMaxValueLength)
        CallbackFree(this.vtbl.GetMaxCategories)
        CallbackFree(this.vtbl.GetMaxStatsPerCategory)
        CallbackFree(this.vtbl.SetCategoryTitle)
        CallbackFree(this.vtbl.GetCategoryTitle)
        CallbackFree(this.vtbl.GetStatistic)
        CallbackFree(this.vtbl.SetStatistic)
        CallbackFree(this.vtbl.Save)
        CallbackFree(this.vtbl.SetLastPlayedCategory)
        CallbackFree(this.vtbl.GetLastPlayedCategory)
    }
}
