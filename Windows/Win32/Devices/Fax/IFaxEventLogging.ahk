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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_InitEventsLevel", "put_InitEventsLevel", "get_InboundEventsLevel", "put_InboundEventsLevel", "get_OutboundEventsLevel", "put_OutboundEventsLevel", "get_GeneralEventsLevel", "put_GeneralEventsLevel", "Refresh", "Save"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxeventlogging-get_initeventslevel
     */
    get_InitEventsLevel() {
        result := ComCall(7, this, "int*", &pInitEventLevel := 0, "HRESULT")
        return pInitEventLevel
    }

    /**
     * 
     * @param {Integer} InitEventLevel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxeventlogging-put_initeventslevel
     */
    put_InitEventsLevel(InitEventLevel) {
        result := ComCall(8, this, "int", InitEventLevel, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxeventlogging-get_inboundeventslevel
     */
    get_InboundEventsLevel() {
        result := ComCall(9, this, "int*", &pInboundEventLevel := 0, "HRESULT")
        return pInboundEventLevel
    }

    /**
     * 
     * @param {Integer} InboundEventLevel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxeventlogging-put_inboundeventslevel
     */
    put_InboundEventsLevel(InboundEventLevel) {
        result := ComCall(10, this, "int", InboundEventLevel, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxeventlogging-get_outboundeventslevel
     */
    get_OutboundEventsLevel() {
        result := ComCall(11, this, "int*", &pOutboundEventLevel := 0, "HRESULT")
        return pOutboundEventLevel
    }

    /**
     * 
     * @param {Integer} OutboundEventLevel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxeventlogging-put_outboundeventslevel
     */
    put_OutboundEventsLevel(OutboundEventLevel) {
        result := ComCall(12, this, "int", OutboundEventLevel, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxeventlogging-get_generaleventslevel
     */
    get_GeneralEventsLevel() {
        result := ComCall(13, this, "int*", &pGeneralEventLevel := 0, "HRESULT")
        return pGeneralEventLevel
    }

    /**
     * 
     * @param {Integer} GeneralEventLevel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxeventlogging-put_generaleventslevel
     */
    put_GeneralEventsLevel(GeneralEventLevel) {
        result := ComCall(14, this, "int", GeneralEventLevel, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxeventlogging-refresh
     */
    Refresh() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxeventlogging-save
     */
    Save() {
        result := ComCall(16, this, "HRESULT")
        return result
    }
}
