#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class DILogFileItem extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for DILogFileItem
     * @type {Guid}
     */
    static IID => Guid("{8d093ffc-f777-4917-82d1-833fbc54c58f}")

    /**
     * The class identifier for DILogFileItem
     * @type {Guid}
     */
    static CLSID => Guid("{8d093ffc-f777-4917-82d1-833fbc54c58f}")

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
