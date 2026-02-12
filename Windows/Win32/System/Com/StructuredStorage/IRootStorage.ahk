#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IUnknown.ahk

/**
 * The IRootStorage interface contains a single method that switches a storage object to a different underlying file and saves the storage object to that file.
 * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nn-objidl-irootstorage
 * @namespace Windows.Win32.System.Com.StructuredStorage
 * @version v4.0.30319
 */
class IRootStorage extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRootStorage
     * @type {Guid}
     */
    static IID => Guid("{00000012-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SwitchToFile"]

    /**
     * The SwitchToFile method copies the current file associated with the storage object to a new file.
     * @remarks
     * The <b>IRootStorage::SwitchToFile</b> method copies the file associated with the storage object. A COM container calls 
     * <b>SwitchToFile</b> to perform a full save on a file in a low-memory situation. Typically, this is done only after a normal, full save operation (that is, save to temporary file, delete original file, rename temporary file) has failed with an E_OUTOFMEMORY error.
     * 
     * It is erroneous to call the 
     * <b>SwitchToFile</b> method if the storage object or anything contained within it has been marshaled to another process. Before calling 
     * <b>SwitchToFile</b>, the container must call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersiststorage-handsoffstorage">IPersistStorage::HandsOffStorage</a> method for any element within the storage object that is loaded or running. The <b>HandsOffStorage</b> method forces the element to release its storage pointers and enter the hands-off storage mode. The container must also release all pointers to streams or storages that are contained in this root storage. After the full save operation is completed, the container returns the contained elements to normal storage mode.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * If you are implementing your own storage objects, the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-irootstorage">IRootStorage</a> methods (including <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a>, <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a>) must not consume additional memory or file handles.
     * @param {PWSTR} pszFile A pointer to a null terminated string that specifies the file name for the new file. It cannot be the name of an existing file. If <b>NULL</b>, this method creates a temporary file with a unique name, and you can call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istorage-stat">IStorage::Stat</a> to retrieve the name of the temporary file.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * | Return code | Description |
     * |----------------|---------------|
     * |S_OK | The file was successfully copied.|
     * |STG_E_MEDIUMFULL | The file was not copied because of insufficient space on the storage device.|
     * |STG_E_ACCESSDENIED | The file was not copied because the caller does not have permission to access storage device.|
     * |STG_E_INVALIDPOINTER | The file was not copied because the *pszFile* pointer is not valid.|
     * |STG_E_FILEALREADYEXISTS | The file was not copied because the new filename (*pszFile*) points to an existing file.|
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-irootstorage-switchtofile
     */
    SwitchToFile(pszFile) {
        pszFile := pszFile is String ? StrPtr(pszFile) : pszFile

        result := ComCall(3, this, "ptr", pszFile, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
