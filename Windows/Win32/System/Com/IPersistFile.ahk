#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPersist.ahk

/**
 * Enables an object to be loaded from or saved to a disk file, rather than a storage object or stream.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-ipersistfile
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IPersistFile extends IPersist{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPersistFile
     * @type {Guid}
     */
    static IID => Guid("{0000010b-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsDirty", "Load", "Save", "SaveCompleted", "GetCurFile"]

    /**
     * Determines whether an object has changed since it was last saved to its current file.
     * @returns {HRESULT} This method returns S_OK to indicate that the object has changed. Otherwise, it returns S_FALSE.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-ipersistfile-isdirty
     */
    IsDirty() {
        result := ComCall(4, this, "int")
        return result
    }

    /**
     * Opens the specified file and initializes an object from the file contents.
     * @param {PWSTR} pszFileName The absolute path of the file to be opened.
     * @param {Integer} dwMode The access mode to be used when opening the file. Possible values are taken from the <a href="https://docs.microsoft.com/windows/desktop/Stg/stgm-constants">STGM</a> enumeration. The method can treat this value as a suggestion, adding more restrictive permissions if necessary. If <i>dwMode</i> is 0, the implementation should open the file using whatever default permissions are used when a user opens the file.
     * @returns {HRESULT} This method can return the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object could not be loaded due to a lack of memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object could not be loaded for some reason other than a lack of memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-ipersistfile-load
     */
    Load(pszFileName, dwMode) {
        pszFileName := pszFileName is String ? StrPtr(pszFileName) : pszFileName

        result := ComCall(5, this, "ptr", pszFileName, "uint", dwMode, "HRESULT")
        return result
    }

    /**
     * Saves a copy of the object to the specified file.
     * @param {PWSTR} pszFileName The absolute path of the file to which the object should be saved. If <i>pszFileName</i> is <b>NULL</b>, the object should save its data to the current file, if there is one.
     * @param {BOOL} fRemember Indicates whether the <i>pszFileName</i> parameter is to be used as the current working file. If <b>TRUE</b>, <i>pszFileName</i> becomes the current file and the object should clear its dirty flag after the save. If <b>FALSE</b>, this save operation is a <b>Save A Copy As ...</b> operation. In this case, the current file is unchanged and the object should not clear its dirty flag. If <i>pszFileName</i> is <b>NULL</b>, the implementation should ignore the <i>fRemember</i> flag.
     * @returns {HRESULT} If the object was successfully saved, the return value is S_OK. Otherwise, it is S_FALSE. This method can also return various storage errors.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-ipersistfile-save
     */
    Save(pszFileName, fRemember) {
        pszFileName := pszFileName is String ? StrPtr(pszFileName) : pszFileName

        result := ComCall(6, this, "ptr", pszFileName, "int", fRemember, "HRESULT")
        return result
    }

    /**
     * Notifies the object that it can write to its file.
     * @param {PWSTR} pszFileName The absolute path of the file where the object was saved previously.
     * @returns {HRESULT} This method always returns S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-ipersistfile-savecompleted
     */
    SaveCompleted(pszFileName) {
        pszFileName := pszFileName is String ? StrPtr(pszFileName) : pszFileName

        result := ComCall(7, this, "ptr", pszFileName, "HRESULT")
        return result
    }

    /**
     * Retrieves the current name of the file associated with the object. If there is no current working file, this method retrieves the default save prompt for the object.
     * @returns {PWSTR} The path for the current file or the default file name prompt (such as *.txt). If an error occurs, <i>ppszFileName</i> is set to <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-ipersistfile-getcurfile
     */
    GetCurFile() {
        result := ComCall(8, this, "ptr*", &ppszFileName := 0, "HRESULT")
        return ppszFileName
    }
}
