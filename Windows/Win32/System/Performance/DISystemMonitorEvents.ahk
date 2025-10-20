#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class DISystemMonitorEvents extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for DISystemMonitorEvents
     * @type {Guid}
     */
    static IID => Guid("{84979930-4ab3-11cf-943a-008029004347}")

    /**
     * The class identifier for DISystemMonitorEvents
     * @type {Guid}
     */
    static CLSID => Guid("{84979930-4ab3-11cf-943a-008029004347}")

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
