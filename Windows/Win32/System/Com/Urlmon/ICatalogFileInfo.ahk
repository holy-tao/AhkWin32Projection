#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\IUnknown.ahk" { IUnknown }
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
export default struct ICatalogFileInfo extends IUnknown {
    /**
     * The interface identifier for ICatalogFileInfo
     * @type {Guid}
     */
    static IID := Guid("{711c7600-6b48-11d1-b403-00aa00b92af1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICatalogFileInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCatalogFile : IntPtr
        GetJavaTrust   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICatalogFileInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {PSTR} 
     */
    GetCatalogFile() {
        result := ComCall(3, this, PSTR.Ptr, &ppszCatalogFile := 0, "HRESULT")
        return ppszCatalogFile
    }

    /**
     * 
     * @returns {Pointer<Void>} 
     */
    GetJavaTrust() {
        result := ComCall(4, this, "ptr*", &ppJavaTrust := 0, "HRESULT")
        return ppJavaTrust
    }

    Query(iid) {
        if (ICatalogFileInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCatalogFile := CallbackCreate(GetMethod(implObj, "GetCatalogFile"), flags, 2)
        this.vtbl.GetJavaTrust := CallbackCreate(GetMethod(implObj, "GetJavaTrust"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCatalogFile)
        CallbackFree(this.vtbl.GetJavaTrust)
    }
}
