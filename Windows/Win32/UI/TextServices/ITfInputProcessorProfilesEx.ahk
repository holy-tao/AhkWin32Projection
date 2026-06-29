#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITfInputProcessorProfiles.ahk" { ITfInputProcessorProfiles }

/**
 * This interface is implemented by the TSF manager and used by a text service or application to set the display description of the language profile.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/nn-msctf-itfinputprocessorprofilesex
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfInputProcessorProfilesEx extends ITfInputProcessorProfiles {
    /**
     * The interface identifier for ITfInputProcessorProfilesEx
     * @type {Guid}
     */
    static IID := Guid("{892f230f-fe00-4a41-a98e-fcd6de0d35ef}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfInputProcessorProfilesEx interfaces
    */
    struct Vtbl extends ITfInputProcessorProfiles.Vtbl {
        SetLanguageProfileDisplayName : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfInputProcessorProfilesEx.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Redistributable:\_Requires TSF 1.0 on Windows 2000.
     * @param {Pointer<Guid>} rclsid 
     * @param {Integer} langid 
     * @param {Pointer<Guid>} guidProfile 
     * @param {PWSTR} pchFile 
     * @param {Integer} cchFile 
     * @param {Integer} uResId 
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfinputprocessorprofilesex-setlanguageprofiledisplayname
     */
    SetLanguageProfileDisplayName(rclsid, langid, guidProfile, pchFile, cchFile, uResId) {
        pchFile := pchFile is String ? StrPtr(pchFile) : pchFile

        result := ComCall(21, this, Guid.Ptr, rclsid, "ushort", langid, Guid.Ptr, guidProfile, "ptr", pchFile, "uint", cchFile, "uint", uResId, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITfInputProcessorProfilesEx.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetLanguageProfileDisplayName := CallbackCreate(GetMethod(implObj, "SetLanguageProfileDisplayName"), flags, 7)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetLanguageProfileDisplayName)
    }
}
