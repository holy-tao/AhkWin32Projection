#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IPersist.ahk

/**
 * Enables a container application to pass a storage object to one of its contained objects and to load and save the storage object.
 * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nn-objidl-ipersiststorage
 * @namespace Windows.Win32.System.Com.StructuredStorage
 * @version v4.0.30319
 */
class IPersistStorage extends IPersist{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPersistStorage
     * @type {Guid}
     */
    static IID => Guid("{0000010a-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsDirty", "InitNew", "Load", "Save", "SaveCompleted", "HandsOffStorage"]

    /**
     * Determines whether an object has changed since it was last saved to its current storage.
     * @remarks
     * Use this method to determine whether an object should be saved before closing it. The dirty flag for an object is conditionally cleared in the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersiststorage-save">IPersistStorage::Save</a> method.
     * 
     * For example, you could optimize a <b>File Save</b> operation by calling the <b>IPersistStorage::IsDirty</b> method for each object and then calling the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersiststorage-save">IPersistStorage::Save</a> method only for those objects that are dirty.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * You should treat any error return codes as an indication that the object has changed. Unless this method explicitly returns S_FALSE, assume that the object must be saved.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * An object with no contained objects simply checks its dirty flag to return the appropriate result.
     * 
     * A container with one or more contained objects must maintain an internal dirty flag that is set when any of its contained objects has changed since it was last saved.
     * @returns {HRESULT} This method returns S_OK to indicate that the object has changed. Otherwise, it returns S_FALSE.
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-ipersiststorage-isdirty
     */
    IsDirty() {
        result := ComCall(4, this, "int")
        return result
    }

