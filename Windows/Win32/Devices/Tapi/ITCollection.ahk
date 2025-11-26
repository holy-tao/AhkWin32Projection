#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITCollection interface allows Automation client applications, such as those written in Visual Basic, to retrieve collection information.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itcollection
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITCollection
     * @type {Guid}
     */
    static IID => Guid("{5ec5acf2-9c02-11d0-8362-00aa003ccabd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "get_Item", "get__NewEnum"]

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * The get_Count method gets the number of items in the collection.
     * @returns {Integer} Number of items.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itcollection-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &lCount := 0, "HRESULT")
        return lCount
    }

    /**
     * The get_Item method, given an index, returns an item in the collection.
     * @param {Integer} Index Index of item to be retrieved.
     * @returns {VARIANT} Pointer to item returned.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itcollection-get_item
     */
    get_Item(Index) {
        pVariant := VARIANT()
        result := ComCall(8, this, "int", Index, "ptr", pVariant, "HRESULT")
        return pVariant
    }

    /**
     * The get__NewEnum method gets an enumerator for the collection.
     * @returns {IUnknown} Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface on an enumerator object for the collection. 
     * 
     * 
     * 
     * 
     * Call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> method on the returned <b>IUnknown</b> interface to obtain a pointer to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-ienumvariant">IEnumVARIANT</a> enumeration interface on the collection. <b>IEnumVARIANT</b> provides a number of methods that you can use to iterate through the collection.
     * 
     * For more information, see the following Remarks section.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itcollection-get__newenum
     */
    get__NewEnum() {
        result := ComCall(9, this, "ptr*", &ppNewEnum := 0, "HRESULT")
        return IUnknown(ppNewEnum)
    }
}
