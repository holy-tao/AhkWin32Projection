#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWMProfile.ahk" { IWMProfile }

/**
 * The IWMProfile2 interface exposes the globally unique identifier for a system profile.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nn-wmsdkidl-iwmprofile2
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct IWMProfile2 extends IWMProfile {
    /**
     * The interface identifier for IWMProfile2
     * @type {Guid}
     */
    static IID := Guid("{07e72d33-d94e-4be7-8843-60ae5ff7e5f5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMProfile2 interfaces
    */
    struct Vtbl extends IWMProfile.Vtbl {
        GetProfileID : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMProfile2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetProfileID method retrieves the globally unique identifier of a system profile.
     * @remarks
     * System profiles have associated identifiers, but custom profiles do not, therefore this method cannot be used to identify any profile that uses the Windows Media® 9 Series codecs. For more information, see <a href="https://docs.microsoft.com/windows/desktop/wmformat/reusing-stream-configurations">Reusing Stream Configurations</a>.
     * @returns {Guid} Pointer to a GUID specifying the ID of the profile. It the profile is not a system profile, this is set to GUID_NULL.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofile2-getprofileid
     */
    GetProfileID() {
        pguidID := Guid()
        result := ComCall(21, this, Guid.Ptr, pguidID, "HRESULT")
        return pguidID
    }

    Query(iid) {
        if (IWMProfile2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetProfileID := CallbackCreate(GetMethod(implObj, "GetProfileID"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetProfileID)
    }
}
