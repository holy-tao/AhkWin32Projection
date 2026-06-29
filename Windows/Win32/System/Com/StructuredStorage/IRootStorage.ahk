#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\IUnknown.ahk" { IUnknown }

/**
 * The IRootStorage interface contains a single method that switches a storage object to a different underlying file and saves the storage object to that file.
 * @see https://learn.microsoft.com/windows/win32/api/objidl/nn-objidl-irootstorage
 * @namespace Windows.Win32.System.Com.StructuredStorage
 */
export default struct IRootStorage extends IUnknown {
    /**
     * The interface identifier for IRootStorage
     * @type {Guid}
     */
    static IID := Guid("{00000012-0000-0000-c000-000000000046}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRootStorage interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SwitchToFile : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRootStorage.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-irootstorage-switchtofile
     */
    SwitchToFile(pszFile) {
        pszFile := pszFile is String ? StrPtr(pszFile) : pszFile

        result := ComCall(3, this, "ptr", pszFile, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRootStorage.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SwitchToFile := CallbackCreate(GetMethod(implObj, "SwitchToFile"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SwitchToFile)
    }
}
