#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IFaxInboundRoutingExtensions interface defines a configuration collection used by a fax client application to manage the inbound fax routing extensions registered with the fax service.
 * @remarks
 * 
  * A default implementation of <b>IFaxInboundRoutingExtensions</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxinboundroutingextensions">FaxInboundRoutingExtensions</a> object.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nn-faxcomex-ifaxinboundroutingextensions
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxInboundRoutingExtensions extends IDispatch{
    /**
     * The interface identifier for IFaxInboundRoutingExtensions
     * @type {Guid}
     */
    static IID => Guid("{2f6c9673-7b26-42de-8eb0-915dcd2a4f4c}")

    /**
     * The class identifier for FaxInboundRoutingExtensions
     * @type {Guid}
     */
    static CLSID => Guid("{189a48ed-623c-4c0d-80f2-d66c7b9efec2}")

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
     * @param {Pointer<IFaxInboundRoutingExtension>} pFaxInboundRoutingExtension 
     * @returns {HRESULT} 
     */
    get_Item(vIndex, pFaxInboundRoutingExtension) {
        result := ComCall(8, this, "ptr", vIndex, "ptr", pFaxInboundRoutingExtension, "int")
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
