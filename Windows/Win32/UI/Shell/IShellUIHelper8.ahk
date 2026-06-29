#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IShellUIHelper7.ahk" { IShellUIHelper7 }

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IShellUIHelper8 extends IShellUIHelper7 {
    /**
     * The interface identifier for IShellUIHelper8
     * @type {Guid}
     */
    static IID := Guid("{66debcf2-05b0-4f07-b49b-b96241a65db2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IShellUIHelper8 interfaces
    */
    struct Vtbl extends IShellUIHelper7.Vtbl {
        GetCVListData         : IntPtr
        GetCVListLocalData    : IntPtr
        GetEMIEListData       : IntPtr
        GetEMIEListLocalData  : IntPtr
        OpenFavoritesPane     : IntPtr
        OpenFavoritesSettings : IntPtr
        LaunchInHVSI          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IShellUIHelper8.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetCVListData() {
        pbstrResult := BSTR.Owned()
        result := ComCall(97, this, BSTR.Ptr, pbstrResult, "HRESULT")
        return pbstrResult
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetCVListLocalData() {
        pbstrResult := BSTR.Owned()
        result := ComCall(98, this, BSTR.Ptr, pbstrResult, "HRESULT")
        return pbstrResult
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetEMIEListData() {
        pbstrResult := BSTR.Owned()
        result := ComCall(99, this, BSTR.Ptr, pbstrResult, "HRESULT")
        return pbstrResult
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetEMIEListLocalData() {
        pbstrResult := BSTR.Owned()
        result := ComCall(100, this, BSTR.Ptr, pbstrResult, "HRESULT")
        return pbstrResult
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    OpenFavoritesPane() {
        result := ComCall(101, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    OpenFavoritesSettings() {
        result := ComCall(102, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrUrl 
     * @returns {HRESULT} 
     */
    LaunchInHVSI(bstrUrl) {
        bstrUrl := bstrUrl is String ? BSTR.Alloc(bstrUrl).Value : bstrUrl

        result := ComCall(103, this, BSTR, bstrUrl, "HRESULT")
        return result
    }

    Query(iid) {
        if (IShellUIHelper8.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCVListData := CallbackCreate(GetMethod(implObj, "GetCVListData"), flags, 2)
        this.vtbl.GetCVListLocalData := CallbackCreate(GetMethod(implObj, "GetCVListLocalData"), flags, 2)
        this.vtbl.GetEMIEListData := CallbackCreate(GetMethod(implObj, "GetEMIEListData"), flags, 2)
        this.vtbl.GetEMIEListLocalData := CallbackCreate(GetMethod(implObj, "GetEMIEListLocalData"), flags, 2)
        this.vtbl.OpenFavoritesPane := CallbackCreate(GetMethod(implObj, "OpenFavoritesPane"), flags, 1)
        this.vtbl.OpenFavoritesSettings := CallbackCreate(GetMethod(implObj, "OpenFavoritesSettings"), flags, 1)
        this.vtbl.LaunchInHVSI := CallbackCreate(GetMethod(implObj, "LaunchInHVSI"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCVListData)
        CallbackFree(this.vtbl.GetCVListLocalData)
        CallbackFree(this.vtbl.GetEMIEListData)
        CallbackFree(this.vtbl.GetEMIEListLocalData)
        CallbackFree(this.vtbl.OpenFavoritesPane)
        CallbackFree(this.vtbl.OpenFavoritesSettings)
        CallbackFree(this.vtbl.LaunchInHVSI)
    }
}
