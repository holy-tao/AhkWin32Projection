#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ILocationReportFactory.ahk" { ILocationReportFactory }
#Import ".\IDispCivicAddressReport.ahk" { IDispCivicAddressReport }

/**
 * @namespace Windows.Win32.Devices.Geolocation
 */
export default struct ICivicAddressReportFactory extends ILocationReportFactory {
    /**
     * The interface identifier for ICivicAddressReportFactory
     * @type {Guid}
     */
    static IID := Guid("{bf773b93-c64f-4bee-beb2-67c0b8df66e0}")

    /**
     * The class identifier for CivicAddressReportFactory
     * @type {Guid}
     */
    static CLSID := Guid("{2a11f42c-3e81-4ad4-9cbe-45579d89671a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICivicAddressReportFactory interfaces
    */
    struct Vtbl extends ILocationReportFactory.Vtbl {
        get_CivicAddressReport : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICivicAddressReportFactory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IDispCivicAddressReport} 
     */
    CivicAddressReport {
        get => this.get_CivicAddressReport()
    }

    /**
     * 
     * @returns {IDispCivicAddressReport} 
     */
    get_CivicAddressReport() {
        result := ComCall(15, this, "ptr*", &pVal := 0, "HRESULT")
        return IDispCivicAddressReport(pVal)
    }

    Query(iid) {
        if (ICivicAddressReportFactory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_CivicAddressReport := CallbackCreate(GetMethod(implObj, "get_CivicAddressReport"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_CivicAddressReport)
    }
}
