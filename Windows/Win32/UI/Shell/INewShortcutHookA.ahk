#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods to create a new Internet shortcut. (ANSI)
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api//content/shlobj/nn-shlobj-inewshortcuthooka
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
     * Sets the referent of the shortcut object. (ANSI)
     * @remarks
     * For Internet shortcut objects, this method is the same as <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/dd565676(v=vs.85)">IUniformResourceLocator::SetURL</a>.
     * @param {PSTR} pcszReferent TBD
     * @param {HWND} hwnd_ TBD
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/shlobj/nf-shlobj-inewshortcuthooka-setreferent
     */
    SetReferent(pcszReferent, hwnd_) {
        pcszReferent := pcszReferent is String ? StrPtr(pcszReferent) : pcszReferent
        hwnd_ := hwnd_ is Win32Handle ? NumGet(hwnd_, "ptr") : hwnd_

        result := ComCall(3, this, "ptr", pcszReferent, "ptr", hwnd_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the referent of the shortcut object. (ANSI)
     * @remarks
     * For Internet shortcut objects, this method is the same as <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/dd565674(v=vs.85)">IUniformResourceLocator::GetURL</a>.
     * @param {PSTR} pszReferent Type: <b>PTSTR</b>
     * 
     * A pointer to a string that receives the referent.
     * @param {Integer} cchReferent Type: <b>int</b>
     * 
     * The size of the buffer at <i>pszReferent</i>, in characters.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/shlobj/nf-shlobj-inewshortcuthooka-getreferent
     */
    GetReferent(pszReferent, cchReferent) {
        pszReferent := pszReferent is String ? StrPtr(pszReferent) : pszReferent

        result := ComCall(4, this, "ptr", pszReferent, "int", cchReferent, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the folder name for the shortcut object. (ANSI)
     * @param {PSTR} pcszFolder TBD
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/shlobj/nf-shlobj-inewshortcuthooka-setfolder
     */
    SetFolder(pcszFolder) {
        pcszFolder := pcszFolder is String ? StrPtr(pcszFolder) : pcszFolder

        result := ComCall(5, this, "ptr", pcszFolder, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the folder name for the shortcut object. (ANSI)
     * @param {PSTR} pszFolder Type: <b>PTSTR</b>
     * 
     * The address of a character buffer that receives the folder name.
     * @param {Integer} cchFolder Type: <b>int</b>
     * 
     * The size of the buffer at <i>pszFolder</i>, in characters.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, S_FALSE if no folder has been assigned, or a standard error code otherwise.
     * @see https://learn.microsoft.com/windows/win32/api//content/shlobj/nf-shlobj-inewshortcuthooka-getfolder
     */
    GetFolder(pszFolder, cchFolder) {
        pszFolder := pszFolder is String ? StrPtr(pszFolder) : pszFolder

        result := ComCall(6, this, "ptr", pszFolder, "int", cchFolder, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the file name of the shortcut object, without the extension. (ANSI)
     * @param {PSTR} pszName Type: <b>PTSTR</b>
     * 
     * A pointer to a string that receives the name.
     * @param {Integer} cchName Type: <b>int</b>
     * 
     * The size of the buffer at <i>pszName</i>, in characters.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/shlobj/nf-shlobj-inewshortcuthooka-getname
     */
    GetName(pszName, cchName) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(7, this, "ptr", pszName, "int", cchName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the file name extension for the shortcut object. (ANSI)
     * @param {PSTR} pszExtension Type: <b>PTSTR</b>
     * 
     * Pointer to a string that receives the extension.
     * @param {Integer} cchExtension Type: <b>int</b>
     * 
     * The size of the buffer at <i>pszExtension</i>, in characters.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/shlobj/nf-shlobj-inewshortcuthooka-getextension
     */
    GetExtension(pszExtension, cchExtension) {
        pszExtension := pszExtension is String ? StrPtr(pszExtension) : pszExtension

        result := ComCall(8, this, "ptr", pszExtension, "int", cchExtension, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
