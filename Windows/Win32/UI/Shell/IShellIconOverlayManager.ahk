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
     * Gets the index of the icon overlay or the icon image for the specified file with the specified attributes.
     * @param {PWSTR} pwszPath Type: <b>PCWSTR</b>
     * 
     * The full path of the file.
     * @param {Integer} dwAttrib Type: <b>DWORD</b>
     * 
     * The attributes of the file. This parameter can be a combination of any of the file attribute flags (FILE_ATTRIBUTE_*) defined in the Windows header files. See <a href="https://docs.microsoft.com/windows/desktop/FileIO/file-attribute-constants">File Attribute Constants</a>.
     * @param {Integer} dwflags Type: <b>DWORD</b>
     * 
     * For the index of the icon overlay, use SIOM_OVERLAYINDEX. For the index of the icon image, use SIOM_ICONINDEX.
     * @returns {Integer} Type: <b>int*</b>
     * 
     * A pointer to the icon index in the system image list.
     * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/nf-shlobj_core-ishelliconoverlaymanager-getfileoverlayinfo
     */
    GetFileOverlayInfo(pwszPath, dwAttrib, dwflags) {
        pwszPath := pwszPath is String ? StrPtr(pwszPath) : pwszPath

        result := ComCall(3, this, "ptr", pwszPath, "uint", dwAttrib, "int*", &pIndex := 0, "uint", dwflags, "HRESULT")
        return pIndex
    }

    /**
     * Gets the index of the icon overlay or the icon image for the specified file with the specified attributes from one of the reserved overlays.
     * @param {PWSTR} pwszPath Type: <b>PCWSTR</b>
     * 
     * The full path of the file.
     * @param {Integer} dwAttrib Type: <b>DWORD</b>
     * 
     * The attributes of the file. This parameter can be a combination of any of the file attribute flags (FILE_ATTRIBUTE_*) defined in the Windows header files. See <a href="https://docs.microsoft.com/windows/desktop/FileIO/file-attribute-constants">File Attribute Constants</a>.
     * @param {Integer} dwflags Type: <b>DWORD</b>
     * 
     * For the index of the icon overlay, use SIOM_OVERLAYINDEX. For the index of the icon image, use SIOM_ICONINDEX.
     * @param {Integer} iReservedID Type: <b>int</b>
     * 
     * The reserved icon overlay ID.
     * @returns {Integer} Type: <b>int*</b>
     * 
     * The index of the icon image or icon overlay, depending on the value of <i>dwflags</i>.
     * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/nf-shlobj_core-ishelliconoverlaymanager-getreservedoverlayinfo
     */
    GetReservedOverlayInfo(pwszPath, dwAttrib, dwflags, iReservedID) {
        pwszPath := pwszPath is String ? StrPtr(pwszPath) : pwszPath

        result := ComCall(4, this, "ptr", pwszPath, "uint", dwAttrib, "int*", &pIndex := 0, "uint", dwflags, "int", iReservedID, "HRESULT")
        return pIndex
    }

    /**
     * Refreshes the overlay cache, the image list, or both.
     * @param {Integer} dwFlags Type: <b>DWORD</b>
     * 
     * Determines what to refresh. It can be a bitwise OR one of the following:
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method always returns S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/nf-shlobj_core-ishelliconoverlaymanager-refreshoverlayimages
     */
    RefreshOverlayImages(dwFlags) {
        result := ComCall(5, this, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * Loads any registered overlay identifiers, or handlers, that are not currently loaded.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not out of memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Out of memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/nf-shlobj_core-ishelliconoverlaymanager-loadnonloadedoverlayidentifiers
     */
    LoadNonloadedOverlayIdentifiers() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * Finds the index of an overlay image for the specified icon image. It can add an overlay if one is not found for the icon.
     * @param {Integer} iImage Type: <b>int</b>
     * 
     * The existing shell image list index to look for.
     * @param {BOOL} fAdd Type: <b>BOOL</b>
     * 
     * Whether to add an image if one is not already present.
     * @returns {Integer} Type: <b>int</b>
     * 
     * The returned overlay index.
     * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/nf-shlobj_core-ishelliconoverlaymanager-overlayindexfromimageindex
     */
    OverlayIndexFromImageIndex(iImage, fAdd) {
        result := ComCall(7, this, "int", iImage, "int*", &piIndex := 0, "int", fAdd, "HRESULT")
        return piIndex
    }
}
