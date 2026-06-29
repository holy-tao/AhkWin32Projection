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
export default struct IPartThumbnail extends IPartBase {
    /**
     * The interface identifier for IPartThumbnail
     * @type {Guid}
     */
    static IID := Guid("{027ed1c9-ba39-4cc5-aa55-7ec3a0de171a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPartThumbnail interfaces
    */
    struct Vtbl extends IPartBase.Vtbl {
        GetThumbnailProperties : IntPtr
        SetThumbnailContent    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPartThumbnail.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetThumbnailProperties() {
        pContentType := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, pContentType, "HRESULT")
        return pContentType
    }

    /**
     * 
     * @param {PWSTR} pContentType 
     * @returns {HRESULT} 
     */
    SetThumbnailContent(pContentType) {
        pContentType := pContentType is String ? StrPtr(pContentType) : pContentType

        result := ComCall(8, this, "ptr", pContentType, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPartThumbnail.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetThumbnailProperties := CallbackCreate(GetMethod(implObj, "GetThumbnailProperties"), flags, 2)
        this.vtbl.SetThumbnailContent := CallbackCreate(GetMethod(implObj, "SetThumbnailContent"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetThumbnailProperties)
        CallbackFree(this.vtbl.SetThumbnailContent)
    }
}
