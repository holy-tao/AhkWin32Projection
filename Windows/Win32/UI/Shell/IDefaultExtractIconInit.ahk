#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods to set default icons associated with an object.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-idefaultextracticoninit
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
     * Sets GIL_XXX flags.
     * @param {Integer} uFlags Type: <b>UINT</b>
     * 
     * Specifies return flags to get icon location.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idefaultextracticoninit-setflags
     */
    SetFlags(uFlags) {
        result := ComCall(3, this, "uint", uFlags, "HRESULT")
        return result
    }

    /**
     * Sets the registry key from which to load the &quot;DefaultIcon&quot; value.
     * @remarks
     * It is recommended that any call to <b>IDefaultExtractIconInit::SetKey</b> come before any calls to the SetXxxIcon methods.
     * @param {HKEY} _hkey 
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idefaultextracticoninit-setkey
     */
    SetKey(_hkey) {
        _hkey := _hkey is Win32Handle ? NumGet(_hkey, "ptr") : _hkey

        result := ComCall(4, this, "ptr", _hkey, "HRESULT")
        return result
    }

    /**
     * Sets the normal icon.
     * @param {PWSTR} pszFile Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer that contains the full icon path, including the file name and extension, as a Unicode string. This pointer can be <b>NULL</b>.
     * @param {Integer} iIcon Type: <b>int</b>
     * 
     * A Shell icon ID.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idefaultextracticoninit-setnormalicon
     */
    SetNormalIcon(pszFile, iIcon) {
        pszFile := pszFile is String ? StrPtr(pszFile) : pszFile

        result := ComCall(5, this, "ptr", pszFile, "int", iIcon, "HRESULT")
        return result
    }

    /**
     * Sets the icon that allows containers to specify an &quot;open&quot; look.
     * @param {PWSTR} pszFile Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer that contains the full icon path, including the file name and extension, as a Unicode string. This pointer can be <b>NULL</b>.
     * @param {Integer} iIcon Type: <b>int</b>
     * 
     * Shell icon ID.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idefaultextracticoninit-setopenicon
     */
    SetOpenIcon(pszFile, iIcon) {
        pszFile := pszFile is String ? StrPtr(pszFile) : pszFile

        result := ComCall(6, this, "ptr", pszFile, "int", iIcon, "HRESULT")
        return result
    }

    /**
     * Sets the icon for a shortcut to the object.
     * @param {PWSTR} pszFile Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer that contains the full icon path, including the file name and extension, as a Unicode string. This pointer can be <b>NULL</b>.
     * @param {Integer} iIcon Type: <b>int</b>
     * 
     * Shell icon ID.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idefaultextracticoninit-setshortcuticon
     */
    SetShortcutIcon(pszFile, iIcon) {
        pszFile := pszFile is String ? StrPtr(pszFile) : pszFile

        result := ComCall(7, this, "ptr", pszFile, "int", iIcon, "HRESULT")
        return result
    }

    /**
     * Sets the default icon.
     * @param {PWSTR} pszFile Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer that contains the full icon path, including the file name and extension, as a Unicode string. This pointer can be <b>NULL</b>.
     * @param {Integer} iIcon Type: <b>int</b>
     * 
     * The Shell icon ID.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idefaultextracticoninit-setdefaulticon
     */
    SetDefaultIcon(pszFile, iIcon) {
        pszFile := pszFile is String ? StrPtr(pszFile) : pszFile

        result := ComCall(8, this, "ptr", pszFile, "int", iIcon, "HRESULT")
        return result
    }
}
