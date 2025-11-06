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
     * 
     * @param {PWSTR} pwszPath 
     * @param {Integer} dwAttrib 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishelliconoverlayidentifier-ismemberof
     */
    IsMemberOf(pwszPath, dwAttrib) {
        pwszPath := pwszPath is String ? StrPtr(pwszPath) : pwszPath

        result := ComCall(3, this, "ptr", pwszPath, "uint", dwAttrib, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszIconFile 
     * @param {Integer} cchMax 
     * @param {Pointer<Integer>} pIndex 
     * @param {Pointer<Integer>} pdwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishelliconoverlayidentifier-getoverlayinfo
     */
    GetOverlayInfo(pwszIconFile, cchMax, pIndex, pdwFlags) {
        pwszIconFile := pwszIconFile is String ? StrPtr(pwszIconFile) : pwszIconFile

        pIndexMarshal := pIndex is VarRef ? "int*" : "ptr"
        pdwFlagsMarshal := pdwFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", pwszIconFile, "int", cchMax, pIndexMarshal, pIndex, pdwFlagsMarshal, pdwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishelliconoverlayidentifier-getpriority
     */
    GetPriority() {
        result := ComCall(5, this, "int*", &pPriority := 0, "HRESULT")
        return pPriority
    }
}
