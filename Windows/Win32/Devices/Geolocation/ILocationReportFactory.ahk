#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Devices.Geolocation
 */
export default struct ILocationReportFactory extends IDispatch {
    /**
     * The interface identifier for ILocationReportFactory
     * @type {Guid}
     */
    static IID := Guid("{2daec322-90b2-47e4-bb08-0da841935a6b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ILocationReportFactory interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        ListenForReports        : IntPtr
        StopListeningForReports : IntPtr
        get_Status              : IntPtr
        get_ReportInterval      : IntPtr
        put_ReportInterval      : IntPtr
        get_DesiredAccuracy     : IntPtr
        put_DesiredAccuracy     : IntPtr
        RequestPermissions      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ILocationReportFactory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * @type {Integer} 
     */
    ReportInterval {
        get => this.get_ReportInterval()
        set => this.put_ReportInterval(value)
    }

    /**
     * @type {Integer} 
     */
    DesiredAccuracy {
        get => this.get_DesiredAccuracy()
        set => this.put_DesiredAccuracy(value)
    }

    /**
     * 
     * @param {Integer} requestedReportInterval 
     * @returns {HRESULT} 
     */
    ListenForReports(requestedReportInterval) {
        result := ComCall(7, this, "uint", requestedReportInterval, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StopListeningForReports() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        result := ComCall(9, this, "uint*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReportInterval() {
        result := ComCall(10, this, "uint*", &pMilliseconds := 0, "HRESULT")
        return pMilliseconds
    }

    /**
     * 
     * @param {Integer} millisecondsRequested 
     * @returns {HRESULT} 
     */
    put_ReportInterval(millisecondsRequested) {
        result := ComCall(11, this, "uint", millisecondsRequested, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DesiredAccuracy() {
        result := ComCall(12, this, "uint*", &pDesiredAccuracy := 0, "HRESULT")
        return pDesiredAccuracy
    }

    /**
     * 
     * @param {Integer} desiredAccuracy 
     * @returns {HRESULT} 
     */
    put_DesiredAccuracy(desiredAccuracy) {
        result := ComCall(13, this, "uint", desiredAccuracy, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} _hWnd 
     * @returns {HRESULT} 
     */
    RequestPermissions(_hWnd) {
        _hWndMarshal := _hWnd is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, _hWndMarshal, _hWnd, "HRESULT")
        return result
    }

    Query(iid) {
        if (ILocationReportFactory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ListenForReports := CallbackCreate(GetMethod(implObj, "ListenForReports"), flags, 2)
        this.vtbl.StopListeningForReports := CallbackCreate(GetMethod(implObj, "StopListeningForReports"), flags, 1)
        this.vtbl.get_Status := CallbackCreate(GetMethod(implObj, "get_Status"), flags, 2)
        this.vtbl.get_ReportInterval := CallbackCreate(GetMethod(implObj, "get_ReportInterval"), flags, 2)
        this.vtbl.put_ReportInterval := CallbackCreate(GetMethod(implObj, "put_ReportInterval"), flags, 2)
        this.vtbl.get_DesiredAccuracy := CallbackCreate(GetMethod(implObj, "get_DesiredAccuracy"), flags, 2)
        this.vtbl.put_DesiredAccuracy := CallbackCreate(GetMethod(implObj, "put_DesiredAccuracy"), flags, 2)
        this.vtbl.RequestPermissions := CallbackCreate(GetMethod(implObj, "RequestPermissions"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ListenForReports)
        CallbackFree(this.vtbl.StopListeningForReports)
        CallbackFree(this.vtbl.get_Status)
        CallbackFree(this.vtbl.get_ReportInterval)
        CallbackFree(this.vtbl.put_ReportInterval)
        CallbackFree(this.vtbl.get_DesiredAccuracy)
        CallbackFree(this.vtbl.put_DesiredAccuracy)
        CallbackFree(this.vtbl.RequestPermissions)
    }
}
