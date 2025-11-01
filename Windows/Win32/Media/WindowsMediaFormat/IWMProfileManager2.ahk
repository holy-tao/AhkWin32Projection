#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMProfileManager.ahk

/**
 * The IWMProfileManager2 interface adds methods to specify and retrieve the version number of the system profiles enumerated by the profile manager.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmprofilemanager2
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
     * 
     * @param {Pointer<Integer>} pdwVersion 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofilemanager2-getsystemprofileversion
     */
    GetSystemProfileVersion(pdwVersion) {
        pdwVersionMarshal := pdwVersion is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, pdwVersionMarshal, pdwVersion, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwVersion 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofilemanager2-setsystemprofileversion
     */
    SetSystemProfileVersion(dwVersion) {
        result := ComCall(10, this, "int", dwVersion, "HRESULT")
        return result
    }
}
