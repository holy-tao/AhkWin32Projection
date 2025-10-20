#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class DICounterItem extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for DICounterItem
     * @type {Guid}
     */
    static IID => Guid("{c08c4ff2-0e2e-11cf-942c-008029004347}")

    /**
     * The class identifier for DICounterItem
     * @type {Guid}
     */
    static CLSID => Guid("{c08c4ff2-0e2e-11cf-942c-008029004347}")

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
