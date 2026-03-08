#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMProfileManager.ahk

/**
 * The IWMProfileManager2 interface adds methods to specify and retrieve the version number of the system profiles enumerated by the profile manager.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nn-wmsdkidl-iwmprofilemanager2
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMProfileManager2 extends IWMProfileManager{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMProfileManager2
     * @type {Guid}
     */
    static IID => Guid("{7a924e51-73c1-494d-8019-23d37ed9b89a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSystemProfileVersion", "SetSystemProfileVersion"]

    /**
     * The GetSystemProfileVersion method retrieves the version number of the system profiles that the profile manager enumerates.
     * @remarks
     * Because there are no system profiles for the Windows Media 9 Series codecs, this method is primarily useful for obtaining version 8 system profiles that you will convert to custom profiles using the Windows Media 9 Series codecs. For more information, see <a href="https://docs.microsoft.com/windows/desktop/wmformat/reusing-stream-configurations">Reusing Stream Configurations</a>.
     * @param {Pointer<Integer>} pdwVersion Pointer to one member of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_version">WMT_VERSION</a> enumeration type.
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
     * @param {Integer} dwVersion One member of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_version">WMT_VERSION</a> enumeration type.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofilemanager2-setsystemprofileversion
     */
    SetSystemProfileVersion(dwVersion) {
        result := ComCall(10, this, "int", dwVersion, "HRESULT")
        return result
    }
}
