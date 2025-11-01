#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods to create a new Internet shortcut.
 * @remarks
 * 
  * You do not typically implement <b>INewShortcutHook</b>. It is implemented by the Shell for Internet shortcuts.
  * 
  * You use <b>INewShortcutHook</b> when creating a new Internet shortcut. The methods provided by this interface are supplied as a convenience.
  * 
  * <b>INewShortcutHook</b> is derived from <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>. The listed methods are specific to <b>INewShortcutHook</b>.
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The shlobj.h header defines INewShortcutHook as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shlobj/nn-shlobj-inewshortcuthooka
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 * @charset ANSI
 */
class INewShortcutHookA extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INewShortcutHookA
     * @type {Guid}
     */
    static IID => Guid("{000214e1-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetReferent", "GetReferent", "SetFolder", "GetFolder", "GetName", "GetExtension"]

    /**
     * 
     * @param {PSTR} pcszReferent 
     * @param {HWND} hwnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj/nf-shlobj-inewshortcuthooka-setreferent
     */
    SetReferent(pcszReferent, hwnd) {
        pcszReferent := pcszReferent is String ? StrPtr(pcszReferent) : pcszReferent
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(3, this, "ptr", pcszReferent, "ptr", hwnd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} pszReferent 
     * @param {Integer} cchReferent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj/nf-shlobj-inewshortcuthooka-getreferent
     */
    GetReferent(pszReferent, cchReferent) {
        pszReferent := pszReferent is String ? StrPtr(pszReferent) : pszReferent

        result := ComCall(4, this, "ptr", pszReferent, "int", cchReferent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} pcszFolder 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj/nf-shlobj-inewshortcuthooka-setfolder
     */
    SetFolder(pcszFolder) {
        pcszFolder := pcszFolder is String ? StrPtr(pcszFolder) : pcszFolder

        result := ComCall(5, this, "ptr", pcszFolder, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} pszFolder 
     * @param {Integer} cchFolder 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj/nf-shlobj-inewshortcuthooka-getfolder
     */
    GetFolder(pszFolder, cchFolder) {
        pszFolder := pszFolder is String ? StrPtr(pszFolder) : pszFolder

        result := ComCall(6, this, "ptr", pszFolder, "int", cchFolder, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} pszName 
     * @param {Integer} cchName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj/nf-shlobj-inewshortcuthooka-getname
     */
    GetName(pszName, cchName) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(7, this, "ptr", pszName, "int", cchName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} pszExtension 
     * @param {Integer} cchExtension 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj/nf-shlobj-inewshortcuthooka-getextension
     */
    GetExtension(pszExtension, cchExtension) {
        pszExtension := pszExtension is String ? StrPtr(pszExtension) : pszExtension

        result := ComCall(8, this, "ptr", pszExtension, "int", cchExtension, "HRESULT")
        return result
    }
}
