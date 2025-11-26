#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IFaxDeviceIds interface defines a configuration collection used by a fax client application to enumerate the ordered fax device IDs associated with a FaxOutboundRoutingGroup object.
 * @remarks
 * 
 * A default implementation of <b>IFaxDeviceIds</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdeviceids">FaxDeviceIds</a> object.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nn-faxcomex-ifaxdeviceids
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxDeviceIds extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFaxDeviceIds
     * @type {Guid}
     */
    static IID => Guid("{2f0f813f-4ce9-443e-8ca1-738cfaeee149}")

    /**
     * The class identifier for FaxDeviceIds
     * @type {Guid}
     */
    static CLSID => Guid("{cdc539ea-7277-460e-8de0-48a0a5760d1f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get__NewEnum", "get_Item", "get_Count", "Add", "Remove", "SetOrder"]

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
     * The IFaxDeviceIds::get__NewEnum method returns a reference to an enumerator object that you can use to iterate through the FaxDeviceIds collection.
     * @returns {IUnknown} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>**</b>
     * 
     * Receives an indirect pointer to the enumerator object's <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface for the collection.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdeviceids-get__newenum
     */
    get__NewEnum() {
        result := ComCall(7, this, "ptr*", &ppUnk := 0, "HRESULT")
        return IUnknown(ppUnk)
    }

    /**
     * The IFaxDeviceIds::get_Item method represents a device ID from the FaxDeviceIds collection.
     * @param {Integer} lIndex Type: <b>long</b>
     * 
     * A value specifying the item to retrieve from the collection. Valid values for this parameter are in the range from 1 to n, where n is the number of devices returned by a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdeviceids-count-vb">IFaxDeviceIds::get_Count</a> method.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * Pointer to a value that receives the item requested.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdeviceids-get_item
     */
    get_Item(lIndex) {
        result := ComCall(8, this, "int", lIndex, "int*", &plDeviceId := 0, "HRESULT")
        return plDeviceId
    }

    /**
     * The IFaxDeviceIds::get_Count property represents the number of objects in the FaxDeviceIds collection. This is the total number of device IDs associated with the fax server.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdeviceids-get_count
     */
    get_Count() {
        result := ComCall(9, this, "int*", &plCount := 0, "HRESULT")
        return plCount
    }

    /**
     * The IFaxDeviceIds::Add method adds a fax device to the FaxDeviceIds collection, using the device's ID.
     * @param {Integer} lDeviceId Type: <b>long</b>
     * 
     * A <b>long</b> value that specifies the ID of the fax device to add to the collection.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdeviceids-add
     */
    Add(lDeviceId) {
        result := ComCall(10, this, "int", lDeviceId, "HRESULT")
        return result
    }

    /**
     * The IFaxDeviceIds::Remove method removes an item from the FaxDeviceIds collection.
     * @param {Integer} lIndex Type: <b>long</b>
     * 
     * A <b>long</b> value that specifies the index of the item to remove from the collection. Valid values for this parameter are in the range from 1 to n, where n is the number of devices returned by a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdeviceids-count-vb">IFaxDeviceIds::get_Count</a> property.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdeviceids-remove
     */
    Remove(lIndex) {
        result := ComCall(11, this, "int", lIndex, "HRESULT")
        return result
    }

    /**
     * The IFaxDeviceIds::SetOrder method changes the order of a device in the ordered FaxDeviceIds collection.
     * @param {Integer} lDeviceId Type: <b>long</b>
     * 
     * Specifies the device ID of the device whose order you want to change.
     * @param {Integer} lNewOrder Type: <b>long</b>
     * 
     * Specifies the new position of the device in the order.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdeviceids-setorder
     */
    SetOrder(lDeviceId, lNewOrder) {
        result := ComCall(12, this, "int", lDeviceId, "int", lNewOrder, "HRESULT")
        return result
    }
}
