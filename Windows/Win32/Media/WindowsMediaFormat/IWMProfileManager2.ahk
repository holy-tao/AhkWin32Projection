#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWMProfileManager.ahk" { IWMProfileManager }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WMT_VERSION.ahk" { WMT_VERSION }

/**
 * The IWMProfileManager2 interface adds methods to specify and retrieve the version number of the system profiles enumerated by the profile manager.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nn-wmsdkidl-iwmprofilemanager2
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct IWMProfileManager2 extends IWMProfileManager {
    /**
     * The interface identifier for IWMProfileManager2
     * @type {Guid}
     */
    static IID := Guid("{7a924e51-73c1-494d-8019-23d37ed9b89a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMProfileManager2 interfaces
    */
    struct Vtbl extends IWMProfileManager.Vtbl {
        GetSystemProfileVersion : IntPtr
        SetSystemProfileVersion : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMProfileManager2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetSystemProfileVersion method retrieves the version number of the system profiles that the profile manager enumerates.
     * @remarks
     * Because there are no system profiles for the Windows Media 9 Series codecs, this method is primarily useful for obtaining version 8 system profiles that you will convert to custom profiles using the Windows Media 9 Series codecs. For more information, see <a href="https://docs.microsoft.com/windows/desktop/wmformat/reusing-stream-configurations">Reusing Stream Configurations</a>.
     * @param {Pointer<WMT_VERSION>} pdwVersion Pointer to one member of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_version">WMT_VERSION</a> enumeration type.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofilemanager2-getsystemprofileversion
     */
    GetSystemProfileVersion(pdwVersion) {
        pdwVersionMarshal := pdwVersion is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, pdwVersionMarshal, pdwVersion, "HRESULT")
        return result
    }

    /**
     * The SetSystemProfileVersion method specifies the version number of the system profiles that the profile manager enumerates.
     * @remarks
     * Because there are no system profiles for the Windows Media 9 Series codecs, this method is primarily useful for obtaining version 8 system profiles that you will convert to custom profiles using the Windows Media 9 Series codecs. For more information, see <a href="https://docs.microsoft.com/windows/desktop/wmformat/reusing-stream-configurations">Reusing Stream Configurations</a>.
     * 
     * WMT_VER_4_0 is the default for backward-compatibility only, so be sure to set this to a newer version if it is required. Typically you should set this to WMT_VER_8_0 in order to retrieve the version 8 profiles to use as a starting point for creating your own Windows Media 9 Series profile. If you set it to WMT_VER_9_0, zero profiles will be enumerated.
     * @param {WMT_VERSION} dwVersion One member of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_version">WMT_VERSION</a> enumeration type.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofilemanager2-setsystemprofileversion
     */
    SetSystemProfileVersion(dwVersion) {
        result := ComCall(10, this, WMT_VERSION, dwVersion, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMProfileManager2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSystemProfileVersion := CallbackCreate(GetMethod(implObj, "GetSystemProfileVersion"), flags, 2)
        this.vtbl.SetSystemProfileVersion := CallbackCreate(GetMethod(implObj, "SetSystemProfileVersion"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSystemProfileVersion)
        CallbackFree(this.vtbl.SetSystemProfileVersion)
    }
}
