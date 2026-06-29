#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IAppxContentGroupFilesEnumerator.ahk" { IAppxContentGroupFilesEnumerator }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Retrieves information about a content group.
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nn-appxpackaging-iappxcontentgroup
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct IAppxContentGroup extends IUnknown {
    /**
     * The interface identifier for IAppxContentGroup
     * @type {Guid}
     */
    static IID := Guid("{328f6468-c04f-4e3c-b6fa-6b8d27f3003a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAppxContentGroup interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetName  : IntPtr
        GetFiles : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAppxContentGroup.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the name of the content group.
     * @returns {PWSTR} The content group name.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxcontentgroup-getname
     */
    GetName() {
        result := ComCall(3, this, PWSTR.Ptr, &groupName := 0, "HRESULT")
        return groupName
    }

    /**
     * Gets files from a content group.
     * @returns {IAppxContentGroupFilesEnumerator} An enumerator for getting content group files.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxcontentgroup-getfiles
     */
    GetFiles() {
        result := ComCall(4, this, "ptr*", &_enumerator := 0, "HRESULT")
        return IAppxContentGroupFilesEnumerator(_enumerator)
    }

    Query(iid) {
        if (IAppxContentGroup.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetName := CallbackCreate(GetMethod(implObj, "GetName"), flags, 2)
        this.vtbl.GetFiles := CallbackCreate(GetMethod(implObj, "GetFiles"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetName)
        CallbackFree(this.vtbl.GetFiles)
    }
}
