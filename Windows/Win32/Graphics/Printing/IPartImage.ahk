#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IPartBase.ahk" { IPartBase }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IPartImage extends IPartBase {
    /**
     * The interface identifier for IPartImage
     * @type {Guid}
     */
    static IID := Guid("{725f2e3c-401a-4705-9de0-fe6f1353b87f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPartImage interfaces
    */
    struct Vtbl extends IPartBase.Vtbl {
        GetImageProperties : IntPtr
        SetImageContent    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPartImage.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetImageProperties() {
        pContentType := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, pContentType, "HRESULT")
        return pContentType
    }

    /**
     * 
     * @param {PWSTR} pContentType 
     * @returns {HRESULT} 
     */
    SetImageContent(pContentType) {
        pContentType := pContentType is String ? StrPtr(pContentType) : pContentType

        result := ComCall(8, this, "ptr", pContentType, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPartImage.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetImageProperties := CallbackCreate(GetMethod(implObj, "GetImageProperties"), flags, 2)
        this.vtbl.SetImageContent := CallbackCreate(GetMethod(implObj, "SetImageContent"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetImageProperties)
        CallbackFree(this.vtbl.SetImageContent)
    }
}
