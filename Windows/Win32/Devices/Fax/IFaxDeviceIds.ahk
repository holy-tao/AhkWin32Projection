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
     * 
     * @param {Pointer<IUnknown>} ppUnk 
     * @returns {HRESULT} 
     */
    get__NewEnum(ppUnk) {
        result := ComCall(7, this, "ptr", ppUnk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @param {Pointer<Int32>} plDeviceId 
     * @returns {HRESULT} 
     */
    get_Item(lIndex, plDeviceId) {
        result := ComCall(8, this, "int", lIndex, "int*", plDeviceId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plCount 
     * @returns {HRESULT} 
     */
    get_Count(plCount) {
        result := ComCall(9, this, "int*", plCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lDeviceId 
     * @returns {HRESULT} 
     */
    Add(lDeviceId) {
        result := ComCall(10, this, "int", lDeviceId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @returns {HRESULT} 
     */
    Remove(lIndex) {
        result := ComCall(11, this, "int", lIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lDeviceId 
     * @param {Integer} lNewOrder 
     * @returns {HRESULT} 
     */
    SetOrder(lDeviceId, lNewOrder) {
        result := ComCall(12, this, "int", lDeviceId, "int", lNewOrder, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
