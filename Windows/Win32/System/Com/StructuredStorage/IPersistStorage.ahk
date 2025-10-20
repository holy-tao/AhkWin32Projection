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
     * 
     * @returns {HRESULT} 
     */
    IsDirty() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStorage>} pStg 
     * @returns {HRESULT} 
     */
    InitNew(pStg) {
        result := ComCall(5, this, "ptr", pStg, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStorage>} pStg 
     * @returns {HRESULT} 
     */
    Load(pStg) {
        result := ComCall(6, this, "ptr", pStg, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStorage>} pStgSave 
     * @param {BOOL} fSameAsLoad 
     * @returns {HRESULT} 
     */
    Save(pStgSave, fSameAsLoad) {
        result := ComCall(7, this, "ptr", pStgSave, "int", fSameAsLoad, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStorage>} pStgNew 
     * @returns {HRESULT} 
     */
    SaveCompleted(pStgNew) {
        result := ComCall(8, this, "ptr", pStgNew, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    HandsOffStorage() {
        result := ComCall(9, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
