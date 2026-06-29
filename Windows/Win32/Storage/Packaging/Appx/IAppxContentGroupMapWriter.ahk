#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides a write-only object model for a content group map.
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nn-appxpackaging-iappxcontentgroupmapwriter
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct IAppxContentGroupMapWriter extends IUnknown {
    /**
     * The interface identifier for IAppxContentGroupMapWriter
     * @type {Guid}
     */
    static IID := Guid("{d07ab776-a9de-4798-8c14-3db31e687c78}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAppxContentGroupMapWriter interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddAutomaticGroup : IntPtr
        AddAutomaticFile  : IntPtr
        Close             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAppxContentGroupMapWriter.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Adds an automatic content group to the content group map.
     * @param {PWSTR} groupName The automatic content group name.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxcontentgroupmapwriter-addautomaticgroup
     */
    AddAutomaticGroup(groupName) {
        groupName := groupName is String ? StrPtr(groupName) : groupName

        result := ComCall(3, this, "ptr", groupName, "HRESULT")
        return result
    }

    /**
     * Adds files to an automatic content group in a content group map.
     * @param {PWSTR} fileName The name of the file to be added to the automatic content group.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxcontentgroupmapwriter-addautomaticfile
     */
    AddAutomaticFile(fileName) {
        fileName := fileName is String ? StrPtr(fileName) : fileName

        result := ComCall(4, this, "ptr", fileName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Close() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAppxContentGroupMapWriter.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddAutomaticGroup := CallbackCreate(GetMethod(implObj, "AddAutomaticGroup"), flags, 2)
        this.vtbl.AddAutomaticFile := CallbackCreate(GetMethod(implObj, "AddAutomaticFile"), flags, 2)
        this.vtbl.Close := CallbackCreate(GetMethod(implObj, "Close"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddAutomaticGroup)
        CallbackFree(this.vtbl.AddAutomaticFile)
        CallbackFree(this.vtbl.Close)
    }
}
