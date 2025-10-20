#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Devices.Geolocation
 * @version v4.0.30319
 */
class _ILatLongReportFactoryEvents extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for _ILatLongReportFactoryEvents
     * @type {Guid}
     */
    static IID => Guid("{16ee6cb7-ab3c-424b-849f-269be551fcbc}")

    /**
     * The class identifier for _ILatLongReportFactoryEvents
     * @type {Guid}
     */
    static CLSID => Guid("{16ee6cb7-ab3c-424b-849f-269be551fcbc}")

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
