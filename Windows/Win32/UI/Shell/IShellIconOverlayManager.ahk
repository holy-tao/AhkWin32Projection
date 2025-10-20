#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * IShellIconOverlayManager may be altered or unavailable.
 * @remarks
 * 
  * Icon overlays are small images placed at the lower-left corner of the icon that represents a Shell object in Windows Explorer or on the desktop. They are used to add some extra information to the object's normal icon. A commonly used icon overlay is the small arrow that indicates that a file or folder is actually a link. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nn-shlobj_core-ishelliconoverlay">IShellIconOverlay</a>.
  * 
  * This interface must be implemented by all icon overlay handlers.
  * 
  * This interface is not typically called by applications.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/nn-shlobj_core-ishelliconoverlaymanager
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellIconOverlayManager extends IUnknown{
    /**
     * The interface identifier for IShellIconOverlayManager
     * @type {Guid}
     */
    static IID => Guid("{f10b5e34-dd3b-42a7-aa7d-2f4ec54bb09b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} pwszPath 
     * @param {Integer} dwAttrib 
     * @param {Pointer<Int32>} pIndex 
     * @param {Integer} dwflags 
     * @returns {HRESULT} 
     */
    GetFileOverlayInfo(pwszPath, dwAttrib, pIndex, dwflags) {
        pwszPath := pwszPath is String ? StrPtr(pwszPath) : pwszPath

        result := ComCall(3, this, "ptr", pwszPath, "uint", dwAttrib, "int*", pIndex, "uint", dwflags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszPath 
     * @param {Integer} dwAttrib 
     * @param {Pointer<Int32>} pIndex 
     * @param {Integer} dwflags 
     * @param {Integer} iReservedID 
     * @returns {HRESULT} 
     */
    GetReservedOverlayInfo(pwszPath, dwAttrib, pIndex, dwflags, iReservedID) {
        pwszPath := pwszPath is String ? StrPtr(pwszPath) : pwszPath

        result := ComCall(4, this, "ptr", pwszPath, "uint", dwAttrib, "int*", pIndex, "uint", dwflags, "int", iReservedID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    RefreshOverlayImages(dwFlags) {
        result := ComCall(5, this, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    LoadNonloadedOverlayIdentifiers() {
        result := ComCall(6, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iImage 
     * @param {Pointer<Int32>} piIndex 
     * @param {BOOL} fAdd 
     * @returns {HRESULT} 
     */
    OverlayIndexFromImageIndex(iImage, piIndex, fAdd) {
        result := ComCall(7, this, "int", iImage, "int*", piIndex, "int", fAdd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
