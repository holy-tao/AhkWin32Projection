#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IFsrmMutableCollection.ahk
#Include .\IFsrmCollection.ahk

/**
 * Used to manage a collection of FSRM objects that can have objects added to or removed from the collection.
 * @see https://docs.microsoft.com/windows/win32/api//fsrm/nn-fsrm-ifsrmmutablecollection
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmMutableCollection extends IFsrmCollection{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Add", "Remove", "RemoveById", "Clone"]

    /**
     * Adds an object to the collection.
     * @param {VARIANT} item A <b>VARIANT</b> that contains the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> interface of the object to add to the collection. Set the variant type to <b>VT_DISPATCH</b> and the <b>pdispVal</b> member to the <b>IDispatch</b> interface of the object.
     * @returns {HRESULT} The method returns the following return values.
     * @see https://docs.microsoft.com/windows/win32/api//fsrm/nf-fsrm-ifsrmmutablecollection-add
     */
    Add(item) {
        result := ComCall(14, this, "ptr", item, "HRESULT")
        return result
    }

    /**
     * Removes the specified object from the collection using an index value.
     * @param {Integer} index One-based index of the item to remove from the collection.
     * @returns {HRESULT} The method returns the following return values.
     * @see https://docs.microsoft.com/windows/win32/api//fsrm/nf-fsrm-ifsrmmutablecollection-remove
     */
    Remove(index) {
        result := ComCall(15, this, "int", index, "HRESULT")
        return result
    }

    /**
     * Removes the specified object from the collection using an object identifier.
     * @param {Guid} id Identifies the object to remove from the collection.
     * @returns {HRESULT} The method returns the following return values.
     * @see https://docs.microsoft.com/windows/win32/api//fsrm/nf-fsrm-ifsrmmutablecollection-removebyid
     */
    RemoveById(id) {
        result := ComCall(16, this, "ptr", id, "HRESULT")
        return result
    }

    /**
     * Creates a duplicate IFsrmMutableCollection collection.
     * @returns {IFsrmMutableCollection} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nn-fsrm-ifsrmmutablecollection">IFsrmMutableCollection</a> interface to a collection that is a duplicate of this collection.
     * @see https://docs.microsoft.com/windows/win32/api//fsrm/nf-fsrm-ifsrmmutablecollection-clone
     */
    Clone() {
        result := ComCall(17, this, "ptr*", &collection := 0, "HRESULT")
        return IFsrmMutableCollection(collection)
    }
}