    /**
     * Initializes a new storage object.
     * @remarks
     * A container application can call this method when it needs to initialize a new object, for example, with an InsertObject command.
     * 
     * An object that supports the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ipersiststorage">IPersistStorage</a> interface must have access to a valid storage object at all times while it is running. This includes the time just after the object has been created but before it has been made persistent. The object's container must provide the object with a valid <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> pointer to the storage during this time through the call to <b>IPersistStorage::InitNew</b>. Depending on the container's state, a temporary file might have to be created for this purpose.
     * 
     * If the object wants to retain the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> instance, it must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> to increment its reference count.
     * 
     * After the call to <b>IPersistStorage::InitNew</b>, the object is in either the loaded or running state. For example, if the object class has an in-process server, the object will be in the running state. However, if the object uses the default handler, the container's call to <b>InitNew</b> only invokes the handler's implementation which does not run the object. Later if the container runs the object, the handler calls the <b>InitNew</b> method for the object.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * Rather than calling <b>IPersistStorage::InitNew</b> directly, you typically call the <a href="https://docs.microsoft.com/windows/desktop/api/ole/nf-ole-olecreate">OleCreate</a> helper function which does the following:
     * 
     * <ol>
     * <li>Calls the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a> function to create an instance of the object class.</li>
     * <li>Queries the new instance for the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ipersiststorage">IPersistStorage</a> interface.</li>
     * <li>Calls the <b>InitNew</b> method to initialize the object.</li>
     * </ol>
     * The container application should cache the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ipersiststorage">IPersistStorage</a> pointer to the object for use in later operations on the object.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * An implementation of <b>IPersistStorage::InitNew</b> should initialize the object to its default state, taking the following steps:
     * 
     * <ol>
     * <li>Pre-open and cache the pointers to any streams or storages that the object will need to save itself to this storage.</li>
     * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> and cache the storage pointer that is passed in.</li>
     * <li>Call the <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-writefmtusertypestg">WriteFmtUserTypeStg</a> function to write the native clipboard format and user type string for the object to the storage object.</li>
     * <li>Set the dirty flag for the object.</li>
     * </ol>
     * The first two steps are particularly important for ensuring that the object can save itself in low memory situations. Pre-opening and holding onto pointers to the stream and storage interfaces guarantee that a save operation to this storage will not fail due to insufficient memory.
     * 
     * Your implementation of this method should return the CO_E_ALREADYINITIALIZED error code if it receives a call to either the <b>IPersistStorage::InitNew</b> method or the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersiststorage-load">IPersistStorage::Load</a> method after it is already initialized.
     * @param {IStorage} pStg An <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> pointer to the new storage object to be initialized. The container creates a nested storage object in its storage object (see <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istorage-createstorage">IStorage::CreateStorage</a>). Then, the container calls the <a href="https://docs.microsoft.com/windows/desktop/api/coml2api/nf-coml2api-writeclassstg">WriteClassStg</a> function to initialize the new storage object with the object class identifier (CLSID).
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
     * <dt><b>CO_E_ALREADYINITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object has already been initialized by a previous call to either the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersiststorage-load">IPersistStorage::Load</a> method or the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersiststorage-initnew">IPersistStorage::InitNew</a> method.
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
     * The storage object was not initialized due to a lack of memory.
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
     * The storage object was not initialized for some reason other than a lack of memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-ipersiststorage-initnew
     */
    InitNew(pStg) {
        result := ComCall(5, this, "ptr", pStg, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Loads an object from its existing storage.
     * @remarks
     * This method initializes an object from an existing storage. The object is placed in the loaded state if this method is called by the container application. If called by the default handler, this method places the object in the running state.
     * 
     * Either the default handler or the object itself can hold onto the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> pointer while the object is loaded or running.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * Rather than calling <b>IPersistStorage::Load</b> directly, you typically call the <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-oleload">OleLoad</a> helper function which does the following:
     * 
     * <ol>
     * <li>Create an uninitialized instance of the object class.</li>
     * <li>Query the new instance for the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ipersiststorage">IPersistStorage</a> interface.</li>
     * <li>Call <b>Load</b> to initialize the object from the existing storage.</li>
     * </ol>
     * You also call this method indirectly when you call the <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-olecreatefromdata">OleCreateFromData</a> function or the <a href="https://docs.microsoft.com/windows/desktop/api/ole/nf-ole-olecreatefromfile">OleCreateFromFile</a> function to insert an object into a compound file (as in a drag-and-drop or clipboard paste operation).
     * 
     * The container should cache the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ipersiststorage">IPersistStorage</a> pointer for use in later operations on the object.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * Your implementation should perform the following steps to load an object:
     * 
     * <ol>
     * <li>Open the object's streams in the storage object, and read the necessary data into the object's internal data structures.</li>
     * <li>Clear the object's dirty flag.</li>
     * <li>Call the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> method and cache the passed in storage pointer.</li>
     * <li>Keep open and cache the pointers to any streams or storages that the object will need to save itself to this storage.</li>
     * <li>Perform any other default initialization required for the object.</li>
     * </ol>
     * Steps 3 and 4 are particularly important for ensuring that the object can save itself in low memory situations. Holding onto pointers to the storage and stream interfaces guarantees that a save operation to this storage will not fail due to insufficient memory.
     * 
     * Your implementation of this method should return the CO_E_ALREADYINITIALIZED error code if it receives a call to either the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersiststorage-initnew">IPersistStorage::InitNew</a> method or the <b>IPersistStorage::Load</b> method after it is already initialized.
     * @param {IStorage} pStg An <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> pointer to the existing storage from which the object is to be loaded.
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
     * <dt><b>CO_E_ALREADYINITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object has already been initialized by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersiststorage-load">IPersistStorage::Load</a> method or the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersiststorage-initnew">IPersistStorage::InitNew</a> method.
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
     * The object was not loaded due to lack of memory.
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
     * The object was not loaded due to some reason other than a lack of memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-ipersiststorage-load
     */
    Load(pStg) {
        result := ComCall(6, this, "ptr", pStg, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Saves an object, and any nested objects that it contains, into the specified storage object. The object enters NoScribble mode.
     * @remarks
     * This method saves an object, and any nested objects it contains, into the specified storage. It also places the object into NoScribble mode. Thus, the object cannot write to its storage until a subsequent call to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersiststorage-savecompleted">IPersistStorage::SaveCompleted</a> method returns the object to Normal mode.
     * 
     * If the storage object is the same as the one it was loaded or created from, the save operation may be able to write incremental changes to the storage object. Otherwise, a full save must be done.
     * 
     * This method recursively calls the <b>IPersistStorage::Save</b> method, the <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-olesave">OleSave</a> function, or the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istorage-copyto">IStorage::CopyTo</a> method to save its nested objects.
     * 
     * This method does not call the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istorage-commit">IStorage::Commit</a> method. Nor does it write the CLSID to the storage object. Both of these tasks are the responsibilities of the caller.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * Rather than calling <b>IPersistStorage::Save</b> directly, you typically call the <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-olesave">OleSave</a> helper function which performs the following steps:
     * 
     * <ol>
     * <li>Call the <a href="https://docs.microsoft.com/windows/desktop/api/coml2api/nf-coml2api-writeclassstg">WriteClassStg</a> function to write the class identifier for the object to the storage.</li>
     * <li>Call the <b>IPersistStorage::Save</b> method.</li>
     * <li>If needed, call the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istorage-commit">IStorage::Commit</a> method on the storage object.</li>
     * </ol>
     * Then, a container application performs any other operations necessary to complete the save and calls the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersiststorage-savecompleted">SaveCompleted</a> method for each object.
     * 
     * If an embedded object passes the <b>IPersistStorage::Save</b> method to its nested objects, it must receive a call to its <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersiststorage-savecompleted">IPersistStorage::SaveCompleted</a> method before calling this method for its nested objects.
     * @param {IStorage} pStgSave An <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> pointer to the storage into which the object is to be saved.
     * @param {BOOL} fSameAsLoad Indicates whether the specified storage is the current one, which was passed to the object by one of the following calls: <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersiststorage-initnew">IPersistStorage::InitNew</a>, <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersiststorage-load">IPersistStorage::Load</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersiststorage-savecompleted">IPersistStorage::SaveCompleted</a>.
     * 
     * This parameter is set to <b>FALSE</b> when performing a <b>Save As</b> or <b>Save A Copy To</b> operation or when performing a full save. In the latter case, this method saves to a temporary file, deletes the original file, and renames the temporary file.
     * 
     * This parameter is set to <b>TRUE</b> to perform a full save in a low-memory situation or to perform a fast incremental save in which only the dirty components are saved.
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
     * <dt><b>STG_E_MEDIUMFULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object was not saved because of a lack of space on the disk.
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
     * The object could not be saved due to errors other than a lack of disk space.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-ipersiststorage-save
     */
    Save(pStgSave, fSameAsLoad) {
        result := ComCall(7, this, "ptr", pStgSave, "int", fSameAsLoad, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Notifies the object that it can write to its storage object.
     * @remarks
     * This method notifies an object that it can revert to Normal mode and can once again write to its storage object. The object exits NoScribble mode or HandsOff mode.
     * 
     * If the object is reverting from HandsOff mode, the pStgNew parameter must be non-<b>NULL</b>. In HandsOffFromNormal mode, this parameter is the new storage object that replaces the one that was revoked by the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersiststorage-handsoffstorage">IPersistStorage::HandsOffStorage</a> method. The data in the storage object is a copy of the data from the revoked storage object. In HandsOffAfterSave mode, the data is the same as the data that was most recently saved. It is not the same as the data in the revoked storage object.
     * 
     * If the object is reverting from NoScribble mode, the <i>pStgNew</i> parameter can be <b>NULL</b> or non-<b>NULL</b>. If <b>NULL</b>, the object once again has access to its storage object. If it is not <b>NULL</b>, the component object should simulate receiving a call to its <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersiststorage-handsoffstorage">HandsOffStorage</a> method. If the component object cannot simulate this call, its container must be prepared to actually call the <b>HandsOffStorage</b> method.
     * 
     * This method must recursively call any nested objects that are loaded or running.
     * 
     * If this method returns an error code, the object is not returned to Normal mode. Thus, the container object can attempt different save strategies.
     * @param {IStorage} pStgNew An <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> pointer to the new storage object, if different from the storage object prior to saving. This pointer can be <b>NULL</b> if the current storage object does not change during the save operation. If the object is in HandsOff mode, this parameter must be non-<b>NULL</b>.
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
     * The object remained in HandsOff mode or NoScribble mode due to a lack of memory. Typically, this error occurs when the object is not able to open the necessary streams and storage objects in <i>pStgNew</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pStgNew</i> parameter is not valid. Typically, this error occurs if <i>pStgNew</i> is <b>NULL</b> when the object is in HandsOff mode.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object is in Normal mode, and there was no previous call to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersiststorage-save">IPersistStorage::Save</a> or <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersiststorage-handsoffstorage">IPersistStorage::HandsOffStorage</a>. 
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-ipersiststorage-savecompleted
     */
    SaveCompleted(pStgNew) {
        result := ComCall(8, this, "ptr", pStgNew, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Instructs the object to release all storage objects that have been passed to it by its container and to enter HandsOff mode.
     * @remarks
     * This method causes an object to release any storage objects that it is holding and to enter the HandsOff mode until a subsequent <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersiststorage-savecompleted">IPersistStorage::SaveCompleted</a> call. In HandsOff mode, the object cannot do anything and the only operation that works is a close operation.
     * 
     * A container application typically calls this method during a full save or low-memory full save operation to force the object to release all pointers to its current storage. In these scenarios, the <b>HandsOffStorage</b> call comes after a call to either <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-olesave">OleSave</a> or <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersiststorage-save">IPersistStorage::Save</a>, putting the object in HandsOffAfterSave mode. Calling this method is necessary so the container application can delete the current file as part of a full save, or so it can call the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-irootstorage-switchtofile">IRootStorage::SwitchToFile</a> method as part of a low-memory save.
     * 
     * A container application also calls this method when an object is in Normal mode to put the object in HandsOffFromNormal mode.
     * 
     * While the component object is in either HandsOffAfterSave or HandsOffFromNormal mode, most operations on the object will fail. Thus, the container should restore the object to Normal mode as soon as possible. The container application does this by calling the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersiststorage-savecompleted">IPersistStorage::SaveCompleted</a> method, which passes a storage pointer back to the component object for the new storage object.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * This method must release all pointers to the current storage object, including pointers to any nested streams and storages. If the object contains nested objects, the container application must recursively call this method for any nested objects that are loaded or running.
     * @returns {HRESULT} This method returns S_OK to indicate that the object has entered HandsOff mode successfully.
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-ipersiststorage-handsoffstorage
     */
    HandsOffStorage() {
        result := ComCall(9, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
