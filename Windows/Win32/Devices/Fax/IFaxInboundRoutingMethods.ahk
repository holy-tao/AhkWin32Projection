#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IFaxInboundRoutingMethods interface defines a configuration collection used by a fax client application to manage the ordered inbound fax routing methods.
 * @remarks
 * 
  * Each inbound routing method is represented by a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxinboundroutingmethod">IFaxInboundRoutingMethod</a> interface. The order of the routing methods in the collection determines the relative order in which the methods execute when an inbound fax requires routing.
  * 
  * A default implementation of <b>IFaxInboundRoutingMethods</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxinboundroutingmethods">FaxInboundRoutingMethods</a> object.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nn-faxcomex-ifaxinboundroutingmethods
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxInboundRoutingMethods extends IDispatch{
    /**
     * The interface identifier for IFaxInboundRoutingMethods
     * @type {Guid}
     */
    static IID => Guid("{783fca10-8908-4473-9d69-f67fbea0c6b9}")

    /**
     * The class identifier for FaxInboundRoutingMethods
     * @type {Guid}
     */
    static CLSID => Guid("{25fcb76a-b750-4b82-9266-fbbbae8922ba}")

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
     * @param {VARIANT} vIndex 
     * @param {Pointer<IFaxInboundRoutingMethod>} pFaxInboundRoutingMethod 
     * @returns {HRESULT} 
     */
    get_Item(vIndex, pFaxInboundRoutingMethod) {
        result := ComCall(8, this, "ptr", vIndex, "ptr", pFaxInboundRoutingMethod, "int")
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
}
