#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IFaxEventLogging interface defines a configuration object used by a fax client application to configure the event logging categories used by the fax service.
 * @remarks
 * 
  * A default implementation of <b>IFaxEventLogging</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxeventlogging">FaxEventLogging</a> object.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nn-faxcomex-ifaxeventlogging
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxEventLogging extends IDispatch{
    /**
     * The interface identifier for IFaxEventLogging
     * @type {Guid}
     */
    static IID => Guid("{0880d965-20e8-42e4-8e17-944f192caad4}")

    /**
     * The class identifier for FaxEventLogging
     * @type {Guid}
     */
    static CLSID => Guid("{a6850930-a0f6-4a6f-95b7-db2ebf3d02e3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<Int32>} pInitEventLevel 
     * @returns {HRESULT} 
     */
    get_InitEventsLevel(pInitEventLevel) {
        result := ComCall(7, this, "int*", pInitEventLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} InitEventLevel 
     * @returns {HRESULT} 
     */
    put_InitEventsLevel(InitEventLevel) {
        result := ComCall(8, this, "int", InitEventLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pInboundEventLevel 
     * @returns {HRESULT} 
     */
    get_InboundEventsLevel(pInboundEventLevel) {
        result := ComCall(9, this, "int*", pInboundEventLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} InboundEventLevel 
     * @returns {HRESULT} 
     */
    put_InboundEventsLevel(InboundEventLevel) {
        result := ComCall(10, this, "int", InboundEventLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pOutboundEventLevel 
     * @returns {HRESULT} 
     */
    get_OutboundEventsLevel(pOutboundEventLevel) {
        result := ComCall(11, this, "int*", pOutboundEventLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} OutboundEventLevel 
     * @returns {HRESULT} 
     */
    put_OutboundEventsLevel(OutboundEventLevel) {
        result := ComCall(12, this, "int", OutboundEventLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pGeneralEventLevel 
     * @returns {HRESULT} 
     */
    get_GeneralEventsLevel(pGeneralEventLevel) {
        result := ComCall(13, this, "int*", pGeneralEventLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} GeneralEventLevel 
     * @returns {HRESULT} 
     */
    put_GeneralEventsLevel(GeneralEventLevel) {
        result := ComCall(14, this, "int", GeneralEventLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Refresh() {
        result := ComCall(15, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Save() {
        result := ComCall(16, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
