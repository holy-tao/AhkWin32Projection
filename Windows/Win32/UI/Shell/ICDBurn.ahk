#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that determine whether a system has hardware for writing to CD, the drive letter of a CD writer device, and programmatically initiate a CD writing session.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nn-shobjidl-icdburn
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ICDBurn extends IUnknown{
    /**
     * The interface identifier for ICDBurn
     * @type {Guid}
     */
    static IID => Guid("{3d73a659-e5d0-4d42-afc0-5121ba425c8d}")

    /**
     * The class identifier for CDBurn
     * @type {Guid}
     */
    static CLSID => Guid("{fbeb8a05-beee-4442-804e-409d6c4515e9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} pszDrive 
     * @param {Integer} cch 
     * @returns {HRESULT} 
     */
    GetRecorderDriveLetter(pszDrive, cch) {
        pszDrive := pszDrive is String ? StrPtr(pszDrive) : pszDrive

        result := ComCall(3, this, "ptr", pszDrive, "uint", cch, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @returns {HRESULT} 
     */
    Burn(hwnd) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(4, this, "ptr", hwnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfHasRecorder 
     * @returns {HRESULT} 
     */
    HasRecordableDrive(pfHasRecorder) {
        result := ComCall(5, this, "ptr", pfHasRecorder, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
