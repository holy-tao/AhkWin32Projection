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
     * @type {Integer} 
     */
    InitEventsLevel {
        get => this.get_InitEventsLevel()
        set => this.put_InitEventsLevel(value)
    }

    /**
     * @type {Integer} 
     */
    InboundEventsLevel {
        get => this.get_InboundEventsLevel()
        set => this.put_InboundEventsLevel(value)
    }

    /**
     * @type {Integer} 
     */
    OutboundEventsLevel {
        get => this.get_OutboundEventsLevel()
        set => this.put_OutboundEventsLevel(value)
    }

    /**
     * @type {Integer} 
     */
    GeneralEventsLevel {
        get => this.get_GeneralEventsLevel()
        set => this.put_GeneralEventsLevel(value)
    }

    /**
     * The IFaxEventLogging::get_InitEventsLevel property indicates the level of detail at which the fax service logs initialization (starting the server) and termination (shutting down the server) events in the application log.
     * @remarks
     * 
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxeventlogging-get_initeventslevel
     */
    get_InitEventsLevel() {
        result := ComCall(7, this, "int*", &pInitEventLevel := 0, "HRESULT")
        return pInitEventLevel
    }

    /**
     * The IFaxEventLogging::get_InitEventsLevel property indicates the level of detail at which the fax service logs initialization (starting the server) and termination (shutting down the server) events in the application log.
     * @remarks
     * 
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * 
     * 
     * @param {Integer} InitEventLevel 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxeventlogging-put_initeventslevel
     */
    put_InitEventsLevel(InitEventLevel) {
        result := ComCall(8, this, "int", InitEventLevel, "HRESULT")
        return result
    }

    /**
     * The IFaxEventLogging::get_InboundEventsLevel property indicates the level of detail at which the fax service logs events about inbound fax transmissions in the application log.
     * @remarks
     * 
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxeventlogging-get_inboundeventslevel
     */
    get_InboundEventsLevel() {
        result := ComCall(9, this, "int*", &pInboundEventLevel := 0, "HRESULT")
        return pInboundEventLevel
    }

    /**
     * The IFaxEventLogging::get_InboundEventsLevel property indicates the level of detail at which the fax service logs events about inbound fax transmissions in the application log.
     * @remarks
     * 
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * 
     * 
     * @param {Integer} InboundEventLevel 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxeventlogging-put_inboundeventslevel
     */
    put_InboundEventsLevel(InboundEventLevel) {
        result := ComCall(10, this, "int", InboundEventLevel, "HRESULT")
        return result
    }

    /**
     * The IFaxEventLogging::get_OutboundEventsLevel property indicates the level of detail at which the fax service logs events about outbound fax transmissions in the application log.
     * @remarks
     * 
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxeventlogging-get_outboundeventslevel
     */
    get_OutboundEventsLevel() {
        result := ComCall(11, this, "int*", &pOutboundEventLevel := 0, "HRESULT")
        return pOutboundEventLevel
    }

    /**
     * The IFaxEventLogging::get_OutboundEventsLevel property indicates the level of detail at which the fax service logs events about outbound fax transmissions in the application log.
     * @remarks
     * 
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * 
     * 
     * @param {Integer} OutboundEventLevel 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxeventlogging-put_outboundeventslevel
     */
    put_OutboundEventsLevel(OutboundEventLevel) {
        result := ComCall(12, this, "int", OutboundEventLevel, "HRESULT")
        return result
    }

    /**
     * The IFaxEventLogging::get_GeneralEventsLevel property indicates the level of detail at which the fax service logs general events in the application log.
     * @remarks
     * 
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxeventlogging-get_generaleventslevel
     */
    get_GeneralEventsLevel() {
        result := ComCall(13, this, "int*", &pGeneralEventLevel := 0, "HRESULT")
        return pGeneralEventLevel
    }

    /**
     * The IFaxEventLogging::get_GeneralEventsLevel property indicates the level of detail at which the fax service logs general events in the application log.
     * @remarks
     * 
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * 
     * 
     * @param {Integer} GeneralEventLevel 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxeventlogging-put_generaleventslevel
     */
    put_GeneralEventsLevel(GeneralEventLevel) {
        result := ComCall(14, this, "int", GeneralEventLevel, "HRESULT")
        return result
    }

    /**
     * The IFaxEventLogging::Refresh method refreshes IFaxEventLogging interface information from the fax server.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxeventlogging-refresh
     */
    Refresh() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * The IFaxEventLogging::Save method saves the IFaxEventLogging interface's data.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxeventlogging-save
     */
    Save() {
        result := ComCall(16, this, "HRESULT")
        return result
    }
}
