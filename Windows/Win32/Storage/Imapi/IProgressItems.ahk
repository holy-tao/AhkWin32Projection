#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Ole\IEnumVARIANT.ahk
#Include .\IProgressItem.ahk
#Include .\IEnumProgressItems.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Use this interface to enumerate the progress items in a result image.
 * @remarks
 * This is a <b>ProgressItems</b> object in script.
 * @see https://learn.microsoft.com/windows/win32/api//content/imapi2fs/nn-imapi2fs-iprogressitems
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IProgressItems extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProgressItems
     * @type {Guid}
     */
    static IID => Guid("{2c941fd7-975b-59be-a960-9a2a262853a5}")

    /**
     * The class identifier for ProgressItems
     * @type {Guid}
     */
    static CLSID => Guid("{2c941fc9-975b-59be-a960-9a2a262853a5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get__NewEnum", "get_Item", "get_Count", "ProgressItemFromBlock", "ProgressItemFromDescription", "get_EnumProgressItems"]

    /**
     * @type {IEnumVARIANT} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * @type {IEnumProgressItems} 
     */
    EnumProgressItems {
        get => this.get_EnumProgressItems()
    }

    /**
     * Retrieves the list of progress items from the collection. (IProgressItems.get__NewEnum)
     * @remarks
     * The enumeration is a snapshot of the progress items contained in the collection at the time of the call.
     * 
     * To retrieve a single item, see the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-iprogressitems-get_item">IProgressItems::get_Item</a> property.
     * @returns {IEnumVARIANT} An <b>IEnumVariant</b> interface that you use to enumerate the progress items contained within the collection. Each  item of the enumeration is a VARIANT whose type is <b>VT_DISPATCH</b>. Query the <b>pdispVal</b> member to retrieve the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nn-imapi2fs-iprogressitem">IProgressItem</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2fs/nf-imapi2fs-iprogressitems-get__newenum
     */
    get__NewEnum() {
        result := ComCall(7, this, "ptr*", &NewEnum := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IEnumVARIANT(NewEnum)
    }

    /**
     * Retrieves the specified progress item from the collection.
     * @remarks
     * To enumerate all progress items, call the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-iprogressitems-get__newenum">IProgressItems::get__NewEnum</a> method.
     * @param {Integer} Index Zero-based index number corresponding to a progress item in the collection.
     * @returns {IProgressItem} An <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nn-imapi2fs-iprogressitem">IProgressItem</a> interface associated with the specified index value.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2fs/nf-imapi2fs-iprogressitems-get_item
     */
    get_Item(Index) {
        result := ComCall(8, this, "int", Index, "ptr*", &item := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IProgressItem(item)
    }

    /**
     * Retrieves the number of progress items in the collection.
     * @returns {Integer} Number of progress items in the collection.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2fs/nf-imapi2fs-iprogressitems-get_count
     */
    get_Count() {
        result := ComCall(9, this, "int*", &Count := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Count
    }

    /**
     * Retrieves a progress item based on the specified block number.
     * @param {Integer} block Block number of the progress item to retrieve. The method returns the progress item if the block number is in the first and last block range of the item.
     * @returns {IProgressItem} An <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nn-imapi2fs-iprogressitem">IProgressItem</a> interface associated with the specified block number.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2fs/nf-imapi2fs-iprogressitems-progressitemfromblock
     */
    ProgressItemFromBlock(block) {
        result := ComCall(10, this, "uint", block, "ptr*", &item := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IProgressItem(item)
    }

    /**
     * Retrieves a progress item based on the specified file name.
     * @param {BSTR} description String that contains the file name of the progress item to retrieve. The method returns the progress item if this string matches the value for item's description property.
     * @returns {IProgressItem} An <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nn-imapi2fs-iprogressitem">IProgressItem</a> interface of the progress item associated with the specified file name.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2fs/nf-imapi2fs-iprogressitems-progressitemfromdescription
     */
    ProgressItemFromDescription(description) {
        if(description is String) {
            pin := BSTR.Alloc(description)
            description := pin.Value
        }

        result := ComCall(11, this, "ptr", description, "ptr*", &item := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IProgressItem(item)
    }

    /**
     * Retrieves the list of progress items from the collection. (IProgressItems.get_EnumProgressItems)
     * @remarks
     * This property returns the same results as the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-iprogressitems-get__newenum">IProgressItems::get__NewEnum</a> property and is meant for use by C/C++ applications.
     * @returns {IEnumProgressItems} An <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nn-imapi2fs-ienumprogressitems">IEnumProgressItems</a> interface that contains a collection of the progress items contained in the collection.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2fs/nf-imapi2fs-iprogressitems-get_enumprogressitems
     */
    get_EnumProgressItems() {
        result := ComCall(12, this, "ptr*", &NewEnum := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IEnumProgressItems(NewEnum)
    }
}
