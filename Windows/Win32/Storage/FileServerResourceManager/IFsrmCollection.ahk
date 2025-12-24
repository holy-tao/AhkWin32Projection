#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Defines a collection of FSRM objects.
 * @see https://docs.microsoft.com/windows/win32/api//fsrm/nn-fsrm-ifsrmcollection
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFsrmCollection
     * @type {Guid}
     */
    static IID => Guid("{f76fbf3b-8ddd-4b42-b05a-cb1c3ff1fee8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get__NewEnum", "get_Item", "get_Count", "get_State", "Cancel", "WaitForCompletion", "GetById"]

    /**
     * @type {IUnknown} 
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
     * @type {Integer} 
     */
    State {
        get => this.get_State()
    }

    /**
     * Retrieves the IUnknown pointer of a new IEnumVARIANT enumeration for the items in the collection.
     * @remarks
     * 
     * C/C++ users use this method to enumerate items in the collection. Call the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> of the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface to get the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-ienumvariant">IEnumVARIANT</a> interface. Use the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nf-oaidl-ienumvariant-next">IEnumVARIANT::Next</a> method to enumerate 
     *     the items of the collection. The items are returned as <b>VARIANT</b> values.
     * 
     * If the collection contains interfaces, the  variant type is <b>VT_DISPATCH</b>. Call the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> method on the 
     *     <b>pdispVal</b> member of the variant to get an interface to the specific object. For example, 
     *     if the collection contains report objects, you would query the <b>pdispVal</b> member for the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nn-fsrmreports-ifsrmreport">IFsrmReport</a> interface.
     * 
     * If the item is an <b>HRESULT</b> value, the variant type is 
     *     <b>VT_I4</b>. Use the <b>lVal</b> member of the variant to get the 
     *     <b>HRESULT</b> value.
     * 
     * 
     * @returns {IUnknown} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrm/nf-fsrm-ifsrmcollection-get__newenum
     */
    get__NewEnum() {
        result := ComCall(7, this, "ptr*", &unknown := 0, "HRESULT")
        return IUnknown(unknown)
    }

    /**
     * Retrieves the requested item from the collection.
     * @remarks
     * 
     * If the item is an interface, the variant type is <b>VT_DISPATCH</b>. Call the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> method on the 
     *     <b>pdispVal</b> member of the variant to get an interface to the specific object.
     * 
     * If the item is an <b>HRESULT</b> value, the variant type is 
     *     <b>VT_I4</b>. Use the <b>lVal</b> member of the variant to get the 
     *     <b>HRESULT</b> value.
     * 
     * 
     * 
     * @param {Integer} index 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrm/nf-fsrm-ifsrmcollection-get_item
     */
    get_Item(index) {
        item := VARIANT()
        result := ComCall(8, this, "int", index, "ptr", item, "HRESULT")
        return item
    }

    /**
     * Retrieves the number of items in the collection.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrm/nf-fsrm-ifsrmcollection-get_count
     */
    get_Count() {
        result := ComCall(9, this, "int*", &count := 0, "HRESULT")
        return count
    }

    /**
     * Retrieves the state of the collection.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrm/nf-fsrm-ifsrmcollection-get_state
     */
    get_State() {
        result := ComCall(10, this, "int*", &state := 0, "HRESULT")
        return state
    }

    /**
     * Cancels the collection of objects when the objects are collected asynchronously.
     * @returns {HRESULT} The method returns the following return values.
     * @see https://docs.microsoft.com/windows/win32/api//fsrm/nf-fsrm-ifsrmcollection-cancel
     */
    Cancel() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * Limits the time that an asynchronous collection can take to collect the objects.
     * @param {Integer} waitSeconds The number of seconds to wait for the collection to finish collecting objects. To wait indefinitely, set this parameter to –1.
     * @returns {VARIANT_BOOL} Is <b>VARIANT_TRUE</b> if the collection finished collecting objects in the time specified; otherwise, <b>VARIANT_FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//fsrm/nf-fsrm-ifsrmcollection-waitforcompletion
     */
    WaitForCompletion(waitSeconds) {
        result := ComCall(12, this, "int", waitSeconds, "short*", &completed := 0, "HRESULT")
        return completed
    }

    /**
     * Retrieves the specified object from the collection.
     * @param {Guid} id Identifies the object to retrieve from the collection.
     * @returns {VARIANT} A <b>VARIANT</b> that contains the retrieved object. The variant type is <b>VT_DISPATCH</b>. Use the <b>pdispVal</b> member to access the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> interface of the object.
     * @see https://docs.microsoft.com/windows/win32/api//fsrm/nf-fsrm-ifsrmcollection-getbyid
     */
    GetById(id) {
        entry := VARIANT()
        result := ComCall(13, this, "ptr", id, "ptr", entry, "HRESULT")
        return entry
    }
}
