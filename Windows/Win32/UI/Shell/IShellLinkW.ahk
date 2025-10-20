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

        result := ComCall(3, this, "ptr", pszFile, "int", cch, "ptr", pfd, "uint", fFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITEMIDLIST>} ppidl 
     * @returns {HRESULT} 
     */
    GetIDList(ppidl) {
        result := ComCall(4, this, "ptr", ppidl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITEMIDLIST>} pidl 
     * @returns {HRESULT} 
     */
    SetIDList(pidl) {
        result := ComCall(5, this, "ptr", pidl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszName 
     * @param {Integer} cch 
     * @returns {HRESULT} 
     */
    GetDescription(pszName, cch) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(6, this, "ptr", pszName, "int", cch, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszName 
     * @returns {HRESULT} 
     */
    SetDescription(pszName) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(7, this, "ptr", pszName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszDir 
     * @param {Integer} cch 
     * @returns {HRESULT} 
     */
    GetWorkingDirectory(pszDir, cch) {
        pszDir := pszDir is String ? StrPtr(pszDir) : pszDir

        result := ComCall(8, this, "ptr", pszDir, "int", cch, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszDir 
     * @returns {HRESULT} 
     */
    SetWorkingDirectory(pszDir) {
        pszDir := pszDir is String ? StrPtr(pszDir) : pszDir

        result := ComCall(9, this, "ptr", pszDir, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszArgs 
     * @param {Integer} cch 
     * @returns {HRESULT} 
     */
    GetArguments(pszArgs, cch) {
        pszArgs := pszArgs is String ? StrPtr(pszArgs) : pszArgs

        result := ComCall(10, this, "ptr", pszArgs, "int", cch, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszArgs 
     * @returns {HRESULT} 
     */
    SetArguments(pszArgs) {
        pszArgs := pszArgs is String ? StrPtr(pszArgs) : pszArgs

        result := ComCall(11, this, "ptr", pszArgs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} pwHotkey 
     * @returns {HRESULT} 
     */
    GetHotkey(pwHotkey) {
        result := ComCall(12, this, "ushort*", pwHotkey, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wHotkey 
     * @returns {HRESULT} 
     */
    SetHotkey(wHotkey) {
        result := ComCall(13, this, "ushort", wHotkey, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} piShowCmd 
     * @returns {HRESULT} 
     */
    GetShowCmd(piShowCmd) {
        result := ComCall(14, this, "int*", piShowCmd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iShowCmd 
     * @returns {HRESULT} 
     */
    SetShowCmd(iShowCmd) {
        result := ComCall(15, this, "int", iShowCmd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszIconPath 
     * @param {Integer} cch 
     * @param {Pointer<Int32>} piIcon 
     * @returns {HRESULT} 
     */
    GetIconLocation(pszIconPath, cch, piIcon) {
        pszIconPath := pszIconPath is String ? StrPtr(pszIconPath) : pszIconPath

        result := ComCall(16, this, "ptr", pszIconPath, "int", cch, "int*", piIcon, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszIconPath 
     * @param {Integer} iIcon 
     * @returns {HRESULT} 
     */
    SetIconLocation(pszIconPath, iIcon) {
        pszIconPath := pszIconPath is String ? StrPtr(pszIconPath) : pszIconPath

        result := ComCall(17, this, "ptr", pszIconPath, "int", iIcon, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszPathRel 
     * @param {Integer} dwReserved 
     * @returns {HRESULT} 
     */
    SetRelativePath(pszPathRel, dwReserved) {
        pszPathRel := pszPathRel is String ? StrPtr(pszPathRel) : pszPathRel

        result := ComCall(18, this, "ptr", pszPathRel, "uint", dwReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @param {Integer} fFlags 
     * @returns {HRESULT} 
     */
    Resolve(hwnd, fFlags) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(19, this, "ptr", hwnd, "uint", fFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszFile 
     * @returns {HRESULT} 
     */
    SetPath(pszFile) {
        pszFile := pszFile is String ? StrPtr(pszFile) : pszFile

        result := ComCall(20, this, "ptr", pszFile, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
