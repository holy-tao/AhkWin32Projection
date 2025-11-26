#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDispCivicAddressReport.ahk
#Include .\ILocationReportFactory.ahk

/**
 * @namespace Windows.Win32.Devices.Geolocation
 * @version v4.0.30319
 */
class ICivicAddressReportFactory extends ILocationReportFactory{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICivicAddressReportFactory
     * @type {Guid}
     */
    static IID => Guid("{bf773b93-c64f-4bee-beb2-67c0b8df66e0}")

    /**
     * The class identifier for CivicAddressReportFactory
     * @type {Guid}
     */
    static CLSID => Guid("{2a11f42c-3e81-4ad4-9cbe-45579d89671a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 15

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CivicAddressReport"]

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
}
