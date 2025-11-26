#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that handle all communication between icon overlay handlers and the Shell.
 * @remarks
 * 
 * Icon overlays are small images placed at the lower-left corner of the icon that represents a Shell object in Windows Explorer or on the desktop. They are used to add some extra information to the object's normal icon. A commonly used icon overlay is the small arrow that indicates that a file or folder is actually a link. You can specify custom icon overlays for Shell objects by implementing and registering an icon overlay handler.
 * 
 * Icon overlay handlers are Component Object Model (COM) objects that are associated with a particular icon overlay. For a general discussion of icon overlay handlers, see <a href="https://docs.microsoft.com/windows/desktop/shell/how-to-implement-icon-overlay-handlers">How to Implement Icon Overlay Handlers</a>.
 * 
 * This interface must be implemented by all icon overlay handlers.
 * 
 * This interface is not typically called by applications.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ishelliconoverlayidentifier
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellIconOverlayIdentifier extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShellIconOverlayIdentifier
     * @type {Guid}
     */
    static IID => Guid("{0c6c4200-c589-11d0-999a-00c04fd655e1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsMemberOf", "GetOverlayInfo", "GetPriority"]

    /**
     * Specifies whether an icon overlay should be added to a Shell object's icon.
     * @param {PWSTR} pwszPath Type: <b>PCWSTR</b>
     * 
     * A Unicode string that contains the fully qualified path of the Shell object.
     * @param {Integer} dwAttrib Type: <b>DWORD</b>
     * 
     * The object's attributes. For a complete list of file attributes and their associated flags, see <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-getattributesof">IShellFolder::GetAttributesOf</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method returns one of the following:
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
     * The icon overlay should be displayed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The icon overlay should not be displayed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishelliconoverlayidentifier-ismemberof
     */
    IsMemberOf(pwszPath, dwAttrib) {
        pwszPath := pwszPath is String ? StrPtr(pwszPath) : pwszPath

        result := ComCall(3, this, "ptr", pwszPath, "uint", dwAttrib, "HRESULT")
        return result
    }

    /**
     * Provides the location of the icon overlay's bitmap.
     * @param {PWSTR} pwszIconFile Type: <b>PWSTR</b>
     * 
     * A null-terminated Unicode string that contains the fully qualified path of the file containing the icon. The .dll, .exe, and .ico file types are all acceptable. You must set the <b>ISIOI_ICONFILE</b> flag in <i>pdwFlags</i> if you return a file name.
     * @param {Integer} cchMax Type: <b>int</b>
     * 
     * The size of the <i>pwszIconFile</i> buffer, in Unicode characters.
     * @param {Pointer<Integer>} pIndex Type: <b>int*</b>
     * 
     * Pointer to an index value used to identify the icon in a file that contains multiple icons. You must set the <b>ISIOI_ICONINDEX</b> flag in <i>pdwFlags</i> if you return an index.
     * @param {Pointer<Integer>} pdwFlags Type: <b>DWORD*</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishelliconoverlayidentifier-getoverlayinfo
     */
    GetOverlayInfo(pwszIconFile, cchMax, pIndex, pdwFlags) {
        pwszIconFile := pwszIconFile is String ? StrPtr(pwszIconFile) : pwszIconFile

        pIndexMarshal := pIndex is VarRef ? "int*" : "ptr"
        pdwFlagsMarshal := pdwFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", pwszIconFile, "int", cchMax, pIndexMarshal, pIndex, pdwFlagsMarshal, pdwFlags, "HRESULT")
        return result
    }

    /**
     * Specifies the priority of an icon overlay.
     * @returns {Integer} Type: <b>int*</b>
     * 
     * The address of a value that indicates the priority of the overlay identifier. Possible values range from zero to 100, with zero the highest priority.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishelliconoverlayidentifier-getpriority
     */
    GetPriority() {
        result := ComCall(5, this, "int*", &pPriority := 0, "HRESULT")
        return pPriority
    }
}
