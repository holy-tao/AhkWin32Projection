#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\FAX_LOG_LEVEL_ENUM.ahk" { FAX_LOG_LEVEL_ENUM }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IFaxEventLogging interface defines a configuration object used by a fax client application to configure the event logging categories used by the fax service.
 * @remarks
 * A default implementation of <b>IFaxEventLogging</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxeventlogging">FaxEventLogging</a> object.
 * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nn-faxcomex-ifaxeventlogging
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct IFaxEventLogging extends IDispatch {
    /**
     * The interface identifier for IFaxEventLogging
     * @type {Guid}
     */
    static IID := Guid("{0880d965-20e8-42e4-8e17-944f192caad4}")

    /**
     * The class identifier for FaxEventLogging
     * @type {Guid}
     */
    static CLSID := Guid("{a6850930-a0f6-4a6f-95b7-db2ebf3d02e3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFaxEventLogging interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_InitEventsLevel     : IntPtr
        put_InitEventsLevel     : IntPtr
        get_InboundEventsLevel  : IntPtr
        put_InboundEventsLevel  : IntPtr
        get_OutboundEventsLevel : IntPtr
        put_OutboundEventsLevel : IntPtr
        get_GeneralEventsLevel  : IntPtr
        put_GeneralEventsLevel  : IntPtr
        Refresh                 : IntPtr
        Save                    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFaxEventLogging.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {FAX_LOG_LEVEL_ENUM} 
     */
    InitEventsLevel {
        get => this.get_InitEventsLevel()
        set => this.put_InitEventsLevel(value)
    }

    /**
     * @type {FAX_LOG_LEVEL_ENUM} 
     */
    InboundEventsLevel {
        get => this.get_InboundEventsLevel()
        set => this.put_InboundEventsLevel(value)
    }

    /**
     * @type {FAX_LOG_LEVEL_ENUM} 
     */
    OutboundEventsLevel {
        get => this.get_OutboundEventsLevel()
        set => this.put_OutboundEventsLevel(value)
    }

    /**
     * @type {FAX_LOG_LEVEL_ENUM} 
     */
    GeneralEventsLevel {
        get => this.get_GeneralEventsLevel()
        set => this.put_GeneralEventsLevel(value)
    }

    /**
     * The IFaxEventLogging::get_InitEventsLevel property indicates the level of detail at which the fax service logs initialization (starting the server) and termination (shutting down the server) events in the application log. (Get)
     * @remarks
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @returns {FAX_LOG_LEVEL_ENUM} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxeventlogging-get_initeventslevel
     */
    get_InitEventsLevel() {
        result := ComCall(7, this, "int*", &pInitEventLevel := 0, "HRESULT")
        return pInitEventLevel
    }

    /**
     * The IFaxEventLogging::get_InitEventsLevel property indicates the level of detail at which the fax service logs initialization (starting the server) and termination (shutting down the server) events in the application log. (Put)
     * @remarks
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @param {FAX_LOG_LEVEL_ENUM} InitEventLevel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxeventlogging-put_initeventslevel
     */
    put_InitEventsLevel(InitEventLevel) {
        result := ComCall(8, this, FAX_LOG_LEVEL_ENUM, InitEventLevel, "HRESULT")
        return result
    }

    /**
     * The IFaxEventLogging::get_InboundEventsLevel property indicates the level of detail at which the fax service logs events about inbound fax transmissions in the application log. (Get)
     * @remarks
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @returns {FAX_LOG_LEVEL_ENUM} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxeventlogging-get_inboundeventslevel
     */
    get_InboundEventsLevel() {
        result := ComCall(9, this, "int*", &pInboundEventLevel := 0, "HRESULT")
        return pInboundEventLevel
    }

    /**
     * The IFaxEventLogging::get_InboundEventsLevel property indicates the level of detail at which the fax service logs events about inbound fax transmissions in the application log. (Put)
     * @remarks
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @param {FAX_LOG_LEVEL_ENUM} InboundEventLevel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxeventlogging-put_inboundeventslevel
     */
    put_InboundEventsLevel(InboundEventLevel) {
        result := ComCall(10, this, FAX_LOG_LEVEL_ENUM, InboundEventLevel, "HRESULT")
        return result
    }

    /**
     * The IFaxEventLogging::get_OutboundEventsLevel property indicates the level of detail at which the fax service logs events about outbound fax transmissions in the application log. (Get)
     * @remarks
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @returns {FAX_LOG_LEVEL_ENUM} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxeventlogging-get_outboundeventslevel
     */
    get_OutboundEventsLevel() {
        result := ComCall(11, this, "int*", &pOutboundEventLevel := 0, "HRESULT")
        return pOutboundEventLevel
    }

    /**
     * The IFaxEventLogging::get_OutboundEventsLevel property indicates the level of detail at which the fax service logs events about outbound fax transmissions in the application log. (Put)
     * @remarks
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @param {FAX_LOG_LEVEL_ENUM} OutboundEventLevel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxeventlogging-put_outboundeventslevel
     */
    put_OutboundEventsLevel(OutboundEventLevel) {
        result := ComCall(12, this, FAX_LOG_LEVEL_ENUM, OutboundEventLevel, "HRESULT")
        return result
    }

    /**
     * The IFaxEventLogging::get_GeneralEventsLevel property indicates the level of detail at which the fax service logs general events in the application log. (Get)
     * @remarks
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @returns {FAX_LOG_LEVEL_ENUM} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxeventlogging-get_generaleventslevel
     */
    get_GeneralEventsLevel() {
        result := ComCall(13, this, "int*", &pGeneralEventLevel := 0, "HRESULT")
        return pGeneralEventLevel
    }

    /**
     * The IFaxEventLogging::get_GeneralEventsLevel property indicates the level of detail at which the fax service logs general events in the application log. (Put)
     * @remarks
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @param {FAX_LOG_LEVEL_ENUM} GeneralEventLevel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxeventlogging-put_generaleventslevel
     */
    put_GeneralEventsLevel(GeneralEventLevel) {
        result := ComCall(14, this, FAX_LOG_LEVEL_ENUM, GeneralEventLevel, "HRESULT")
        return result
    }

    /**
     * The IFaxEventLogging::Refresh method refreshes IFaxEventLogging interface information from the fax server.
     * @remarks
     * When the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxeventlogging">FaxEventLogging</a> method is called, any configuration changes made after the last <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxeventlogging-save-vb">IFaxEventLogging::Save</a> method call are lost.
     * 
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxeventlogging-refresh
     */
    Refresh() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * The IFaxEventLogging::Save method saves the IFaxEventLogging interface's data.
     * @remarks
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farMANAGE_CONFIG</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access rights.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxeventlogging-save
     */
    Save() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFaxEventLogging.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_InitEventsLevel := CallbackCreate(GetMethod(implObj, "get_InitEventsLevel"), flags, 2)
        this.vtbl.put_InitEventsLevel := CallbackCreate(GetMethod(implObj, "put_InitEventsLevel"), flags, 2)
        this.vtbl.get_InboundEventsLevel := CallbackCreate(GetMethod(implObj, "get_InboundEventsLevel"), flags, 2)
        this.vtbl.put_InboundEventsLevel := CallbackCreate(GetMethod(implObj, "put_InboundEventsLevel"), flags, 2)
        this.vtbl.get_OutboundEventsLevel := CallbackCreate(GetMethod(implObj, "get_OutboundEventsLevel"), flags, 2)
        this.vtbl.put_OutboundEventsLevel := CallbackCreate(GetMethod(implObj, "put_OutboundEventsLevel"), flags, 2)
        this.vtbl.get_GeneralEventsLevel := CallbackCreate(GetMethod(implObj, "get_GeneralEventsLevel"), flags, 2)
        this.vtbl.put_GeneralEventsLevel := CallbackCreate(GetMethod(implObj, "put_GeneralEventsLevel"), flags, 2)
        this.vtbl.Refresh := CallbackCreate(GetMethod(implObj, "Refresh"), flags, 1)
        this.vtbl.Save := CallbackCreate(GetMethod(implObj, "Save"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_InitEventsLevel)
        CallbackFree(this.vtbl.put_InitEventsLevel)
        CallbackFree(this.vtbl.get_InboundEventsLevel)
        CallbackFree(this.vtbl.put_InboundEventsLevel)
        CallbackFree(this.vtbl.get_OutboundEventsLevel)
        CallbackFree(this.vtbl.put_OutboundEventsLevel)
        CallbackFree(this.vtbl.get_GeneralEventsLevel)
        CallbackFree(this.vtbl.put_GeneralEventsLevel)
        CallbackFree(this.vtbl.Refresh)
        CallbackFree(this.vtbl.Save)
    }
}
