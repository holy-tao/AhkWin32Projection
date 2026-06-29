#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDispLatLongReport.ahk" { IDispLatLongReport }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ILocationReportFactory.ahk" { ILocationReportFactory }

/**
 * @namespace Windows.Win32.Devices.Geolocation
 */
export default struct ILatLongReportFactory extends ILocationReportFactory {
    /**
     * The interface identifier for ILatLongReportFactory
     * @type {Guid}
     */
    static IID := Guid("{3f0804cb-b114-447d-83dd-390174ebb082}")

    /**
     * The class identifier for LatLongReportFactory
     * @type {Guid}
     */
    static CLSID := Guid("{9dcc3cc8-8609-4863-bad4-03601f4c65e8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ILatLongReportFactory interfaces
    */
    struct Vtbl extends ILocationReportFactory.Vtbl {
        get_LatLongReport : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ILatLongReportFactory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IDispLatLongReport} 
     */
    LatLongReport {
        get => this.get_LatLongReport()
    }

    /**
     * 
     * @returns {IDispLatLongReport} 
     */
    get_LatLongReport() {
        result := ComCall(15, this, "ptr*", &pVal := 0, "HRESULT")
        return IDispLatLongReport(pVal)
    }

    Query(iid) {
        if (ILatLongReportFactory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_LatLongReport := CallbackCreate(GetMethod(implObj, "get_LatLongReport"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_LatLongReport)
    }
}
