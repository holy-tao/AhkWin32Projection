#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPersist.ahk

/**
 * Enables an object to be loaded from or saved to a disk file, rather than a storage object or stream.
 * @see https://learn.microsoft.com/windows/win32/api/objidl/nn-objidl-ipersistfile
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
     * @remarks
     * Use this method to determine whether an object should be saved before closing it. The dirty flag for an object is conditionally cleared in the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersistfile-save">IPersistFile::Save</a> method.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * OLE does not call <b>IsDirty</b>. Applications would not call it unless they are also saving an object to a file.
     * 
     * You should treat any error return codes as an indication that the object has changed. Unless this method explicitly returns S_FALSE, assume that the object must be saved.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * An object with no contained objects simply checks its dirty flag to return the appropriate result.
     * 
     * A container with one or more contained objects must maintain an internal dirty flag that is set when any of its contained objects has changed since it was last saved. To do this, the container should maintain an advise sink by implementing the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-iadvisesink">IAdviseSink</a> interface. Then, the container can register each link or embedding for data change notifications with a call to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-dadvise">IDataObject::DAdvise</a>. Then, the container can set its internal dirty flag when it receives an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-iadvisesink-ondatachange">IAdviseSink::OnDataChange</a> notification. If the container does not register for data change notifications, the <b>IPersistFile::IsDirty</b> implementation would call <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersiststorage-isdirty">IPersistStorage::IsDirty</a> for each of its contained objects to determine whether they have changed.
     * 
     * The container can clear its dirty flag whenever it is saved, as long as the file to which the object is saved is the current working file after the save. Therefore, the dirty flag would be cleared after a successful <b>Save</b> or <b>Save As</b> operation, but not after a <b>Save A Copy As . . .</b> operation.
     * @returns {HRESULT} This method returns S_OK to indicate that the object has changed. Otherwise, it returns S_FALSE.
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-ipersistfile-isdirty
     */
    IsDirty() {
        result := ComCall(4, this, "int")
        return result
    }

    /**
     * Opens the specified file and initializes an object from the file contents.
     * @remarks
     * <b>IPersistFile::Load</b> loads the object from the specified file. This method is for initialization only and does not show the object to the end user. It is not equivalent to what occurs when a user selects the <b>File Open</b> command.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * The <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-bindtoobject">BindToObject</a> method in file monikers calls this method to load an object during a moniker binding operation (when a linked object is run). Typically, applications do not call this method directly.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * Because the information needed to open a file varies greatly from one application to another, the object on which this method is implemented must also open the file specified by the <i>pszFileName</i> parameter. This differs from the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersiststorage-load">IPersistStorage::Load</a> and <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersiststream-load">IPersistStream::Load</a>, in which the caller opens the storage or stream and then passes an open storage or stream pointer to the loaded object.
     * 
     * For an application that normally uses OLE compound files, your <b>IPersistFile::Load</b> implementation can simply call the <a href="https://docs.microsoft.com/windows/desktop/api/coml2api/nf-coml2api-stgopenstorage">StgOpenStorage</a> function to open the storage object in the specified file. Then, you can proceed with normal initialization. Applications that do not use storage objects can perform normal file-opening procedures.
     * 
     * When the object has been loaded, your implementation should register the object in the running object table (see <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-irunningobjecttable-register">IRunningObjectTable::Register</a>).
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
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-ipersistfile-load
     */
    Load(pszFileName, dwMode) {
        pszFileName := pszFileName is String ? StrPtr(pszFileName) : pszFileName

        result := ComCall(5, this, "ptr", pszFileName, "uint", dwMode, "HRESULT")
        return result
    }

    /**
     * Saves a copy of the object to the specified file.
     * @remarks
     * This method can be called to save an object to the specified file in one of three ways:
     * 
     * 
     * 
     * The implementer must detect which type of save operation the caller is requesting. If the <i>pszFileName</i> parameter is <b>NULL</b>, a <b>Save</b> is being requested. If the <i>pszFileName</i> parameter is not <b>NULL</b>, use the value of the <i>fRemember</i> parameter to distinguish between a <b>Save As</b> and a <b>Save a Copy As</b>.
     * 
     * In <b>Save</b> or <b>Save As</b> operations, <b>IPersistFile::Save</b> clears the internal dirty flag after the save and sends <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-iadvisesink-onsave">IAdviseSink::OnSave</a> notifications to any advisory connections (see also <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleadviseholder-sendonsave">IOleAdviseHolder::SendOnSave</a>). Also, in these operations, the object is in NoScribble mode until it receives an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersistfile-savecompleted">IPersistFile::SaveCompleted</a> call. In NoScribble mode, the object must not write to the file.
     * 
     * In the <b>Save As</b> scenario, the implementation should also send <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-iadvisesink-onrename">IAdviseSink::OnRename</a> notifications to any advisory connections (see also <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleadviseholder-sendonrename">IOleAdviseHolder::SendOnRename</a>).
     * 
     * In the <b>Save a Copy As</b> scenario, the implementation does not clear the internal dirty flag after the save.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * OLE does not call <b>IPersistFile::Save</b>. Typically, applications would not call it unless they are saving an object to a file directly, which is generally left to the end-user.
     * @param {PWSTR} pszFileName The absolute path of the file to which the object should be saved. If <i>pszFileName</i> is <b>NULL</b>, the object should save its data to the current file, if there is one.
     * @param {BOOL} fRemember Indicates whether the <i>pszFileName</i> parameter is to be used as the current working file. If <b>TRUE</b>, <i>pszFileName</i> becomes the current file and the object should clear its dirty flag after the save. If <b>FALSE</b>, this save operation is a <b>Save A Copy As ...</b> operation. In this case, the current file is unchanged and the object should not clear its dirty flag. If <i>pszFileName</i> is <b>NULL</b>, the implementation should ignore the <i>fRemember</i> flag.
     * @returns {HRESULT} If the object was successfully saved, the return value is S_OK. Otherwise, it is S_FALSE. This method can also return various storage errors.
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-ipersistfile-save
     */
    Save(pszFileName, fRemember) {
        pszFileName := pszFileName is String ? StrPtr(pszFileName) : pszFileName

        result := ComCall(6, this, "ptr", pszFileName, "int", fRemember, "HRESULT")
        return result
    }

    /**
     * Notifies the object that it can write to its file.
     * @remarks
     * <b>SaveCompleted</b> is called when a call to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersistfile-save">IPersistFile::Save</a> is completed, and the file that was saved is now the current working file (having been saved with <b>Save</b> or <b>Save As</b> operations). The call to <b>Save</b> puts the object into NoScribble mode so it cannot write to its file. When <b>SaveCompleted</b> is called, the object reverts to Normal mode, in which it is free to write to its file.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * OLE does not call the <b>SaveCompleted</b> method. Typically, applications would not call it unless they are saving objects directly to files, an operation which is generally left to the end-user.
     * @param {PWSTR} pszFileName The absolute path of the file where the object was saved previously.
     * @returns {HRESULT} This method always returns S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-ipersistfile-savecompleted
     */
    SaveCompleted(pszFileName) {
        pszFileName := pszFileName is String ? StrPtr(pszFileName) : pszFileName

        result := ComCall(7, this, "ptr", pszFileName, "HRESULT")
        return result
    }

    /**
     * Retrieves the current name of the file associated with the object. If there is no current working file, this method retrieves the default save prompt for the object.
     * @remarks
     * This method allocates memory for the string returned in the <i>ppszFileName</i> parameter using the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imalloc-alloc">IMalloc::Alloc</a> method. The caller is responsible for calling the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imalloc-free">IMalloc::Free</a> method to free the string. Both the caller and this method use the OLE task allocator provided by a call to <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cogetmalloc">CoGetMalloc</a>.
     * 
     * The file name returned in <i>ppszFileName</i> is the name specified in a call to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersistfile-load">IPersistFile::Load</a> when the document was loaded; or in <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersistfile-savecompleted">IPersistFile::SaveCompleted</a> if the document was saved to a different file.
     * 
     * If the object does not have a current working file, it should provide the default prompt that it would display in a <b>Save As</b> dialog box. For example, the default save prompt for a word processor object could be
     * 
     * "*.txt".
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * OLE does not call the <b>GetCurFile</b> method. Applications would not call this method unless they are also calling the save methods of this interface.
     * 
     * In saving the object, you can call this method before calling <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersistfile-save">IPersistFile::Save</a> to determine whether the object has an associated file. If this method returns S_OK, you can then call <b>IPersistFile::Save</b> with a <b>NULL</b> filename and a <b>TRUE</b> value for the <i>fRemember</i> parameter to tell the object to save itself to its current file. If this method returns S_FALSE, you can use the save prompt returned in the <i>ppszFileName</i> parameter to ask the end user to provide a file name. Then, you can call <b>IPersistFile::Save</b> with the file name that the user entered to perform a <b>Save As</b> operation.
     * @returns {PWSTR} The path for the current file or the default file name prompt (such as *.txt). If an error occurs, <i>ppszFileName</i> is set to <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-ipersistfile-getcurfile
     */
    GetCurFile() {
        result := ComCall(8, this, "ptr*", &ppszFileName := 0, "HRESULT")
        return ppszFileName
    }
}
