#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Devices.Geolocation
 * @version v4.0.30319
 */
class _ICivicAddressReportFactoryEvents extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for _ICivicAddressReportFactoryEvents
     * @type {Guid}
     */
    static IID => Guid("{c96039ff-72ec-4617-89bd-84d88bedc722}")

    /**
     * The class identifier for _ICivicAddressReportFactoryEvents
     * @type {Guid}
     */
    static CLSID => Guid("{c96039ff-72ec-4617-89bd-84d88bedc722}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
