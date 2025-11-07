#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Configures the audio session that is associated with the streaming audio renderer (SAR).
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfaudiopolicy
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFAudioPolicy extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFAudioPolicy
     * @type {Guid}
     */
    static IID => Guid("{a0638c2b-6465-4395-9ae7-a321a9fd2856}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetGroupingParam", "GetGroupingParam", "SetDisplayName", "GetDisplayName", "SetIconPath", "GetIconPath"]

    /**
     * 
     * @param {Pointer<Guid>} rguidClass 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfaudiopolicy-setgroupingparam
     */
    SetGroupingParam(rguidClass) {
        result := ComCall(3, this, "ptr", rguidClass, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfaudiopolicy-getgroupingparam
     */
    GetGroupingParam() {
        pguidClass := Guid()
        result := ComCall(4, this, "ptr", pguidClass, "HRESULT")
        return pguidClass
    }

    /**
     * 
     * @param {PWSTR} pszName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfaudiopolicy-setdisplayname
     */
    SetDisplayName(pszName) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(5, this, "ptr", pszName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfaudiopolicy-getdisplayname
     */
    GetDisplayName() {
        result := ComCall(6, this, "ptr*", &pszName := 0, "HRESULT")
        return pszName
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfaudiopolicy-seticonpath
     */
    SetIconPath(pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(7, this, "ptr", pszPath, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfaudiopolicy-geticonpath
     */
    GetIconPath() {
        result := ComCall(8, this, "ptr*", &pszPath := 0, "HRESULT")
        return pszPath
    }
}
