#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class DISystemMonitorInternal extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for DISystemMonitorInternal
     * @type {Guid}
     */
    static IID => Guid("{194eb242-c32c-11cf-9398-00aa00a3ddea}")

    /**
     * The class identifier for DISystemMonitorInternal
     * @type {Guid}
     */
    static CLSID => Guid("{194eb242-c32c-11cf-9398-00aa00a3ddea}")

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
