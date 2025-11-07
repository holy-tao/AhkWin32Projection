#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IShellItem.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods for creating and managing libraries.
 * @remarks
 * 
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * Custom implementations of <b>IShellLibrary</b> are not supported; client applications use the implementation provided by Shell32.dll.
 * 
 * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
 * Use <b>IShellLibrary</b> to create a new library, query or update the attributes of an existing library.
 * 
 * <h3><a id="Library_Helper_Functions"></a><a id="library_helper_functions"></a><a id="LIBRARY_HELPER_FUNCTIONS"></a>Library Helper Functions</h3>
 * The following library helper functions are provided by Shobjidl.h.
 * 
 * 
 * <table class="clsStd">
 * <tr>
 * <th>Name</th>
 * <th>Summary</th>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-shaddfolderpathtolibrary">SHAddFolderPathToLibrary</a>
 * </td>
 * <td>Adds a folder to a library.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-shcreatelibrary">SHCreateLibrary</a>
 * </td>
 * <td>Creates an <b>IShellLibrary</b> object.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-shloadlibraryfromitem">SHLoadLibraryFromItem</a>
 * </td>
 * <td>Creates and loads an <b>IShellLibrary</b> object from a specified library definition file.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-shloadlibraryfromknownfolder">SHLoadLibraryFromKnownFolder</a>
 * </td>
 * <td>Creates and loads an <b>IShellLibrary</b> object for a specified <a href="https://docs.microsoft.com/windows/desktop/shell/knownfolderid">KNOWNFOLDERID</a>.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-shloadlibraryfromparsingname">SHLoadLibraryFromParsingName</a>
 * </td>
 * <td>Creates and loads an <b>IShellLibrary</b> object for a specified path.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-shremovefolderpathfromlibrary">SHRemoveFolderPathFromLibrary</a>
 * </td>
 * <td>Removes a folder from a library.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/nf-shobjidl-shresolvefolderpathinlibrary">SHResolveFolderPathInLibrary</a>
 * </td>
 * <td>Attempts to resolve the target location of a library folder that has been moved or renamed.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-shresolvelibrary">SHResolveLibrary</a>
 * </td>
 * <td>Attempts to find the location of a library.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-shsavelibraryinfolderpath">SHSaveLibraryInFolderPath</a>
 * </td>
 * <td>Saves an <b>IShellLibrary</b> object to disk.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-shshowmanagelibraryui">SHShowManageLibraryUI</a>
 * </td>
 * <td>Shows the library management dialog, which enables users to manage the library folders and default save location.</td>
 * </tr>
 * </table>
 *  
 * 
 * 
 * 
 * <h3><a id="Library_Enumerations"></a><a id="library_enumerations"></a><a id="LIBRARY_ENUMERATIONS"></a>Library Enumerations</h3>
 * The following enumerations support libraries.
 * 
 * 
 * <table class="clsStd">
 * <tr>
 * <th>Name</th>
 * <th>Summary</th>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-defaultsavefoldertype">DEFAULTSAVEFOLDERTYPE</a>
 * </td>
 * <td>Specifies whether the default save location is public or private.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-libraryoptionflags">LIBRARYOPTIONFLAGS</a>
 * </td>
 * <td>Specifies the library options.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-librarysaveflags">LIBRARYSAVEFLAGS</a>
 * </td>
 * <td>Defines options for handling a name collision when saving a library.</td>
 * </tr>
 * </table>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ishelllibrary
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellLibrary extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShellLibrary
     * @type {Guid}
     */
    static IID => Guid("{11a66efa-382e-451a-9234-1e0e12ef3085}")

    /**
     * The class identifier for ShellLibrary
     * @type {Guid}
     */
    static CLSID => Guid("{d9b3211d-e57f-4426-aaef-30a806add397}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["LoadLibraryFromItem", "LoadLibraryFromKnownFolder", "AddFolder", "RemoveFolder", "GetFolders", "ResolveFolder", "GetDefaultSaveFolder", "SetDefaultSaveFolder", "GetOptions", "SetOptions", "GetFolderType", "SetFolderType", "GetIcon", "SetIcon", "Commit", "Save", "SaveInKnownFolder"]

    /**
     * 
     * @param {IShellItem} psiLibrary 
     * @param {Integer} grfMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishelllibrary-loadlibraryfromitem
     */
    LoadLibraryFromItem(psiLibrary, grfMode) {
        result := ComCall(3, this, "ptr", psiLibrary, "uint", grfMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} kfidLibrary 
     * @param {Integer} grfMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishelllibrary-loadlibraryfromknownfolder
     */
    LoadLibraryFromKnownFolder(kfidLibrary, grfMode) {
        result := ComCall(4, this, "ptr", kfidLibrary, "uint", grfMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellItem} psiLocation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishelllibrary-addfolder
     */
    AddFolder(psiLocation) {
        result := ComCall(5, this, "ptr", psiLocation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellItem} psiLocation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishelllibrary-removefolder
     */
    RemoveFolder(psiLocation) {
        result := ComCall(6, this, "ptr", psiLocation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lff 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishelllibrary-getfolders
     */
    GetFolders(lff, riid) {
        result := ComCall(7, this, "int", lff, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @param {IShellItem} psiFolderToResolve 
     * @param {Integer} dwTimeout 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishelllibrary-resolvefolder
     */
    ResolveFolder(psiFolderToResolve, dwTimeout, riid) {
        result := ComCall(8, this, "ptr", psiFolderToResolve, "uint", dwTimeout, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @param {Integer} dsft 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishelllibrary-getdefaultsavefolder
     */
    GetDefaultSaveFolder(dsft, riid) {
        result := ComCall(9, this, "int", dsft, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @param {Integer} dsft 
     * @param {IShellItem} psi 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishelllibrary-setdefaultsavefolder
     */
    SetDefaultSaveFolder(dsft, psi) {
        result := ComCall(10, this, "int", dsft, "ptr", psi, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishelllibrary-getoptions
     */
    GetOptions() {
        result := ComCall(11, this, "int*", &plofOptions := 0, "HRESULT")
        return plofOptions
    }

    /**
     * 
     * @param {Integer} lofMask 
     * @param {Integer} lofOptions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishelllibrary-setoptions
     */
    SetOptions(lofMask, lofOptions) {
        result := ComCall(12, this, "int", lofMask, "int", lofOptions, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishelllibrary-getfoldertype
     */
    GetFolderType() {
        pftid := Guid()
        result := ComCall(13, this, "ptr", pftid, "HRESULT")
        return pftid
    }

    /**
     * 
     * @param {Pointer<Guid>} ftid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishelllibrary-setfoldertype
     */
    SetFolderType(ftid) {
        result := ComCall(14, this, "ptr", ftid, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishelllibrary-geticon
     */
    GetIcon() {
        result := ComCall(15, this, "ptr*", &ppszIcon := 0, "HRESULT")
        return ppszIcon
    }

    /**
     * 
     * @param {PWSTR} pszIcon 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishelllibrary-seticon
     */
    SetIcon(pszIcon) {
        pszIcon := pszIcon is String ? StrPtr(pszIcon) : pszIcon

        result := ComCall(16, this, "ptr", pszIcon, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishelllibrary-commit
     */
    Commit() {
        result := ComCall(17, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellItem} psiFolderToSaveIn 
     * @param {PWSTR} pszLibraryName 
     * @param {Integer} lsf 
     * @returns {IShellItem} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishelllibrary-save
     */
    Save(psiFolderToSaveIn, pszLibraryName, lsf) {
        pszLibraryName := pszLibraryName is String ? StrPtr(pszLibraryName) : pszLibraryName

        result := ComCall(18, this, "ptr", psiFolderToSaveIn, "ptr", pszLibraryName, "int", lsf, "ptr*", &ppsiSavedTo := 0, "HRESULT")
        return IShellItem(ppsiSavedTo)
    }

    /**
     * 
     * @param {Pointer<Guid>} kfidToSaveIn 
     * @param {PWSTR} pszLibraryName 
     * @param {Integer} lsf 
     * @returns {IShellItem} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishelllibrary-saveinknownfolder
     */
    SaveInKnownFolder(kfidToSaveIn, pszLibraryName, lsf) {
        pszLibraryName := pszLibraryName is String ? StrPtr(pszLibraryName) : pszLibraryName

        result := ComCall(19, this, "ptr", kfidToSaveIn, "ptr", pszLibraryName, "int", lsf, "ptr*", &ppsiSavedTo := 0, "HRESULT")
        return IShellItem(ppsiSavedTo)
    }
}
