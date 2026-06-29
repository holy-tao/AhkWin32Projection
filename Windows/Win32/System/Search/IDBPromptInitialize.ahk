#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct IDBPromptInitialize extends IUnknown {
    /**
     * The interface identifier for IDBPromptInitialize
     * @type {Guid}
     */
    static IID := Guid("{2206ccb0-19c1-11d1-89e0-00c04fd7a829}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDBPromptInitialize interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        PromptDataSource : IntPtr
        PromptFileName   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDBPromptInitialize.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IUnknown} pUnkOuter 
     * @param {HWND} hWndParent 
     * @param {Integer} dwPromptOptions 
     * @param {Integer} cSourceTypeFilter 
     * @param {Pointer<Integer>} rgSourceTypeFilter 
     * @param {PWSTR} pwszszzProviderFilter 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<IUnknown>} ppDataSource 
     * @returns {HRESULT} 
     */
    PromptDataSource(pUnkOuter, hWndParent, dwPromptOptions, cSourceTypeFilter, rgSourceTypeFilter, pwszszzProviderFilter, riid, ppDataSource) {
        pwszszzProviderFilter := pwszszzProviderFilter is String ? StrPtr(pwszszzProviderFilter) : pwszszzProviderFilter

        rgSourceTypeFilterMarshal := rgSourceTypeFilter is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", pUnkOuter, HWND, hWndParent, "uint", dwPromptOptions, "uint", cSourceTypeFilter, rgSourceTypeFilterMarshal, rgSourceTypeFilter, "ptr", pwszszzProviderFilter, Guid.Ptr, riid, IUnknown.Ptr, ppDataSource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hWndParent 
     * @param {Integer} dwPromptOptions 
     * @param {PWSTR} pwszInitialDirectory 
     * @param {PWSTR} pwszInitialFile 
     * @returns {PWSTR} 
     */
    PromptFileName(hWndParent, dwPromptOptions, pwszInitialDirectory, pwszInitialFile) {
        pwszInitialDirectory := pwszInitialDirectory is String ? StrPtr(pwszInitialDirectory) : pwszInitialDirectory
        pwszInitialFile := pwszInitialFile is String ? StrPtr(pwszInitialFile) : pwszInitialFile

        result := ComCall(4, this, HWND, hWndParent, "uint", dwPromptOptions, "ptr", pwszInitialDirectory, "ptr", pwszInitialFile, PWSTR.Ptr, &ppwszSelectedFile := 0, "HRESULT")
        return ppwszSelectedFile
    }

    Query(iid) {
        if (IDBPromptInitialize.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.PromptDataSource := CallbackCreate(GetMethod(implObj, "PromptDataSource"), flags, 9)
        this.vtbl.PromptFileName := CallbackCreate(GetMethod(implObj, "PromptFileName"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.PromptDataSource)
        CallbackFree(this.vtbl.PromptFileName)
    }
}
