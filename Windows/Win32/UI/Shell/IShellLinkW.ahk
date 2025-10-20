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
     * The GetPath function retrieves the coordinates defining the endpoints of lines and the control points of curves found in the path that is selected into the specified device context.
     * @param {PWSTR} pszFile 
     * @param {Integer} cch 
     * @param {Pointer<WIN32_FIND_DATAW>} pfd 
     * @param {Integer} fFlags 
     * @returns {HRESULT} If the <i>nSize</i> parameter is nonzero, the return value is the number of points enumerated. If <i>nSize</i> is 0, the return value is the total number of points in the path (and <b>GetPath</b> writes nothing to the buffers). If <i>nSize</i> is nonzero and is less than the number of points in the path, the return value is 1.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getpath
     */
    GetPath(pszFile, cch, pfd, fFlags) {
        pszFile := pszFile is String ? StrPtr(pszFile) : pszFile

        result := ComCall(3, this, "ptr", pszFile, "int", cch, "ptr", pfd, "uint", fFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<ITEMIDLIST>>} ppidl 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishelllinkw-getidlist
     */
    GetIDList(ppidl) {
        result := ComCall(4, this, "ptr*", ppidl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITEMIDLIST>} pidl 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishelllinkw-setidlist
     */
    SetIDList(pidl) {
        result := ComCall(5, this, "ptr", pidl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszName 
     * @param {Integer} cch 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishelllinkw-getdescription
     */
    GetDescription(pszName, cch) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(6, this, "ptr", pszName, "int", cch, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishelllinkw-setdescription
     */
    SetDescription(pszName) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(7, this, "ptr", pszName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszDir 
     * @param {Integer} cch 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishelllinkw-getworkingdirectory
     */
    GetWorkingDirectory(pszDir, cch) {
        pszDir := pszDir is String ? StrPtr(pszDir) : pszDir

        result := ComCall(8, this, "ptr", pszDir, "int", cch, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszDir 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishelllinkw-setworkingdirectory
     */
    SetWorkingDirectory(pszDir) {
        pszDir := pszDir is String ? StrPtr(pszDir) : pszDir

        result := ComCall(9, this, "ptr", pszDir, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszArgs 
     * @param {Integer} cch 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishelllinkw-getarguments
     */
    GetArguments(pszArgs, cch) {
        pszArgs := pszArgs is String ? StrPtr(pszArgs) : pszArgs

        result := ComCall(10, this, "ptr", pszArgs, "int", cch, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszArgs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishelllinkw-setarguments
     */
    SetArguments(pszArgs) {
        pszArgs := pszArgs is String ? StrPtr(pszArgs) : pszArgs

        result := ComCall(11, this, "ptr", pszArgs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pwHotkey 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishelllinkw-gethotkey
     */
    GetHotkey(pwHotkey) {
        result := ComCall(12, this, "ushort*", pwHotkey, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wHotkey 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishelllinkw-sethotkey
     */
    SetHotkey(wHotkey) {
        result := ComCall(13, this, "ushort", wHotkey, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} piShowCmd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishelllinkw-getshowcmd
     */
    GetShowCmd(piShowCmd) {
        result := ComCall(14, this, "int*", piShowCmd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iShowCmd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishelllinkw-setshowcmd
     */
    SetShowCmd(iShowCmd) {
        result := ComCall(15, this, "int", iShowCmd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszIconPath 
     * @param {Integer} cch 
     * @param {Pointer<Integer>} piIcon 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishelllinkw-geticonlocation
     */
    GetIconLocation(pszIconPath, cch, piIcon) {
        pszIconPath := pszIconPath is String ? StrPtr(pszIconPath) : pszIconPath

        result := ComCall(16, this, "ptr", pszIconPath, "int", cch, "int*", piIcon, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszIconPath 
     * @param {Integer} iIcon 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishelllinkw-seticonlocation
     */
    SetIconLocation(pszIconPath, iIcon) {
        pszIconPath := pszIconPath is String ? StrPtr(pszIconPath) : pszIconPath

        result := ComCall(17, this, "ptr", pszIconPath, "int", iIcon, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPathRel 
     * @param {Integer} dwReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishelllinkw-setrelativepath
     */
    SetRelativePath(pszPathRel, dwReserved) {
        pszPathRel := pszPathRel is String ? StrPtr(pszPathRel) : pszPathRel

        result := ComCall(18, this, "ptr", pszPathRel, "uint", dwReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @param {Integer} fFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishelllinkw-resolve
     */
    Resolve(hwnd, fFlags) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(19, this, "ptr", hwnd, "uint", fFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszFile 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishelllinkw-setpath
     */
    SetPath(pszFile) {
        pszFile := pszFile is String ? StrPtr(pszFile) : pszFile

        result := ComCall(20, this, "ptr", pszFile, "HRESULT")
        return result
    }
}
