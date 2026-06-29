#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IPartThumbnail.ahk" { IPartThumbnail }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IXpsDocument extends IUnknown {
    /**
     * The interface identifier for IXpsDocument
     * @type {Guid}
     */
    static IID := Guid("{e8d907db-62a9-4a95-abe7-e01763dd30f8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXpsDocument interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetThumbnail : IntPtr
        SetThumbnail : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXpsDocument.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {IPartThumbnail} 
     */
    GetThumbnail() {
        result := ComCall(3, this, "ptr*", &ppThumbnail := 0, "HRESULT")
        return IPartThumbnail(ppThumbnail)
    }

    /**
     * 
     * @param {IPartThumbnail} pThumbnail 
     * @returns {HRESULT} 
     */
    SetThumbnail(pThumbnail) {
        result := ComCall(4, this, "ptr", pThumbnail, "HRESULT")
        return result
    }

    Query(iid) {
        if (IXpsDocument.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetThumbnail := CallbackCreate(GetMethod(implObj, "GetThumbnail"), flags, 2)
        this.vtbl.SetThumbnail := CallbackCreate(GetMethod(implObj, "SetThumbnail"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetThumbnail)
        CallbackFree(this.vtbl.SetThumbnail)
    }
}
