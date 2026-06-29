#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IDxcBlob.ahk" { IDxcBlob }

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Dxc
 */
export default struct IDxcIncludeHandler extends IUnknown {
    /**
     * The interface identifier for IDxcIncludeHandler
     * @type {Guid}
     */
    static IID := Guid("{7f61fc7d-950d-467f-b3e3-3c02fb49187c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDxcIncludeHandler interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        LoadSource : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDxcIncludeHandler.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pFilename 
     * @returns {IDxcBlob} 
     */
    LoadSource(pFilename) {
        pFilename := pFilename is String ? StrPtr(pFilename) : pFilename

        result := ComCall(3, this, "ptr", pFilename, "ptr*", &ppIncludeSource := 0, "HRESULT")
        return IDxcBlob(ppIncludeSource)
    }

    Query(iid) {
        if (IDxcIncludeHandler.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.LoadSource := CallbackCreate(GetMethod(implObj, "LoadSource"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.LoadSource)
    }
}
