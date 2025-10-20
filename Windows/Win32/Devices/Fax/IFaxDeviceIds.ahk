#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<IUnknown>} ppUnk 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdeviceids-get__newenum
     */
    get__NewEnum(ppUnk) {
        result := ComCall(7, this, "ptr*", ppUnk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @param {Pointer<Integer>} plDeviceId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdeviceids-get_item
     */
    get_Item(lIndex, plDeviceId) {
        result := ComCall(8, this, "int", lIndex, "int*", plDeviceId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdeviceids-get_count
     */
    get_Count(plCount) {
        result := ComCall(9, this, "int*", plCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lDeviceId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdeviceids-add
     */
    Add(lDeviceId) {
        result := ComCall(10, this, "int", lDeviceId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdeviceids-remove
     */
    Remove(lIndex) {
        result := ComCall(11, this, "int", lIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lDeviceId 
     * @param {Integer} lNewOrder 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdeviceids-setorder
     */
    SetOrder(lDeviceId, lNewOrder) {
        result := ComCall(12, this, "int", lDeviceId, "int", lNewOrder, "HRESULT")
        return result
    }
}
