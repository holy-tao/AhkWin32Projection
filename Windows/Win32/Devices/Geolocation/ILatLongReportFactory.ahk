#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ILocationReportFactory.ahk

/**
 * @namespace Windows.Win32.Devices.Geolocation
 * @version v4.0.30319
 */
class ILatLongReportFactory extends ILocationReportFactory{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILatLongReportFactory
     * @type {Guid}
     */
    static IID => Guid("{3f0804cb-b114-447d-83dd-390174ebb082}")

    /**
     * The class identifier for LatLongReportFactory
     * @type {Guid}
     */
    static CLSID => Guid("{9dcc3cc8-8609-4863-bad4-03601f4c65e8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 15

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_LatLongReport"]

    /**
     * 
     * @param {Pointer<IDispLatLongReport>} pVal 
     * @returns {HRESULT} 
     */
    get_LatLongReport(pVal) {
        result := ComCall(15, this, "ptr*", pVal, "HRESULT")
        return result
    }
}
