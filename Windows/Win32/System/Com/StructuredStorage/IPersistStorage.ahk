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
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-ipersiststorage-isdirty
     */
    IsDirty() {
        result := ComCall(4, this, "int")
        return result
    }

    /**
     * 
     * @param {IStorage} pStg 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-ipersiststorage-initnew
     */
    InitNew(pStg) {
        result := ComCall(5, this, "ptr", pStg, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStorage} pStg 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-ipersiststorage-load
     */
    Load(pStg) {
        result := ComCall(6, this, "ptr", pStg, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStorage} pStgSave 
     * @param {BOOL} fSameAsLoad 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-ipersiststorage-save
     */
    Save(pStgSave, fSameAsLoad) {
        result := ComCall(7, this, "ptr", pStgSave, "int", fSameAsLoad, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStorage} pStgNew 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-ipersiststorage-savecompleted
     */
    SaveCompleted(pStgNew) {
        result := ComCall(8, this, "ptr", pStgNew, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-ipersiststorage-handsoffstorage
     */
    HandsOffStorage() {
        result := ComCall(9, this, "HRESULT")
        return result
    }
}
