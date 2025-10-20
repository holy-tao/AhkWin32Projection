#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class _IInkEditEvents extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for _IInkEditEvents
     * @type {Guid}
     */
    static IID => Guid("{e3b0b797-a72e-46db-a0d7-6c9eba8e9bbc}")

    /**
     * The class identifier for _IInkEditEvents
     * @type {Guid}
     */
    static CLSID => Guid("{e3b0b797-a72e-46db-a0d7-6c9eba8e9bbc}")

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
