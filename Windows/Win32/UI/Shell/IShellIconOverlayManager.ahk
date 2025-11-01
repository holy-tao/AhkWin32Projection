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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFileOverlayInfo", "GetReservedOverlayInfo", "RefreshOverlayImages", "LoadNonloadedOverlayIdentifiers", "OverlayIndexFromImageIndex"]

    /**
     * 
     * @param {PWSTR} pwszPath 
     * @param {Integer} dwAttrib 
     * @param {Pointer<Integer>} pIndex 
     * @param {Integer} dwflags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ishelliconoverlaymanager-getfileoverlayinfo
     */
    GetFileOverlayInfo(pwszPath, dwAttrib, pIndex, dwflags) {
        pwszPath := pwszPath is String ? StrPtr(pwszPath) : pwszPath

        pIndexMarshal := pIndex is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", pwszPath, "uint", dwAttrib, pIndexMarshal, pIndex, "uint", dwflags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszPath 
     * @param {Integer} dwAttrib 
     * @param {Pointer<Integer>} pIndex 
     * @param {Integer} dwflags 
     * @param {Integer} iReservedID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ishelliconoverlaymanager-getreservedoverlayinfo
     */
    GetReservedOverlayInfo(pwszPath, dwAttrib, pIndex, dwflags, iReservedID) {
        pwszPath := pwszPath is String ? StrPtr(pwszPath) : pwszPath

        pIndexMarshal := pIndex is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "ptr", pwszPath, "uint", dwAttrib, pIndexMarshal, pIndex, "uint", dwflags, "int", iReservedID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ishelliconoverlaymanager-refreshoverlayimages
     */
    RefreshOverlayImages(dwFlags) {
        result := ComCall(5, this, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ishelliconoverlaymanager-loadnonloadedoverlayidentifiers
     */
    LoadNonloadedOverlayIdentifiers() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iImage 
     * @param {Pointer<Integer>} piIndex 
     * @param {BOOL} fAdd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ishelliconoverlaymanager-overlayindexfromimageindex
     */
    OverlayIndexFromImageIndex(iImage, piIndex, fAdd) {
        piIndexMarshal := piIndex is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, "int", iImage, piIndexMarshal, piIndex, "int", fAdd, "HRESULT")
        return result
    }
}
