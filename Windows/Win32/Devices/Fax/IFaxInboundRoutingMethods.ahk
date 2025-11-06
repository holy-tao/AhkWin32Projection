#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include .\IFaxInboundRoutingMethod.ahk
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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get__NewEnum", "get_Item", "get_Count"]

    /**
     * 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxinboundroutingmethods-get__newenum
     */
    get__NewEnum() {
        result := ComCall(7, this, "ptr*", &ppUnk := 0, "HRESULT")
        return IUnknown(ppUnk)
    }

    /**
     * 
     * @param {VARIANT} vIndex 
     * @returns {IFaxInboundRoutingMethod} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxinboundroutingmethods-get_item
     */
    get_Item(vIndex) {
        result := ComCall(8, this, "ptr", vIndex, "ptr*", &pFaxInboundRoutingMethod := 0, "HRESULT")
        return IFaxInboundRoutingMethod(pFaxInboundRoutingMethod)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxinboundroutingmethods-get_count
     */
    get_Count() {
        result := ComCall(9, this, "int*", &plCount := 0, "HRESULT")
        return plCount
    }
}
