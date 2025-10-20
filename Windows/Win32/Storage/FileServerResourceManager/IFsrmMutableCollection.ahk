#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IFsrmCollection.ahk

/**
 * Used to manage a collection of FSRM objects that can have objects added to or removed from the collection.
 * @see https://docs.microsoft.com/windows/win32/api//fsrm/nn-fsrm-ifsrmmutablecollection
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmMutableCollection extends IFsrmCollection{
    /**
     * The interface identifier for IFsrmMutableCollection
     * @type {Guid}
     */
    static IID => Guid("{1bb617b8-3886-49dc-af82-a6c90fa35dda}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * 
     * @param {VARIANT} item 
     * @returns {HRESULT} 
     */
    Add(item) {
        result := ComCall(14, this, "ptr", item, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {HRESULT} 
     */
    Remove(index) {
        result := ComCall(15, this, "int", index, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} id 
     * @returns {HRESULT} 
     */
    RemoveById(id) {
        result := ComCall(16, this, "ptr", id, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFsrmMutableCollection>} collection 
     * @returns {HRESULT} 
     */
    Clone(collection) {
        result := ComCall(17, this, "ptr", collection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
