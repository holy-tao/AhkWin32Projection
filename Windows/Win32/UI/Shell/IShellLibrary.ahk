#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IShellItem.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods for creating and managing libraries.
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ishelllibrary
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
     * Loads the library from a specified library definition file.
     * @remarks
     * If this method is called on an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishelllibrary">IShellLibrary</a> object that is already loaded, the contents of that object are overwritten in memory with the new information.
     * 
     * If there is no existing library object, <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-shloadlibraryfromitem">SHLoadLibraryFromItem</a> can be called in place of this method.
     * @param {IShellItem} psiLibrary Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> object for the library definition file to load. An error is returned if this object is not a library.
     * @param {Integer} grfMode Type: <b>DWORD</b>
     * 
     * One or more <a href="https://docs.microsoft.com/windows/desktop/Stg/stgm-constants">STGM</a> storage medium flags that specify access and sharing modes for the library object.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishelllibrary-loadlibraryfromitem
     */
    LoadLibraryFromItem(psiLibrary, grfMode) {
        result := ComCall(3, this, "ptr", psiLibrary, "uint", grfMode, "HRESULT")
        return result
    }

    /**
     * Loads the library that is referenced by a KNOWNFOLDERID.
     * @remarks
     * If  the  <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishelllibrary">IShellLibrary</a> object  contains a library when this method is called,  that library is overwritten in memory with the new library.
     * 
     * If there is no existing <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishelllibrary">IShellLibrary</a> object for this library, <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-shloadlibraryfromitem">SHLoadLibraryFromItem</a> can be  called  in place of this method.
     * @param {Pointer<Guid>} kfidLibrary Type: <b>REFKNOWNFOLDERID</b>
     * 
     * The  <a href="https://docs.microsoft.com/windows/desktop/shell/knownfolderid">KNOWNFOLDERID</a> value that identifies the library to load.
     * @param {Integer} grfMode Type: <b>DWORD</b>
     * 
     * One or more <a href="https://docs.microsoft.com/windows/desktop/Stg/stgm-constants">STGM</a> storage medium flags that specify access and sharing modes for the library object.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishelllibrary-loadlibraryfromknownfolder
     */
    LoadLibraryFromKnownFolder(kfidLibrary, grfMode) {
        result := ComCall(4, this, "ptr", kfidLibrary, "uint", grfMode, "HRESULT")
        return result
    }

    /**
     * Adds a folder to the library.
     * @remarks
     * When a folder is added to a library it is also added to the <a href="https://docs.microsoft.com/windows/desktop/search/-search-3x-wds-overview">Windows Search</a> index.
     * 
     * For convenience, <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-shaddfolderpathtolibrary">SHAddFolderPathToLibrary</a> can be used in place of this method.
     * @param {IShellItem} psiLocation Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> object that represents the folder to be added to the library.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishelllibrary-addfolder
     */
    AddFolder(psiLocation) {
        result := ComCall(5, this, "ptr", psiLocation, "HRESULT")
        return result
    }

    /**
     * Removes a folder from the library.
     * @remarks
     * For convenience, <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-shremovefolderpathfromlibrary">SHRemoveFolderPathFromLibrary</a> can be used in place of this method.
     * @param {IShellItem} psiLocation Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> object that represents the folder to remove.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishelllibrary-removefolder
     */
    RemoveFolder(psiLocation) {
        result := ComCall(6, this, "ptr", psiLocation, "HRESULT")
        return result
    }

    /**
     * Gets the set of child folders that are contained in the library.
     * @remarks
     * This method gets   an ordered list of folders. By default, this method only returns storage locations.
     * 
     * For best results, use the <b>IID_PPV_ARGS</b> macro, defined in Objbase.h,  for  the <i>riid</i> and <i>ppv</i> parameters. This macro provides the correct IID based on the interface pointed to by the value in <i>ppv</i>, which eliminates the possibility of a coding error.
     * @param {Integer} lff Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-libraryfolderfilter">LIBRARYFOLDERFILTER</a></b>
     * 
     * One of the following <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-libraryfolderfilter">LIBRARYFOLDERFILTER</a>   values that determines the folders to get. These flags cannot be combined.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the IID of the interface to  get in  <i>ppv</i>. This value is typically IID_IShellItemArray,  but it can also be IID_IObjectCollection, IID_IObjectArray, or the IID of any other interface that is implemented by CShellItemArray.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     *  A pointer to the interface  requested in <i>riid</i>. If this  call fails, this value is <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishelllibrary-getfolders
     */
    GetFolders(lff, riid) {
        result := ComCall(7, this, "int", lff, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Resolves the target location of a library folder, even if the folder has been moved or renamed.
     * @remarks
     * This method is a blocking call that can block the calling thread as long as the time specified in the <i>dwTimeout</i> parameter before returning. Because it blocks the thread from which it is called, it should not be called from a thread that also handles user interface interactions. 
     * 
     * This method will not prompt the user to manually locate the folder if it cannot resolve the location.
     * 
     * For convenience, <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/nf-shobjidl-shresolvefolderpathinlibrary">SHResolveFolderPathInLibrary</a> can be used in place of this method.
     * 
     * It is recommended that you use the <b>IID_PPV_ARGS</b> macro, defined in Objbase.h, to package the <i>riid</i> and <i>ppv</i> parameters. This macro provides the correct IID based on the interface pointed to by the value in <i>ppv</i>, which eliminates the possibility of a coding error.
     * @param {IShellItem} psiFolderToResolve Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> object that represents the library folder to locate.
     * @param {Integer} dwTimeout Type: <b>DWORD</b>
     * 
     * The maximum time, in milliseconds, the method will  attempt to locate the folder before returning. If the folder could not be located before the specified time elapses, an error is returned.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the IID of the interface to get in <i>ppv</i> that will represent the resolved  target location. This value is typically IID_IShellItem,  but it can also be IID_IShellItem2 or the IID of any other interface that is implemented by CShellItem.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * A pointer  to the interface requested in <i>riid</i>.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishelllibrary-resolvefolder
     */
    ResolveFolder(psiFolderToResolve, dwTimeout, riid) {
        result := ComCall(8, this, "ptr", psiFolderToResolve, "uint", dwTimeout, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Retrieves the default target folder that the library uses for save operations.
     * @remarks
     * For best results, use the <b>IID_PPV_ARGS</b> macro, defined in Objbase.h,  for  the <i>riid</i> and <i>ppv</i> parameters. This macro provides the correct IID based on the interface pointed to by the value in <i>ppv</i>, which eliminates the possibility of a coding error.
     * @param {Integer} dsft Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-defaultsavefoldertype">DEFAULTSAVEFOLDERTYPE</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-defaultsavefoldertype">DEFAULTSAVEFOLDERTYPE</a>  value that specifies the save folder to get.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the IID of the interface to get in <i>ppv</i> that will represent the save location.   This value is typically IID_IShellItem,  but it can also be IID_IShellItem2 or the IID of any other interface that is implemented by CShellItem.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * A  pointer  to the interface requested in <i>riid</i>.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishelllibrary-getdefaultsavefolder
     */
    GetDefaultSaveFolder(dsft, riid) {
        result := ComCall(9, this, "int", dsft, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Sets the default target folder that the library will use for save operations.
     * @remarks
     * The default save location must be valid, have read/write access, and with either the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-getattributesof">SFGAO_STREAM</a> or <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-getattributesof">SFGAO_FILESYSTEM</a> attribute set.
     * 
     * If <i>psi</i> is not in the library, this method returns an error.
     * @param {Integer} dsft Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-defaultsavefoldertype">DEFAULTSAVEFOLDERTYPE</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-defaultsavefoldertype">DEFAULTSAVEFOLDERTYPE</a>  value  that specifies the default save location to set.
     * @param {IShellItem} psi Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * An  <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> object that represents the folder that to use as the default save location. The folder that this object represents must be a folder that is already in the library.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishelllibrary-setdefaultsavefolder
     */
    SetDefaultSaveFolder(dsft, psi) {
        result := ComCall(10, this, "int", dsft, "ptr", psi, "HRESULT")
        return result
    }

    /**
     * Gets the library's options.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-libraryoptionflags">LIBRARYOPTIONFLAGS</a>*</b>
     * 
     * The library options for this library. <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-libraryoptionflags">LIBRARYOPTIONFLAGS</a> is a bitwise enumerator, which means that more than one flag could be set.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishelllibrary-getoptions
     */
    GetOptions() {
        result := ComCall(11, this, "int*", &plofOptions := 0, "HRESULT")
        return plofOptions
    }

    /**
     * Sets the library options.
     * @remarks
     * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-libraryoptionflags">LIBRARYOPTIONFLAGS</a> is a bitwise enumerator, which means that more than one option flag can be set.
     * 
     * To change an option value, you must set the option value that you want to change in <i>lofMask</i> and then set or clear the value of the option in <i>lofOptions</i>.
     * @param {Integer} lofMask Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-libraryoptionflags">LIBRARYOPTIONFLAGS</a></b>
     * 
     * A bitmask  that specifies   the   <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-libraryoptionflags">LIBRARYOPTIONFLAGS</a> values  to change in  this call.
     * @param {Integer} lofOptions Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-libraryoptionflags">LIBRARYOPTIONFLAGS</a></b>
     * 
     * A bitmask that specifies the new value of each  <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-libraryoptionflags">LIBRARYOPTIONFLAGS</a>  value to change. <b>LIBRARYOPTIONFLAGS</b>  values that are not set in <i>lofMask</i> are not changed by this call.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishelllibrary-setoptions
     */
    SetOptions(lofMask, lofOptions) {
        result := ComCall(12, this, "int", lofMask, "int", lofOptions, "HRESULT")
        return result
    }

    /**
     * Gets the library's folder type.
     * @remarks
     * The folder type determines the default view template that is used by the folder. A view template specifies the columns and details that appear by default in the Windows Explorer view of the folder.
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/shell/foldertypeid">FOLDERTYPEID</a> values are GUID  values that are defined in shlguid.h.
     * @returns {Guid} Type: <b><a href="https://docs.microsoft.com/windows/desktop/shell/foldertypeid">FOLDERTYPEID</a>*</b>
     * 
     * The  view template that is applied to a folder, usually based on its intended use and contents.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishelllibrary-getfoldertype
     */
    GetFolderType() {
        pftid := Guid()
        result := ComCall(13, this, "ptr", pftid, "HRESULT")
        return pftid
    }

    /**
     * Sets the library's folder type.
     * @remarks
     * The folder type determines the default view template that is used by the folder. A view template specifies the  columns and details that appear by default in Windows Explorer by default view of the folder.  <a href="https://docs.microsoft.com/windows/desktop/shell/foldertypeid">FOLDERTYPEID</a> values are GUID  values that are defined in shlguid.h.
     * @param {Pointer<Guid>} ftid Type: <b>REFFOLDERTYPEID</b>
     * 
     * The <b>GUID</b> or <a href="https://docs.microsoft.com/windows/desktop/shell/foldertypeid">FOLDERTYPEID</a> that represents  the  view template that is applied to a folder, usually based on its intended use and contents.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishelllibrary-setfoldertype
     */
    SetFolderType(ftid) {
        result := ComCall(14, this, "ptr", ftid, "HRESULT")
        return result
    }

    /**
     * Gets the default icon for the library.
     * @remarks
     * For additional information on parsing the string returned in <i>ppszIcon</i>, see <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/nf-shlwapi-pathparseiconlocationa">PathParseIconLocation</a>.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * A null-terminated Unicode string that describes the location of the default icon. The  string is returned as <c>ModuleFileName,ResourceIndex</code> or <code>ModuleFileName,-ResourceID</c>. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>ModuleFileName</td>
     * <td>The file name of the module file that contains the icon resource.</td>
     * </tr>
     * <tr>
     * <td>ResourceIndex</td>
     * <td>If the number that follows the comma is positive, the index of the resource in the module file.</td>
     * </tr>
     * <tr>
     * <td>-ResourceID</td>
     * <td>If the number that follows the comma is negative, the absolute value of the number is the resource ID of the icon in the module file.</td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishelllibrary-geticon
     */
    GetIcon() {
        result := ComCall(15, this, "ptr*", &ppszIcon := 0, "HRESULT")
        return ppszIcon
    }

    /**
     * Sets the default icon for the library.
     * @remarks
     * For more information on the format of the <i>pszIcon</i> parameter, see <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/nf-shlwapi-pathparseiconlocationa">PathParseIconLocation</a>.
     * @param {PWSTR} pszIcon Type: <b>LPCWSTR</b>
     * 
     * A null-terminated Unicode string that describes the location of the default icon. The string must be formatted as <c>ModuleFileName,ResourceIndex</code> or <code>ModuleFileName,-ResourceID</c>. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>ModuleFileName</td>
     * <td>The file name of the module file that contains the icon resource.</td>
     * </tr>
     * <tr>
     * <td>ResourceIndex</td>
     * <td>A positive decimal number that specifies the index of the icon resource in the module file.</td>
     * </tr>
     * <tr>
     * <td>-ResourceID</td>
     * <td>A negative decimal number whose absolute value is the resource ID of the icon resource in the module file.</td>
     * </tr>
     * </table>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishelllibrary-seticon
     */
    SetIcon(pszIcon) {
        pszIcon := pszIcon is String ? StrPtr(pszIcon) : pszIcon

        result := ComCall(16, this, "ptr", pszIcon, "HRESULT")
        return result
    }

    /**
     * Commits library updates to an existing Library Description file.
     * @remarks
     * <b>IShellLibrary::Commit</b>  can only be called to save library updates to an existing file.  A call to <b>IShellLibrary::Commit</b> for a library that does not have a backing file will fail.
     *          
     * To create and save a new file, call  <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishelllibrary-save">IShellLibrary::Save</a> or <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-shsavelibraryinfolderpath">SHSaveLibraryInFolderPath</a>.
     *          
     * 
     * If the library is saved in the Libraries known folder (FOLDERID_Libraries), the folders in the library are automatically added to the search index.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishelllibrary-commit
     */
    Commit() {
        result := ComCall(17, this, "HRESULT")
        return result
    }

    /**
     * Saves the library to a new Library Description (*.library-ms) file.
     * @remarks
     * <b>IShellLibrary::Save</b> and <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-shsavelibraryinfolderpath">SHSaveLibraryInFolderPath</a> create a new library file, and save the file to disk. To save changes made to a library that has an existing library file, call  <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishelllibrary-commit">IShellLibrary::Commit</a>.
     * 
     * If the library is saved in the Libraries known folder (FOLDERID_Libraries), the library's location is automatically added to the system index.
     * 
     * For convenience, <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-shsavelibraryinfolderpath">SHSaveLibraryInFolderPath</a> can be used in place of this method.
     * @param {IShellItem} psiFolderToSaveIn Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * The  <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> object  that specifies the folder in which to save the library, or <b>NULL</b> to save the library  with the user's default libraries in the FOLDERID_Libraries known folder.
     * @param {PWSTR} pszLibraryName Type: <b>LPCWSTR</b>
     * 
     * The file name under which to save the library. The file name must not include the file name extension; the file name extension is added automatically.
     * @param {Integer} lsf Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-librarysaveflags">LIBRARYSAVEFLAGS</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-librarysaveflags">LIBRARYSAVEFLAGS</a>  value that specifies how to handle a library name collision.
     * @returns {IShellItem} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>**</b>
     * 
     * The  <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> object  that represents the library description file into   which the library was saved.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishelllibrary-save
     */
    Save(psiFolderToSaveIn, pszLibraryName, lsf) {
        pszLibraryName := pszLibraryName is String ? StrPtr(pszLibraryName) : pszLibraryName

        result := ComCall(18, this, "ptr", psiFolderToSaveIn, "ptr", pszLibraryName, "int", lsf, "ptr*", &ppsiSavedTo := 0, "HRESULT")
        return IShellItem(ppsiSavedTo)
    }

    /**
     * Saves the library to a new file in a specified known folder.
     * @remarks
     * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishelllibrary-save">IShellLibrary::Save</a> and <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-shsavelibraryinfolderpath">SHSaveLibraryInFolderPath</a> create a new library file, and save the file to disk.
     *             
     * To save changes made to a library that has an existing library file, call  <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishelllibrary-commit">IShellLibrary::Commit</a>.
     *          
     * 
     * If the library is saved in the Libraries known folder (FOLDERID_Libraries), the library's location is automatically added to the system index.
     * @param {Pointer<Guid>} kfidToSaveIn Type: <b>REFKNOWNFOLDERID</b>
     * 
     * The ID of the known folder in which to save the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishelllibrary">IShellLibrary</a> object.
     *                
     * For more information, see <a href="https://docs.microsoft.com/windows/desktop/shell/knownfolderid">KNOWNFOLDERID</a>.
     * @param {PWSTR} pszLibraryName Type: <b>LPCWSTR</b>
     * 
     * The file name under which to save the library. The file name must not include the file name extension; the file name extension is added automatically.
     * @param {Integer} lsf Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-librarysaveflags">LIBRARYSAVEFLAGS</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-librarysaveflags">LIBRARYSAVEFLAGS</a>  value that specifies how to handle a library name collision.
     * @returns {IShellItem} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>**</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> object  that represents the library description file into    which the library was saved.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishelllibrary-saveinknownfolder
     */
    SaveInKnownFolder(kfidToSaveIn, pszLibraryName, lsf) {
        pszLibraryName := pszLibraryName is String ? StrPtr(pszLibraryName) : pszLibraryName

        result := ComCall(19, this, "ptr", kfidToSaveIn, "ptr", pszLibraryName, "int", lsf, "ptr*", &ppsiSavedTo := 0, "HRESULT")
        return IShellItem(ppsiSavedTo)
    }
}
