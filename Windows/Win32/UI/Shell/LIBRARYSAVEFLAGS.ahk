#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the options for handling a name collision when saving a library.
 * @remarks
 * 
 * <h3><a id="Used_By"></a><a id="used_by"></a><a id="USED_BY"></a>Used By</h3>
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishelllibrary-save">IShellLibrary::Save</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishelllibrary-saveinknownfolder">IShellLibrary::SaveInKnownFolder</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-shsavelibraryinfolderpath">SHSaveLibraryInFolderPath</a>
 * </li>
 * </ul>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/ne-shobjidl_core-librarysaveflags
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class LIBRARYSAVEFLAGS{

    /**
     * If a library with the same name already exists, the save operation fails.
     * @type {Integer (Int32)}
     */
    static LSF_FAILIFTHERE => 0

    /**
     * If a library with the same name already exists, the save operation overwrites the existing library.
     * @type {Integer (Int32)}
     */
    static LSF_OVERRIDEEXISTING => 1

    /**
     * If a library with the same name already exists, the save operation generates a new, unique name for the library.
     * @type {Integer (Int32)}
     */
    static LSF_MAKEUNIQUENAME => 2
}
