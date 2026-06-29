#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides a method for retrieving an AppUserModelId.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ilaunchsourceappusermodelid
 * @namespace Windows.Win32.UI.Shell
 */
export default struct ILaunchSourceAppUserModelId extends IUnknown {
    /**
     * The interface identifier for ILaunchSourceAppUserModelId
     * @type {Guid}
     */
    static IID := Guid("{989191ac-28ff-4cf0-9584-e0d078bc2396}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ILaunchSourceAppUserModelId interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetAppUserModelId : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ILaunchSourceAppUserModelId.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves an AppUserModelId from the source application.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * Contains a  pointer to a string that contains the <a href="https://docs.microsoft.com/windows/desktop/shell/appids">AppUserModelId</a>.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ilaunchsourceappusermodelid-getappusermodelid
     */
    GetAppUserModelId() {
        result := ComCall(3, this, PWSTR.Ptr, &launchingApp := 0, "HRESULT")
        return launchingApp
    }

    Query(iid) {
        if (ILaunchSourceAppUserModelId.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetAppUserModelId := CallbackCreate(GetMethod(implObj, "GetAppUserModelId"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetAppUserModelId)
    }
}
