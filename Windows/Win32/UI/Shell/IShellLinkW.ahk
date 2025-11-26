#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that create, modify, and resolve Shell links.
 * @remarks
 * 
 * <div class="alert"><b>Note</b>  This interface cannot be used to create a link to a URL.</div>
 * <div> </div>
 * The <b>IShellLink</b> interface has an ANSI version (<b>IShellLinkA</b>) and a Unicode version (<b>IShellLinkW</b>). The version that will be used depends on whether you compile for ANSI or Unicode.
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The shobjidl_core.h header defines IShellLink as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ishelllinkw
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 * @charset Unicode
 */
class IShellLinkW extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShellLinkW
     * @type {Guid}
     */
    static IID => Guid("{000214f9-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPath", "GetIDList", "SetIDList", "GetDescription", "SetDescription", "GetWorkingDirectory", "SetWorkingDirectory", "GetArguments", "SetArguments", "GetHotkey", "SetHotkey", "GetShowCmd", "SetShowCmd", "GetIconLocation", "SetIconLocation", "SetRelativePath", "Resolve", "SetPath"]

    /**
     * Gets the path and file name of the target of a Shell link object.
     * @param {PWSTR} pszFile Type: <b>LPTSTR</b>
     * 
     * The address of a buffer that receives the path and file name of the target of the Shell link object.
     * @param {Integer} cch Type: <b>int</b>
     * 
     * The size, in characters, of the buffer pointed to by the <i>pszFile</i> parameter, including the terminating null character. The maximum path size that can be returned is MAX_PATH. This parameter is commonly set by calling ARRAYSIZE(pszFile). The ARRAYSIZE macro is defined in Winnt.h.
     * @param {Pointer<WIN32_FIND_DATAW>} pfd Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-win32_find_dataa">WIN32_FIND_DATA</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-win32_find_dataa">WIN32_FIND_DATA</a> structure that receives information about the target of the Shell link object. If this parameter is <b>NULL</b>, then no additional information is returned.
     * @param {Integer} fFlags Type: <b>DWORD</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns <b>S_OK</b> if the operation is successful and a valid path is retrieved. If the operation is successful but no path is retrieved, it returns <b>S_FALSE</b> and <i>pszFile</i> will be empty. Otherwise, it returns one of the standard HRESULT error values.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishelllinkw-getpath
     */
    GetPath(pszFile, cch, pfd, fFlags) {
        pszFile := pszFile is String ? StrPtr(pszFile) : pszFile

        result := ComCall(3, this, "ptr", pszFile, "int", cch, "ptr", pfd, "uint", fFlags, "HRESULT")
        return result
    }

    /**
     * Gets the list of item identifiers for the target of a Shell link object.
     * @returns {Pointer<ITEMIDLIST>} Type: <b>PIDLIST_ABSOLUTE*</b>
     * 
     * When this method returns, contains the address of a PIDL.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishelllinkw-getidlist
     */
    GetIDList() {
        result := ComCall(4, this, "ptr*", &ppidl := 0, "HRESULT")
        return ppidl
    }

    /**
     * Sets the pointer to an item identifier list (PIDL) for a Shell link object.
     * @param {Pointer<ITEMIDLIST>} pidl Type: <b>PCIDLIST_ABSOLUTE</b>
     * 
     * The object's fully qualified PIDL.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishelllinkw-setidlist
     */
    SetIDList(pidl) {
        result := ComCall(5, this, "ptr", pidl, "HRESULT")
        return result
    }

    /**
     * Gets the description string for a Shell link object.
     * @param {PWSTR} pszName Type: <b>LPTSTR</b>
     * 
     * A pointer to the buffer that receives the description string.
     * @param {Integer} cch Type: <b>int</b>
     * 
     * The maximum number of characters to copy to the buffer pointed to by the <i>pszName</i> parameter.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishelllinkw-getdescription
     */
    GetDescription(pszName, cch) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(6, this, "ptr", pszName, "int", cch, "HRESULT")
        return result
    }

    /**
     * Sets the description for a Shell link object. The description can be any application-defined string.
     * @param {PWSTR} pszName Type: <b>LPCTSTR</b>
     * 
     * A pointer to a buffer containing the new description string.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishelllinkw-setdescription
     */
    SetDescription(pszName) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(7, this, "ptr", pszName, "HRESULT")
        return result
    }

    /**
     * Gets the name of the working directory for a Shell link object.
     * @param {PWSTR} pszDir Type: <b>LPTSTR</b>
     * 
     * The address of a buffer that receives the name of the working directory.
     * @param {Integer} cch Type: <b>int</b>
     * 
     * The maximum number of characters to copy to the buffer pointed to by the <i>pszDir</i> parameter. The name of the working directory is truncated if it is longer than the maximum specified by this parameter.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishelllinkw-getworkingdirectory
     */
    GetWorkingDirectory(pszDir, cch) {
        pszDir := pszDir is String ? StrPtr(pszDir) : pszDir

        result := ComCall(8, this, "ptr", pszDir, "int", cch, "HRESULT")
        return result
    }

    /**
     * Sets the name of the working directory for a Shell link object.
     * @param {PWSTR} pszDir Type: <b>LPCTSTR</b>
     * 
     * The address of a buffer that contains the name of the new working directory.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishelllinkw-setworkingdirectory
     */
    SetWorkingDirectory(pszDir) {
        pszDir := pszDir is String ? StrPtr(pszDir) : pszDir

        result := ComCall(9, this, "ptr", pszDir, "HRESULT")
        return result
    }

    /**
     * Gets the command-line arguments associated with a Shell link object.
     * @param {PWSTR} pszArgs Type: <b>LPTSTR</b>
     * 
     * A pointer to the buffer that, when this method returns successfully, receives the command-line arguments.
     * @param {Integer} cch Type: <b>int</b>
     * 
     * The maximum number of characters that can be copied to the buffer supplied by the <i>pszArgs</i> parameter. In the case of a Unicode string, there is no limitation on maximum string length. In the case of an ANSI string, the maximum length of the returned string varies depending on the version of Windows—MAX_PATH prior to Windows 2000 and INFOTIPSIZE (defined in Commctrl.h) in Windows 2000 and later.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishelllinkw-getarguments
     */
    GetArguments(pszArgs, cch) {
        pszArgs := pszArgs is String ? StrPtr(pszArgs) : pszArgs

        result := ComCall(10, this, "ptr", pszArgs, "int", cch, "HRESULT")
        return result
    }

    /**
     * Sets the command-line arguments for a Shell link object.
     * @param {PWSTR} pszArgs Type: <b>LPCTSTR</b>
     * 
     * A pointer to a buffer that contains the new command-line arguments. In the case of a Unicode string, there is no limitation on maximum string length. In the case of an ANSI string, the maximum length of the returned string varies depending on the version of Windows—MAX_PATH prior to Windows 2000 and INFOTIPSIZE (defined in Commctrl.h) in Windows 2000 and later.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishelllinkw-setarguments
     */
    SetArguments(pszArgs) {
        pszArgs := pszArgs is String ? StrPtr(pszArgs) : pszArgs

        result := ComCall(11, this, "ptr", pszArgs, "HRESULT")
        return result
    }

    /**
     * Gets the keyboard shortcut (hot key) for a Shell link object.
     * @returns {Integer} Type: <b>WORD*</b>
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishelllinkw-gethotkey
     */
    GetHotkey() {
        result := ComCall(12, this, "ushort*", &pwHotkey := 0, "HRESULT")
        return pwHotkey
    }

    /**
     * Sets a keyboard shortcut (hot key) for a Shell link object.
     * @param {Integer} wHotkey Type: <b>WORD</b>
     * 
     * The new keyboard shortcut. The virtual key code is in the low-order byte, and the modifier flags are in the high-order byte. The modifier flags can be a combination of the values specified in the description of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishelllinka-gethotkey">IShellLink::GetHotkey</a> method.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishelllinkw-sethotkey
     */
    SetHotkey(wHotkey) {
        result := ComCall(13, this, "ushort", wHotkey, "HRESULT")
        return result
    }

    /**
     * Gets the show command for a Shell link object.
     * @returns {Integer} Type: <b>int*</b>
     * 
     * A pointer to the command. The following commands are supported.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishelllinkw-getshowcmd
     */
    GetShowCmd() {
        result := ComCall(14, this, "int*", &piShowCmd := 0, "HRESULT")
        return piShowCmd
    }

    /**
     * Sets the show command for a Shell link object. The show command sets the initial show state of the window.
     * @param {Integer} iShowCmd Type: <b>int</b>
     * 
     * Command. <b>SetShowCmd</b> accepts one of the following <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-showwindow">ShowWindow</a> commands.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishelllinkw-setshowcmd
     */
    SetShowCmd(iShowCmd) {
        result := ComCall(15, this, "int", iShowCmd, "HRESULT")
        return result
    }

    /**
     * Gets the location (path and index) of the icon for a Shell link object.
     * @param {PWSTR} pszIconPath Type: <b>LPTSTR</b>
     * 
     * The address of a buffer that receives the path of the file containing the icon.
     * @param {Integer} cch Type: <b>int</b>
     * 
     * The maximum number of characters to copy to the buffer pointed to by the <i>pszIconPath</i> parameter.
     * @returns {Integer} Type: <b>int*</b>
     * 
     * The address of a value that receives the index of the icon.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishelllinkw-geticonlocation
     */
    GetIconLocation(pszIconPath, cch) {
        pszIconPath := pszIconPath is String ? StrPtr(pszIconPath) : pszIconPath

        result := ComCall(16, this, "ptr", pszIconPath, "int", cch, "int*", &piIcon := 0, "HRESULT")
        return piIcon
    }

    /**
     * Sets the location (path and index) of the icon for a Shell link object.
     * @param {PWSTR} pszIconPath Type: <b>LPCTSTR</b>
     * 
     * The address of a buffer to contain the path of the file containing the icon.
     * @param {Integer} iIcon Type: <b>int</b>
     * 
     * The index of the icon.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishelllinkw-seticonlocation
     */
    SetIconLocation(pszIconPath, iIcon) {
        pszIconPath := pszIconPath is String ? StrPtr(pszIconPath) : pszIconPath

        result := ComCall(17, this, "ptr", pszIconPath, "int", iIcon, "HRESULT")
        return result
    }

    /**
     * Sets the relative path to the Shell link object.
     * @param {PWSTR} pszPathRel Type: <b>LPCTSTR</b>
     * 
     * The address of a buffer that contains the fully-qualified path of the shortcut file, relative to which the shortcut resolution should be performed. It should be a file name, not a folder name.
     * @param {Integer} dwReserved Type: <b>DWORD</b>
     * 
     * Reserved. Set this parameter to zero.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishelllinkw-setrelativepath
     */
    SetRelativePath(pszPathRel, dwReserved) {
        pszPathRel := pszPathRel is String ? StrPtr(pszPathRel) : pszPathRel

        result := ComCall(18, this, "ptr", pszPathRel, "uint", dwReserved, "HRESULT")
        return result
    }

    /**
     * Attempts to find the target of a Shell link, even if it has been moved or renamed.
     * @param {HWND} hwnd Type: <b>HWND</b>
     * 
     * A handle to the window that the Shell will use as the parent for a dialog box. The Shell displays the dialog box if it needs to prompt the user for more information while resolving a Shell link.
     * @param {Integer} fFlags Type: <b>DWORD</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishelllinkw-resolve
     */
    Resolve(hwnd, fFlags) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(19, this, "ptr", hwnd, "uint", fFlags, "HRESULT")
        return result
    }

    /**
     * Sets the path and file name for the target of a Shell link object.
     * @param {PWSTR} pszFile Type: <b>LPCTSTR</b>
     * 
     * The address of a buffer that contains the new path.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishelllinkw-setpath
     */
    SetPath(pszFile) {
        pszFile := pszFile is String ? StrPtr(pszFile) : pszFile

        result := ComCall(20, this, "ptr", pszFile, "HRESULT")
        return result
    }
}
