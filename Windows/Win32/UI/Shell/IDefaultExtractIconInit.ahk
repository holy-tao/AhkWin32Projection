#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods to set default icons associated with an object.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-idefaultextracticoninit
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IDefaultExtractIconInit extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDefaultExtractIconInit
     * @type {Guid}
     */
    static IID => Guid("{41ded17d-d6b3-4261-997d-88c60e4b1d58}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetFlags", "SetKey", "SetNormalIcon", "SetOpenIcon", "SetShortcutIcon", "SetDefaultIcon"]

    /**
     * Specifies how the recognizer interprets the ink and determines the result string.Call this function before processing the ink for the first time. Therefore, call the SetFlags function before calling the Process function.
     * @param {Integer} uFlags 
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>HRESULT value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The flag is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The recognizer does not support this function.
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
     * Unable to allocate memory to complete the operation.
     * 
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
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The context is invalid or one of the parameters is an invalid pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//recapis/nf-recapis-setflags
     */
    SetFlags(uFlags) {
        result := ComCall(3, this, "uint", uFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HKEY} hkey 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idefaultextracticoninit-setkey
     */
    SetKey(hkey) {
        hkey := hkey is Win32Handle ? NumGet(hkey, "ptr") : hkey

        result := ComCall(4, this, "ptr", hkey, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszFile 
     * @param {Integer} iIcon 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idefaultextracticoninit-setnormalicon
     */
    SetNormalIcon(pszFile, iIcon) {
        pszFile := pszFile is String ? StrPtr(pszFile) : pszFile

        result := ComCall(5, this, "ptr", pszFile, "int", iIcon, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszFile 
     * @param {Integer} iIcon 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idefaultextracticoninit-setopenicon
     */
    SetOpenIcon(pszFile, iIcon) {
        pszFile := pszFile is String ? StrPtr(pszFile) : pszFile

        result := ComCall(6, this, "ptr", pszFile, "int", iIcon, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszFile 
     * @param {Integer} iIcon 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idefaultextracticoninit-setshortcuticon
     */
    SetShortcutIcon(pszFile, iIcon) {
        pszFile := pszFile is String ? StrPtr(pszFile) : pszFile

        result := ComCall(7, this, "ptr", pszFile, "int", iIcon, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszFile 
     * @param {Integer} iIcon 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idefaultextracticoninit-setdefaulticon
     */
    SetDefaultIcon(pszFile, iIcon) {
        pszFile := pszFile is String ? StrPtr(pszFile) : pszFile

        result := ComCall(8, this, "ptr", pszFile, "int", iIcon, "HRESULT")
        return result
    }
}
