#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.System.Mmc
 */
export default struct MenuItem extends IDispatch {
    /**
     * The interface identifier for MenuItem
     * @type {Guid}
     */
    static IID := Guid("{0178fad1-b361-4b27-96ad-67c57ebf2e1d}")

    /**
     * The class identifier for MenuItem
     * @type {Guid}
     */
    static CLSID := Guid("{0178fad1-b361-4b27-96ad-67c57ebf2e1d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for MenuItem interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_DisplayName             : IntPtr
        get_LanguageIndependentName : IntPtr
        get_Path                    : IntPtr
        get_LanguageIndependentPath : IntPtr
        Execute                     : IntPtr
        get_Enabled                 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := MenuItem.Vtbl()
        }
        super.__New(implObj, flags)
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
    LanguageIndependentName {
        get => this.get_LanguageIndependentName()
    }

    /**
     * @type {BSTR} 
     */
    Path {
        get => this.get_Path()
    }

    /**
     * @type {BSTR} 
     */
    LanguageIndependentPath {
        get => this.get_LanguageIndependentPath()
    }

    /**
     * @type {BOOL} 
     */
    Enabled {
        get => this.get_Enabled()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_DisplayName() {
        DisplayName := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, DisplayName, "HRESULT")
        return DisplayName
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_LanguageIndependentName() {
        LanguageIndependentName := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, LanguageIndependentName, "HRESULT")
        return LanguageIndependentName
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Path() {
        _Path := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, _Path, "HRESULT")
        return _Path
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_LanguageIndependentPath() {
        LanguageIndependentPath := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, LanguageIndependentPath, "HRESULT")
        return LanguageIndependentPath
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Execute() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_Enabled() {
        result := ComCall(12, this, BOOL.Ptr, &Enabled := 0, "HRESULT")
        return Enabled
    }

    Query(iid) {
        if (MenuItem.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_DisplayName := CallbackCreate(GetMethod(implObj, "get_DisplayName"), flags, 2)
        this.vtbl.get_LanguageIndependentName := CallbackCreate(GetMethod(implObj, "get_LanguageIndependentName"), flags, 2)
        this.vtbl.get_Path := CallbackCreate(GetMethod(implObj, "get_Path"), flags, 2)
        this.vtbl.get_LanguageIndependentPath := CallbackCreate(GetMethod(implObj, "get_LanguageIndependentPath"), flags, 2)
        this.vtbl.Execute := CallbackCreate(GetMethod(implObj, "Execute"), flags, 1)
        this.vtbl.get_Enabled := CallbackCreate(GetMethod(implObj, "get_Enabled"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_DisplayName)
        CallbackFree(this.vtbl.get_LanguageIndependentName)
        CallbackFree(this.vtbl.get_Path)
        CallbackFree(this.vtbl.get_LanguageIndependentPath)
        CallbackFree(this.vtbl.Execute)
        CallbackFree(this.vtbl.get_Enabled)
    }
}
