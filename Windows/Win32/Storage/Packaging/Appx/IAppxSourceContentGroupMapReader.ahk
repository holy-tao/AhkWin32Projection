#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IAppxContentGroup.ahk" { IAppxContentGroup }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IAppxContentGroupsEnumerator.ahk" { IAppxContentGroupsEnumerator }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Gets information about the source content group map.
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nn-appxpackaging-iappxsourcecontentgroupmapreader
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct IAppxSourceContentGroupMapReader extends IUnknown {
    /**
     * The interface identifier for IAppxSourceContentGroupMapReader
     * @type {Guid}
     */
    static IID := Guid("{f329791d-540b-4a9f-bc75-3282b7d73193}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAppxSourceContentGroupMapReader interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetRequiredGroup   : IntPtr
        GetAutomaticGroups : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAppxSourceContentGroupMapReader.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the required content group from the source content group map.
     * @returns {IAppxContentGroup} The required content group.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxsourcecontentgroupmapreader-getrequiredgroup
     */
    GetRequiredGroup() {
        result := ComCall(3, this, "ptr*", &requiredGroup := 0, "HRESULT")
        return IAppxContentGroup(requiredGroup)
    }

    /**
     * Gets the automatic content group(s) from the source content group map.
     * @returns {IAppxContentGroupsEnumerator} An enumerator for the automatic content group(s).
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxsourcecontentgroupmapreader-getautomaticgroups
     */
    GetAutomaticGroups() {
        result := ComCall(4, this, "ptr*", &automaticGroupsEnumerator := 0, "HRESULT")
        return IAppxContentGroupsEnumerator(automaticGroupsEnumerator)
    }

    Query(iid) {
        if (IAppxSourceContentGroupMapReader.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetRequiredGroup := CallbackCreate(GetMethod(implObj, "GetRequiredGroup"), flags, 2)
        this.vtbl.GetAutomaticGroups := CallbackCreate(GetMethod(implObj, "GetAutomaticGroups"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetRequiredGroup)
        CallbackFree(this.vtbl.GetAutomaticGroups)
    }
}
