#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IInspectable.ahk" { IInspectable }
#Import ".\HSTRING.ahk" { HSTRING }

/**
 * @see https://learn.microsoft.com/windows/win32/api/useractivityinterop/nn-useractivityinterop-iuseractivitysourcehostinterop
 * @namespace Windows.Win32.System.WinRT
 */
export default struct IUserActivitySourceHostInterop extends IInspectable {
    /**
     * The interface identifier for IUserActivitySourceHostInterop
     * @type {Guid}
     */
    static IID := Guid("{c15df8bc-8844-487a-b85b-7578e0f61419}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUserActivitySourceHostInterop interfaces
    */
    struct Vtbl extends IInspectable.Vtbl {
        SetActivitySourceHost : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUserActivitySourceHostInterop.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Associates host information with either a [UserActivityChannel](/uwp/api/windows.applicationmodel.useractivities.useractivitychannel) or the [UserActivity](/uwp/api/windows.applicationmodel.useractivities.useractivity) object.
     * @remarks
     * The host information for a **UserActivity** object only needs to set with this method if the **UserActivity** object was constructed from a source other than a **UserActivityChannel**, such as by using the **UserActivity** constructor.
     * @param {HSTRING} activitySourceHost An **HSTRING** containing the host to be associated with the user activity.
     * @returns {HRESULT} If this function succeeds, it returns S_OK. Otherwise, it returns an HRESULT error code.
     * @see https://learn.microsoft.com/windows/win32/api/useractivityinterop/nf-useractivityinterop-iuseractivitysourcehostinterop-setactivitysourcehost
     */
    SetActivitySourceHost(activitySourceHost) {
        result := ComCall(6, this, HSTRING, activitySourceHost, "HRESULT")
        return result
    }

    Query(iid) {
        if (IUserActivitySourceHostInterop.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetActivitySourceHost := CallbackCreate(GetMethod(implObj, "SetActivitySourceHost"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetActivitySourceHost)
    }
}
