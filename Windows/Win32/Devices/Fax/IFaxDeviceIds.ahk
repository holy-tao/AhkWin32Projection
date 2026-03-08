#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IFaxDeviceIds interface defines a configuration collection used by a fax client application to enumerate the ordered fax device IDs associated with a FaxOutboundRoutingGroup object.
 * @remarks
 * A default implementation of <b>IFaxDeviceIds</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdeviceids">FaxDeviceIds</a> object.
 * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nn-faxcomex-ifaxdeviceids
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
     * @remarks
     * In Microsoft Visual Basic, you do not need to use the corresponding <b>_NewEnum</b> property, because it is automatically used in the implementation of <b>For Each ... Next</b>.
     * @returns {IUnknown} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>**</b>
     * 
     * Receives an indirect pointer to the enumerator object's <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface for the collection.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdeviceids-get__newenum
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
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdeviceids-get_item
     */
    get_Item(lIndex) {
        result := ComCall(8, this, "int", lIndex, "int*", &plDeviceId := 0, "HRESULT")
        return plDeviceId
    }

    /**
     * The IFaxDeviceIds::get_Count property represents the number of objects in the FaxDeviceIds collection. This is the total number of device IDs associated with the fax server.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdeviceids-get_count
     */
    get_Count() {
        result := ComCall(9, this, "int*", &plCount := 0, "HRESULT")
        return plCount
    }

    /**
     * The IFaxDeviceIds::Add method adds a fax device to the FaxDeviceIds collection, using the device's ID.
     * @remarks
     * This method can also return remote procedure call (RPC) return values. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Rpc/rpc-return-values">RPC Return Values</a>.
     * 
     * <div class="alert"><b>Note</b>  You cannot add devices to the special <b>All Devices</b> routing group. Also, you can only add valid device IDs. You can obtain the valid ID of a device in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdeviceids">FaxDeviceIds</a> collection through the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdevice-id-vb">Id</a> property.</div>
     * <div> </div>
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farMANAGE_CONFIG</a> access right.
     * @param {Integer} lDeviceId Type: <b>long</b>
     * 
     * A <b>long</b> value that specifies the ID of the fax device to add to the collection.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdeviceids-add
     */
    Add(lDeviceId) {
        result := ComCall(10, this, "int", lDeviceId, "HRESULT")
        return result
    }

    /**
     * The IFaxDeviceIds::Remove method removes an item from the FaxDeviceIds collection.
     * @remarks
     * <div class="alert"><b>Note</b>  You cannot remove devices from the special <b>All Devices</b> routing group.</div>
     * <div> </div>
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farMANAGE_CONFIG</a> access right.
     * @param {Integer} lIndex Type: <b>long</b>
     * 
     * A <b>long</b> value that specifies the index of the item to remove from the collection. Valid values for this parameter are in the range from 1 to n, where n is the number of devices returned by a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdeviceids-count-vb">IFaxDeviceIds::get_Count</a> property.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdeviceids-remove
     */
    Remove(lIndex) {
        result := ComCall(11, this, "int", lIndex, "HRESULT")
        return result
    }

    /**
     * The IFaxDeviceIds::SetOrder method changes the order of a device in the ordered FaxDeviceIds collection.
     * @remarks
     * You identify the device with its device ID, and then choose a new place for it in the order. If you move the device closer to the top of the order, the devices below that position in the order will drop down to accommodate the change. If you move the device closer to the bottom of the order, the devices above that position in the order will move up to fill the gap caused by the change.
     * 
     * In a fax device group, the relative order of the devices within the group is significant. When the fax service initiates an outgoing job, it attempts to select the first fax device in the device group. If that device is not available, the service selects the next available device that follows in rank order, and so on. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-fax-device-groups">Fax Device Groups</a>.
     * 
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farMANAGE_CONFIG</a> access right.
     * @param {Integer} lDeviceId Type: <b>long</b>
     * 
     * Specifies the device ID of the device whose order you want to change.
     * @param {Integer} lNewOrder Type: <b>long</b>
     * 
     * Specifies the new position of the device in the order.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdeviceids-setorder
     */
    SetOrder(lDeviceId, lNewOrder) {
        result := ComCall(12, this, "int", lDeviceId, "int", lNewOrder, "HRESULT")
        return result
    }
}
