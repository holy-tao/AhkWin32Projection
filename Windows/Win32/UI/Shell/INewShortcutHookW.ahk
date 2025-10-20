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
 * @see https://docs.microsoft.com/windows/win32/api//shlobj/nn-shlobj-inewshortcuthookw
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 * @charset Unicode
 */
class INewShortcutHookW extends IUnknown{
    /**
     * The interface identifier for INewShortcutHookW
     * @type {Guid}
     */
    static IID => Guid("{000214f7-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} pcszReferent 
     * @param {HWND} hwnd 
     * @returns {HRESULT} 
     */
    SetReferent(pcszReferent, hwnd) {
        pcszReferent := pcszReferent is String ? StrPtr(pcszReferent) : pcszReferent
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(3, this, "ptr", pcszReferent, "ptr", hwnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszReferent 
     * @param {Integer} cchReferent 
     * @returns {HRESULT} 
     */
    GetReferent(pszReferent, cchReferent) {
        pszReferent := pszReferent is String ? StrPtr(pszReferent) : pszReferent

        result := ComCall(4, this, "ptr", pszReferent, "int", cchReferent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pcszFolder 
     * @returns {HRESULT} 
     */
    SetFolder(pcszFolder) {
        pcszFolder := pcszFolder is String ? StrPtr(pcszFolder) : pcszFolder

        result := ComCall(5, this, "ptr", pcszFolder, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszFolder 
     * @param {Integer} cchFolder 
     * @returns {HRESULT} 
     */
    GetFolder(pszFolder, cchFolder) {
        pszFolder := pszFolder is String ? StrPtr(pszFolder) : pszFolder

        result := ComCall(6, this, "ptr", pszFolder, "int", cchFolder, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszName 
     * @param {Integer} cchName 
     * @returns {HRESULT} 
     */
    GetName(pszName, cchName) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(7, this, "ptr", pszName, "int", cchName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszExtension 
     * @param {Integer} cchExtension 
     * @returns {HRESULT} 
     */
    GetExtension(pszExtension, cchExtension) {
        pszExtension := pszExtension is String ? StrPtr(pszExtension) : pszExtension

        result := ComCall(8, this, "ptr", pszExtension, "int", cchExtension, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
