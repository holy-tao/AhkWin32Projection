#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IPersist.ahk

/**
 * Enables a container application to pass a storage object to one of its contained objects and to load and save the storage object.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-ipersiststorage
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
     * @returns {HRESULT} This method returns S_OK to indicate that the object has changed. Otherwise, it returns S_FALSE.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-ipersiststorage-isdirty
     */
    IsDirty() {
        result := ComCall(4, this, "int")
        return result
    }

    /**
     * Initializes a new storage object.
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
     * The object has already been initialized by a previous call to either the <a href="/windows/desktop/api/objidl/nf-objidl-ipersiststorage-load">IPersistStorage::Load</a> method or the <a href="/windows/desktop/api/objidl/nf-objidl-ipersiststorage-initnew">IPersistStorage::InitNew</a> method.
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
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-ipersiststorage-initnew
     */
    InitNew(pStg) {
        result := ComCall(5, this, "ptr", pStg, "HRESULT")
        return result
    }

    /**
     * Loads an object from its existing storage.
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
     * The object has already been initialized by a previous call to the <a href="/windows/desktop/api/objidl/nf-objidl-ipersiststorage-load">IPersistStorage::Load</a> method or the <a href="/windows/desktop/api/objidl/nf-objidl-ipersiststorage-initnew">IPersistStorage::InitNew</a> method.
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
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-ipersiststorage-load
     */
    Load(pStg) {
        result := ComCall(6, this, "ptr", pStg, "HRESULT")
        return result
    }

    /**
     * Saves an object, and any nested objects that it contains, into the specified storage object. The object enters NoScribble mode.
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
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-ipersiststorage-save
     */
    Save(pStgSave, fSameAsLoad) {
        result := ComCall(7, this, "ptr", pStgSave, "int", fSameAsLoad, "HRESULT")
        return result
    }

    /**
     * Notifies the object that it can write to its storage object.
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
     * The object is in Normal mode, and there was no previous call to <a href="/windows/desktop/api/objidl/nf-objidl-ipersiststorage-save">IPersistStorage::Save</a> or <a href="/windows/desktop/api/objidl/nf-objidl-ipersiststorage-handsoffstorage">IPersistStorage::HandsOffStorage</a>. 
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-ipersiststorage-savecompleted
     */
    SaveCompleted(pStgNew) {
        result := ComCall(8, this, "ptr", pStgNew, "HRESULT")
        return result
    }

    /**
     * Instructs the object to release all storage objects that have been passed to it by its container and to enter HandsOff mode.
     * @returns {HRESULT} This method returns S_OK to indicate that the object has entered HandsOff mode successfully.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-ipersiststorage-handsoffstorage
     */
    HandsOffStorage() {
        result := ComCall(9, this, "HRESULT")
        return result
    }
}
