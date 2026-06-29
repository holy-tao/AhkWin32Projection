#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IFaxEventLogging.ahk" { IFaxEventLogging }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IFaxActivityLogging.ahk" { IFaxActivityLogging }

/**
 * The IFaxLoggingOptions interface is used by a fax client application to access and configure the event logging categories and the activity logging options that the fax service is using.
 * @remarks
 * To create a <b>FaxLoggingOptions</b> object in C++, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxserver-loggingoptions">LoggingOptions</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nn-faxcomex-ifaxloggingoptions
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct IFaxLoggingOptions extends IDispatch {
    /**
     * The interface identifier for IFaxLoggingOptions
     * @type {Guid}
     */
    static IID := Guid("{34e64fb9-6b31-4d32-8b27-d286c0c33606}")

    /**
     * The class identifier for FaxLoggingOptions
     * @type {Guid}
     */
    static CLSID := Guid("{1bf9eea6-ece0-4785-a18b-de56e9eef96a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFaxLoggingOptions interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_EventLogging    : IntPtr
        get_ActivityLogging : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFaxLoggingOptions.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IFaxEventLogging} 
     */
    EventLogging {
        get => this.get_EventLogging()
    }

    /**
     * @type {IFaxActivityLogging} 
     */
    ActivityLogging {
        get => this.get_ActivityLogging()
    }

    /**
     * The EventLogging property retrieves the FaxEventLogging configuration object.
     * @returns {IFaxEventLogging} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxloggingoptions-get_eventlogging
     */
    get_EventLogging() {
        result := ComCall(7, this, "ptr*", &pFaxEventLogging := 0, "HRESULT")
        return IFaxEventLogging(pFaxEventLogging)
    }

    /**
     * The ActivityLogging property retrieves the FaxActivityLogging configuration object.
     * @returns {IFaxActivityLogging} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxloggingoptions-get_activitylogging
     */
    get_ActivityLogging() {
        result := ComCall(8, this, "ptr*", &pFaxActivityLogging := 0, "HRESULT")
        return IFaxActivityLogging(pFaxActivityLogging)
    }

    Query(iid) {
        if (IFaxLoggingOptions.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_EventLogging := CallbackCreate(GetMethod(implObj, "get_EventLogging"), flags, 2)
        this.vtbl.get_ActivityLogging := CallbackCreate(GetMethod(implObj, "get_ActivityLogging"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_EventLogging)
        CallbackFree(this.vtbl.get_ActivityLogging)
    }
}
