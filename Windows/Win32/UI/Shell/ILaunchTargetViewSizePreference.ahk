#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\APPLICATION_VIEW_SIZE_PREFERENCE.ahk" { APPLICATION_VIEW_SIZE_PREFERENCE }

/**
 * Provides a method for retrieving the preferred view size for a new application window.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ilaunchtargetviewsizepreference
 * @namespace Windows.Win32.UI.Shell
 */
export default struct ILaunchTargetViewSizePreference extends IUnknown {
    /**
     * The interface identifier for ILaunchTargetViewSizePreference
     * @type {Guid}
     */
    static IID := Guid("{2f0666c6-12f7-4360-b511-a394a0553725}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ILaunchTargetViewSizePreference interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetTargetViewSizePreference : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ILaunchTargetViewSizePreference.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the preferred view size of the application being launched.
     * @returns {APPLICATION_VIEW_SIZE_PREFERENCE} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-application_view_size_preference">APPLICATION_VIEW_SIZE_PREFERENCE</a>*</b>
     * 
     * Contains the address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-application_view_size_preference">APPLICATION_VIEW_SIZE_PREFERENCE</a>  for the target application.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ilaunchtargetviewsizepreference-gettargetviewsizepreference
     */
    GetTargetViewSizePreference() {
        result := ComCall(3, this, "int*", &targetSizeOnLaunch := 0, "HRESULT")
        return targetSizeOnLaunch
    }

    Query(iid) {
        if (ILaunchTargetViewSizePreference.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetTargetViewSizePreference := CallbackCreate(GetMethod(implObj, "GetTargetViewSizePreference"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetTargetViewSizePreference)
    }
}
